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
local no_light  = function() return not vim.g.light end
local full_only = function() return not vim.g.vscode and not vim.g.light end

require("lazy").setup({
  -- Core editing — always loaded (VSCode, light, full Neovim)
  {import = "plugins.mini-ai"},
  {import = "plugins.mini-keymap"},
  {import = "plugins.mini-move"},
  {import = "plugins.mini-pairs"},
  {import = "plugins.mini-splitjoin"},
  {import = "plugins.mini-surround"},
  {import = "plugins.mini-trailspace"},
  {import = "plugins.mini-utils"},

  -- VSCode + full Neovim (not light — too heavy for $EDITOR use)
  {import = "plugins.treesitter",    cond = no_light},
  {import = "plugins.ts-autotag",    cond = no_light},

  -- Standalone Neovim only (light + full, not VSCode)
  {import = "plugins.codestats",     cond = no_vscode},

  -- Full Neovim only (not VSCode, not light)
  {import = "plugins.ccc",           cond = full_only},
  {import = "plugins.dap",           cond = full_only},
  {import = "plugins.gitsigns",      cond = full_only},
  {import = "plugins.ibl",           cond = full_only},
  {import = "plugins.lsp",           cond = full_only},
  {import = "plugins.lualine",       cond = full_only},
  {import = "plugins.markdown",      cond = full_only},
  {import = "plugins.mini-files",    cond = full_only},
  {import = "plugins.mini-icons",    cond = full_only},
  {import = "plugins.mini-sessions", cond = full_only},
  -- {import = "plugins.mini-map",   cond = full_only},
  {import = "plugins.noice",         cond = full_only},
  {import = "plugins.scope",         cond = full_only},
  {import = "plugins.snacks",        cond = full_only},
  {import = "plugins.telescope",     cond = full_only},
  {import = "plugins.themery",       cond = full_only},
  {import = "plugins.trouble",       cond = full_only},
  {import = "plugins.which-key",     cond = full_only},
  -- {"https://github.com/Weyaaron/nvim-training", pin= true, opts = {}}
})
