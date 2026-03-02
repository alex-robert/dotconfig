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

      -- Leader groups
      wk.add({
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Lsp" },
        { "<leader>cf", desc = "Format buffer" },
        { "<leader>d", group = "Debug" },
        { "<leader>e", group = "Explore" },
        { "<leader>f", group = "Find" },
        { "<leader>l", group = "Line Numbers" },
        { "<leader>m", group = "Markdown utils" },
        { "<leader>o", group = "Code Utilities" },
        { "<leader>r", group = "Rename" },
        { "<leader>s", group = "Scratchpad" },
        { "<leader>S", group = "Sessions" },
        { "<leader>t", group = "Tabs" },
        { "<leader>g", group = "Git & LSP" },
      })

      -- LSP (g prefix)
      wk.add({
        { "<leader>gd", desc = "Go to definition" },
        { "<leader>gr", desc = "Go to references" },
        { "<leader>gD", desc = "Go to declaration" },
        { "<leader>gt", desc = "Go to type definition" },
        { "<leader>gh", desc = "Hover documentation" },
        { "<leader>[d", desc = "Previous diagnostic" },
        { "<leader>]d", desc = "Next diagnostic" },
      })

      -- Surround (s prefix)
      wk.add({
        { "s", group = "Surround", mode = { "n", "v" } },
        { "sa", group = "Add surround", mode = { "n", "v" } },

        { "saw", desc = "word" },
        { "saW", desc = "WORD" },
        { "sas", desc = "sentence" },
        { "sap", desc = "paragraph" },
        { "saip", desc = "inner ()" },
        { "saib", desc = "inner {}" },
        { "sair", desc = "inner []" },
        { "saap", desc = "around ()" },
        { "saab", desc = "around {}" },
        { "saar", desc = "around []" },
        { "sait", desc = "inner tag" },
        { "saat", desc = "around tag" },
        { "saF", desc = "function" },
        { "saB", desc = "buffer" },

        { "sd", desc = "Delete surround" },
        { "sf", desc = "Find surround right" },
        { "sF", desc = "Find surround left" },
        { "sh", desc = "Highlight surround" },
        { "sn", desc = "Update n_lines" },
        { "sr", desc = "Replace surround" },
      })
    end,
  },
}
