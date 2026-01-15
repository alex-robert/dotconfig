return {
  {
    "tpope/vim-dadbod",
    lazy = true,
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
    config = function()
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error == 0 then
        vim.g.db_ui_save_location = git_root .. "/.dbui"
      end
    end,
    init = function()
      vim.g.db_ui_save_location = vim.fn.getcwd() .. "/.dbui"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 50
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_use_postgres_view = 0

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

      vim.keymap.set("n", "<leader>Do", open_dbui_in_tab, { desc = "Open Database UI in new tab" })
      vim.keymap.set("n", "<leader>Dc", close_dbui_tab, { desc = "Close Database tab" })
      vim.keymap.set("n", "<leader>Dt", ":DBUIToggle<CR>", { desc = "Toggle Database Drawer" })

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
          vim.wo.number = false
          vim.wo.relativenumber = false
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbui",
        callback = function()
          vim.wo.winfixbuf = true
        end,
      })

      vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
        pattern = "*",
        callback = function(args)
          local buf = args.buf
          local filetype = vim.bo[buf].filetype

          if filetype == "dbout" then
            print("DEBUG: dbout detected, buf=" .. buf)

            vim.api.nvim_set_hl(0, "DBResultOddRow", { bg = "#1a1a1a" })

            vim.defer_fn(function()
              if not vim.api.nvim_buf_is_valid(buf) then
                print("DEBUG: buffer not valid")
                return
              end

              vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

              local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
              local ns_id = vim.api.nvim_create_namespace("db_result_rows")

              print("DEBUG: total lines=" .. #lines)

              local header_line = 0
              for i, line in ipairs(lines) do
                if line:match("^%-+") then
                  header_line = i
                  print("DEBUG: found header at line " .. i)
                  break
                end
              end

              local colored_count = 0
              for i = header_line + 1, #lines do
                local line = lines[i]
                if line and line ~= "" and not line:match("^%-+") then
                  local row_num = i - header_line - 1
                  if (row_num % 2 == 0) then
                    vim.hl.range(buf, ns_id,"DBResultOddRow", { i - 1, 0 }, { i - 1, -1 })
                    colored_count = colored_count + 1
                  end
                end
              end
              print("DEBUG: colored " .. colored_count .. " rows")
            end, 100)
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
