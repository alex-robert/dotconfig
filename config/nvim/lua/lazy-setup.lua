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

local no_vscode = function() return not vim.g.vscode end

require("lazy").setup({
  -- Editing enhancements — always loaded, work in VSCode too
  {import = "plugins.mini-ai"},
  {import = "plugins.mini-keymap"},
  {import = "plugins.mini-move"},
  {import = "plugins.mini-pairs"},
  {import = "plugins.mini-splitjoin"},
  {import = "plugins.mini-surround"},
  {import = "plugins.mini-trailspace"},
  {import = "plugins.mini-utils"},
  {import = "plugins.treesitter"},
  {import = "plugins.ts-autotag"},
  {import = "plugins.codestats",     cond = no_vscode},

  -- Standalone Neovim only
  {import = "plugins.ccc",           cond = no_vscode},
  {import = "plugins.dap",           cond = no_vscode},
  {import = "plugins.gitsigns",      cond = no_vscode},
  {import = "plugins.ibl",           cond = no_vscode},
  {import = "plugins.lsp",           cond = no_vscode},
  {import = "plugins.lualine",       cond = no_vscode},
  {import = "plugins.markdown",      cond = no_vscode},
  {import = "plugins.mini-files",    cond = no_vscode},
  {import = "plugins.mini-icons",    cond = no_vscode},
  {import = "plugins.mini-sessions", cond = no_vscode},
  -- {import = "plugins.mini-map",   cond = no_vscode},
  {import = "plugins.noice",         cond = no_vscode},
  {import = "plugins.scope",         cond = no_vscode},
  {import = "plugins.snacks",        cond = no_vscode},
  {import = "plugins.telescope",     cond = no_vscode},
  {import = "plugins.themery",       cond = no_vscode},
  {import = "plugins.trouble",       cond = no_vscode},
  {import = "plugins.which-key",     cond = no_vscode},
  -- {"https://github.com/Weyaaron/nvim-training", pin= true, opts = {}}
})
