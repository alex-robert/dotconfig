return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>oo",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Outline (Trouble)",
    },
    config = function()
      require('trouble').setup()
    end
  }
}
