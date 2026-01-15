return {
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
      { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
      { "<leader>wd", "<cmd>AutoSession delete<CR>", desc = "Delete Session" },
    },
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/", "~/Documents", "~/OneDrive" },
      bypass_save_filetypes = { "alpha", "dashboard", "nvim-tree", "neo-tree", "netrw" },
      show_auto_restore_notif = true,
      purge_after_minutes = 180,
      close_unsupported_windows = true,
      auto_delete_empty_sessions = true,
      auto_restore = false,
      auto_save = false,
      auto_create = false,
      legacy_cmds = false,
      session_lens = {
        picker = "telescope",
      },
    },
  },
}
