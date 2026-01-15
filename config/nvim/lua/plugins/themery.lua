return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
       themes = {"arctic", "miasma", "bluloco-dark", "bluloco-light", "vaporlush"},
       livePreview = true,
     })
    end
}
