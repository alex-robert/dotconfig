return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = {
        enabled = true,
        configure = true,
      },
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = true,
          git_hl = true,
        },
        git = {
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50,
      },
      dashboard = {
        enabled = true,
        sections = {
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        }
      }
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit (Root Dir)" },
      { "<leader>gG", function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit (cwd)" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit File History" },},
    },
  }
