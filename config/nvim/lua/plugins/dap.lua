return {
  {
    "mfussenegger/nvim-dap",
    -- dependencies = {
      --   "williamboman/mason.nvim",
      -- },
      keys = {
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue/Start debugging" },
        -- { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
        { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
        { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
        { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
        { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      },
      config = function()
        local dap = require("dap")
        local config_dir = vim.fn.stdpath("config")

        -- Comment to load configurations from .vscode/launch.json files
        dap.providers.configs["dap.launch.json"] = nil

        -- Configure breakpoint signs
        vim.fn.sign_define('DapBreakpoint', { text='', texthl='GitSignsDelete', linehl='', numhl='' })
        vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='GitSignsChange', linehl='', numhl='' })
        vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='GitSignsDeleteLn', linehl='', numhl='' })
        vim.fn.sign_define('DapStopped', { text='󱉺', texthl='', linehl='debugPC', numhl='' })



        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = { config_dir .. "/debugers/js-debug/src/dapDebugServer.js", "${port}" },
          }
        }

        dap.configurations.javascript = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
          },
        }

        dap.configurations.typescript = dap.configurations.javascript

        -- Auto-open REPL console when debugging starts
        dap.listeners.after.event_initialized["dap_repl"] = function()
          require("dap").repl.open()

          vim.schedule(function()
            -- Move REPL to vertical split on the right
            vim.cmd("wincmd L")

            -- Find terminal window and move it to horizontal split at bottom
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
                vim.api.nvim_set_current_win(win)
                vim.cmd("wincmd J")
              end
            end
          end)
        end
        dap.listeners.before.event_terminated["dap_repl"] = function()
          require("dap").repl.close()
        end
        dap.listeners.before.event_exited["dap_repl"] = function()
          require("dap").repl.close()
        end


      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      dependencies = { "mfussenegger/nvim-dap" },
      config = function()
        require("nvim-dap-virtual-text").setup({
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = false,
          show_stop_reason = true,
          commented = false,
        })
      end,
    },
}
