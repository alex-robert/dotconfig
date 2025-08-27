return {  
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comment toggle
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
}
