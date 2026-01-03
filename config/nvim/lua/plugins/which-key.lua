return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
      })

      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffer" },
        { "<leader>s", group = "Split" },
        { "<leader>t", group = "Tree/Tab" },
        { "<leader>g", group = "Git" },
        { "<leader>c", group = "Code" },
        { "<leader>m", group = "Multi-cursor" },
      })
    end,
  },
}
