return {
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    branch = "v2",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("arctic")
    end,
  },
}
