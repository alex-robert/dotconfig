return {
    "zaldih/themery.nvim",
    cmd = 'Themery',
    lazy = true,
    config = function()
      require("themery").setup({
       themes = {"arctic","vscode" },
       livePreview = true,
     })
    end
}
