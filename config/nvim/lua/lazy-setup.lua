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

local isNotVscodeDist = function() return not vim.g.vscode end
local isNotLightDist  = function() return not vim.g.light end
local isFullDist = function() return not vim.g.vscode and not vim.g.light end

require("lazy").setup({
  --#####################################################################
  -- ## Always load (light, full and VScode)
  {import = "plugins.mini-ai"},
  {import = "plugins.mini-keymap"},
  {import = "plugins.mini-utils"},
  {import = "plugins.mini-surround"},

  --#####################################################################
  -- ## Loads on terminal Nvim only (light + full, not in VSCode)
  {import = "plugins.codestats",     cond = isNotVscodeDist},
 
  --#####################################################################
  --## Loads in Full Nvim + VSCode (no light, too heavy for $EDITOR)
  {import = "plugins.treesitter",    cond = isNotLightDist},
  {import = "plugins.ts-autotag",    cond = isNotLightDist},

  --#####################################################################
  --## Loads for Full Nvim only (not inside VSCode and no light $EDITOR)
  {import = "plugins.dap",             cond = isFullDist},
  {import = "plugins.gitsigns",        cond = isFullDist},
  {import = "plugins.ibl",             cond = isFullDist},
  {import = "plugins.lsp",             cond = isFullDist},
  {import = "plugins.lualine",         cond = isFullDist},
  {import = "plugins.markdown",        cond = isFullDist},
  -- {import = "plugins.mini-files",      cond = isFullDist},
  {import = "plugins.mini-move",       cond = isFullDist},
  {import = "plugins.mini-pairs",      cond = isFullDist},
  {import = "plugins.mini-splitjoin",  cond = isFullDist},
  {import = "plugins.mini-trailspace", cond = isFullDist},
  {import = "plugins.mini-icons",      cond = isFullDist},
  {import = "plugins.mini-sessions",   cond = isFullDist},
  {import = "plugins.mini-hipatterns", cond = isFullDist},
  {import = "plugins.mini-map",        cond = isFullDist},
  {import = "plugins.mini-clue",       cond = isFullDist},
  -- {import = "plugins.mini-completion", cond = isFullDist},
  -- {import = "plugins.which-key",       cond = isFullDist},
  -- {import = "plugins.noice",           cond = isFullDist},
  {import = "plugins.scope",           cond = isFullDist},
  {import = "plugins.snacks",          cond = isFullDist},
  {import = "plugins.dressing",        cond = isFullDist},
  {import = "plugins.telescope",       cond = isFullDist},
  -- {import = "plugins.themery",         cond = isFullDist},
  {import = "plugins.trouble",         cond = isFullDist},
  {import = "plugins.yazi",            cond = isFullDist},
})
