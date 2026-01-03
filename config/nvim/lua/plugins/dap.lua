return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")

      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue/Start debugging" })
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
      vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step over" })
      vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, { desc = "Step out" })
      vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run last" })
      vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })

      vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='', linehl='', numhl='' })
      vim.fn.sign_define('DapBreakpointCondition', { text='🟡', texthl='', linehl='', numhl='' })
      vim.fn.sign_define('DapBreakpointRejected', { text='🚫', texthl='', linehl='', numhl='' })
      vim.fn.sign_define('DapStopped', { text='▶️', texthl='', linehl='debugPC', numhl='' })
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "js-debug-adapter",
          "debugpy",
        },
        automatic_installation = true,
        handlers = {},
      })
    end,
  },
}
