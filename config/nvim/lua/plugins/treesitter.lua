return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
            "lua", 
            "vim", 
            "javascript", 
            "typescript",
            "tsx",
            "yaml",
            "json",
            "toml",
            "python", 
            "html", 
            "css", 
            "markdown", 
            "markdown_inline"
          },
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
  },
}
