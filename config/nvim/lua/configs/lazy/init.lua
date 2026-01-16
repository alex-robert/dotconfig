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
  {import = "plugins.mini-ai"},
  {import = "plugins.mini-files"},
  {import = "plugins.mini-icons"},
  {import = "plugins.mini-keymap"},
  {import = "plugins.mini-map"},
  {import = "plugins.mini-utils"},
  {import = "plugins.mini-move"},
  {import = "plugins.mini-pairs"},
  {import = "plugins.mini-sessions"},
  {import = "plugins.mini-splitjoin"},
  {import = "plugins.mini-surround"},
  -- {import = "plugins.mini-tabline"},
  {import = "plugins.mini-trailspace"},
  -- {
  --   "rockyzhang24/arctic.nvim",
  --   dependencies = { "rktjmp/lush.nvim" },
  --   priority = 1000,
  -- },
  -- {
  --   "xero/miasma.nvim",
  --   priority = 1000,
  -- },
  -- {
  --   'kunzaatko/nord.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = {'rktjmp/lush.nvim'},
  -- },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
  },
  {import = "plugins.which-key"},
  {import = "plugins.treesitter"},
  {import = "plugins.lsp"},
  {import = "plugins.dap"},
  {import = "plugins.ccc"},
  {import = "plugins.telescope"},
  {import = "plugins.markdown"},
  {import = "plugins.codestats"},
  {import = "plugins.lualine"},
  {import = "plugins.snacks"},
  {import = "plugins.snacks-dashboard"},
  {import = "plugins.gitsigns"},
  {import = "plugins.trouble"},
  {import = "plugins.noice"},
  {import = "plugins.ibl"},
  {import = "plugins.scope"},
  -- {import = "plugins.auto-session"},
  -- {import = "plugins.nvim-training"},
})
