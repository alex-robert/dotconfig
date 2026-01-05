return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/", "~/Documents", "~/OneDrive" },
      bypass_save_filetypes = { "alpha", "dashboard", "nvim-tree", "neo-tree", "netrw" },
      close_unsupported_windows = true,
      auto_delete_empty_sessions = true,
      auto_restore = true,
      auto_save = true,
      auto_create = true,
    },
  },
}
