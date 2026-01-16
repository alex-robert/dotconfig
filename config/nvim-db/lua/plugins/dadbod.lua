return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.g.db_ui_save_location = vim.fn.getcwd() .. "/.dbui"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 50
      vim.g.db_ui_auto_execute_table_helpers = 1

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

      local function open_dbui_tab()
        vim.cmd("tabnew")
        vim.cmd("DBUI")
      end

      local function close_dbui_tab()
        vim.cmd("tabclose")
      end

      -- Keymaps
      vim.keymap.set("n", "<leader>o", open_dbui_tab, { desc = "New DB tab" })
      vim.keymap.set("n", "<leader>c", close_dbui_tab, { desc = "Close tab" })
      vim.keymap.set("n", "<leader>a", ":DBUIAddConnection<CR>", { desc = "Add connection" })
      vim.keymap.set("n", "<leader>t", ":DBUIToggle<CR>", { desc = "Toggle drawer" })
      vim.keymap.set("n", "<leader>f", ":DBUIFindBuffer<CR>", { desc = "Find buffer" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.keymap.set("n", "<leader>e", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "Execute query" })
          vim.keymap.set("v", "<leader>e", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "Execute selection" })
          vim.keymap.set("n", "<leader>w", ":w<CR>", { buffer = true, desc = "Save query" })
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

      -- Lock dbui drawer
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbui",
        callback = function()
          vim.wo.winfixbuf = true
        end,
      })

      -- Even/odd row coloration for results
      vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
        pattern = "*",
        callback = function(args)
          local buf = args.buf
          local filetype = vim.bo[buf].filetype

          if filetype ~= "dbout" then
            return
          end

          vim.api.nvim_set_hl(0, "DBResultOddRow", { bg = "#1a1a1a" })

          vim.defer_fn(function()
            if not vim.api.nvim_buf_is_valid(buf) then
              return
            end

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
                if (row_num % 2 == 0) then
                  vim.hl.range(buf, ns_id, "DBResultOddRow", { i - 1, 0 }, { i - 1, -1 })
                end
              end
            end
          end, 100)
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "kristijanhusak/vim-dadbod-completion",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
}
