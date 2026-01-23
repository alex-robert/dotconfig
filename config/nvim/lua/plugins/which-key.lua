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
        triggers = {
          { "<auto>", mode = "nxso" },
          { "s", mode = { "n", "v" } },
        },
      })

      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>e", group = "Explore" },
        { "<leader>b", group = "Buffer" },
        { "<leader>s", group = "Scratchpad" },
        -- { "<leader>S", group = "Sessions" },
        { "<leader>t", group = "Tabs" },
        { "<leader>g", group = "Git & General" },
        { "<leader>c", group = "Lsp" },
        { "<leader>o", group = "Code Utilities" },
        { "<leader>d", group = "Debug" },
        { "s", group = "Surround", mode = { "n", "v" } },
        { "sa", desc = "Add surround", mode = { "n", "v" } },
        { "sd", desc = "Delete surround" },
        { "sr", desc = "Replace surround" },
        { "sf", desc = "Find surround right" },
        { "sF", desc = "Find surround left" },
        { "sh", desc = "Highlight surround" },
        { "sn", desc = "Update n_lines" },
      })
    end,
  },
}
