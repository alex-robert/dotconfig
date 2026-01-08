return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      local function find_git_repo_name()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
         if vim.v.shell_error == 0 then
           return git_root
         end
         return nil
       end

      local git_root = find_git_repo_name()
       if git_root then
         vim.g.db_ui_save_location = git_root .. "/.dbui"
       else
         vim.g.db_ui_save_location = vim.fn.getcwd() .. "/.dbui"
       end

      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 35
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_use_nvim_notify = 1

      vim.g.db_ui_table_helpers = {
        postgresql = {
          Count = "select count(*) from {table}",
          Explain = "explain analyze {last_query}",
        },
        mysql = {
          Count = "select count(*) from {table}",
          Explain = "explain {last_query}",
        },
      }

      local function open_dbui_in_tab()
        -- Check if DBUI buffer exists in any tab
        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
            local buf = vim.api.nvim_win_get_buf(win)
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname:match("dbui") or vim.bo[buf].filetype == "dbui" then
              -- Found DBUI tab, switch to it
              vim.api.nvim_set_current_tabpage(tabpage)
              return
            end
          end
        end

        -- DBUI tab doesn't exist, create new tab and open DBUI
        vim.cmd("tabnew")
        vim.cmd("DBUI")
      end

      local function close_dbui_tab()
        -- Find and close the tab containing DBUI
        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
            local buf = vim.api.nvim_win_get_buf(win)
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname:match("dbui") or vim.bo[buf].filetype == "dbui" then
              -- Found DBUI tab, close it
              vim.api.nvim_set_current_tabpage(tabpage)
              vim.cmd("tabclose")
              return
            end
          end
        end
      end

      vim.keymap.set("n", "<leader>Dt", open_dbui_in_tab, { desc = "Open database UI" })
      vim.keymap.set("n", "<leader>Dc", close_dbui_tab, { desc = "Close database UI tab" })
      vim.keymap.set("n", "<leader>Df", ":DBUIFindBuffer<CR>", { desc = "Find database buffer" })
      vim.keymap.set("n", "<leader>Da", ":DBUIAddConnection<CR>", { desc = "Add database connection" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.keymap.set("n", "<leader>De", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "Execute query" })
          vim.keymap.set("v", "<leader>De", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "Execute selection" })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbout",
        callback = function()
          vim.cmd("resize " .. math.floor(vim.o.lines * 0.65))
        end,
      })

      vim.api.nvim_set_hl(0, "DBResultEvenRow", { bg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "DBResultOddRow", { bg = "#252525" })

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = "*.dbout",
        callback = function(args)
          local buf = args.buf
          local filetype = vim.bo[buf].filetype

          if filetype == "dbout" then
            local bufname = vim.api.nvim_buf_get_name(buf)
            if bufname:match("query%-result") or bufname:match("dbout") then
              vim.defer_fn(function()
                if not vim.api.nvim_buf_is_valid(buf) then return end

                vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

                local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
                local ns_id = vim.api.nvim_create_namespace("db_result_rows")

                local header_line = 0
                for i, line in ipairs(lines) do
                  if line:match("^%-+") then
                    header_line = i
                    break
                  end
                end

                for i = header_line + 1, #lines do
                  local line = lines[i]
                  if line and line ~= "" and not line:match("^%-+") then
                    local row_num = i - header_line - 1
                    local hl_group = (row_num % 2 == 0) and "DBResultEvenRow" or "DBResultOddRow"
                    vim.hl.range(buf, ns_id, hl_group, { i - 1, 0 }, { i - 1, -1 })
                  end
                end
              end, 100)
            end
          end
        end,
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = {
      "tpope/vim-dadbod",
      "hrsh7th/nvim-cmp",
    },
    ft = { "sql", "mysql", "plsql" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          local cmp = require("cmp")
          cmp.setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      })
    end,
  },
}
