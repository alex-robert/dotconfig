-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Load all plugin modules
require("lazy").setup({
  { import = "plugins.alpha-nvim" },
  { import = "plugins.arctic" },
  { import = "plugins.auto-session" },
  -- { import = "plugins.barbar" },
  { import = "plugins.codestats" },
  { import = "plugins.comment" },
  { import = "plugins.gitsigns" },
  { import = "plugins.lsp" },
  { import = "plugins.lualine" },
  { import = "plugins.markdown" },
  { import = "plugins.nvim-autopairs" },
  { import = "plugins.nvim-tree" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.vim-visual-multi" },
  { import = "plugins.which-key" },
  { import = "plugins.fine-cmd-line"},
  -- { import = "plugins.fine-searchbox"},
  { import = "plugins.dadbod"},

})
