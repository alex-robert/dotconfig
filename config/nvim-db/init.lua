-- Minimal nvim config for database work with dadbod
vim.g.mapleader = " "

local keymap = vim.keymap

-- Movement with Shift
keymap.set("n", "H", "b", { desc = "Move word backward" })
keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-- Window navigation
keymap.set("n", "<C-w>h", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-w>j", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-w>k", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-w>l", "<C-w>l", { desc = "Go to right split" })

-- Window management
keymap.set("n", "<C-w>v", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<C-w>s", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<C-w>x", ":close<CR>", { desc = "Close current window" })

-- Buffer navigation
keymap.set("n", "<C-x>l", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-x>h", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-x>x", ":bdelete<CR>", { desc = "Delete buffer" })

-- Tab navigation (scoped per db)
keymap.set("n", "<C-c>l", "<Cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<C-c>h", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<C-c>x", "<Cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<C-c>n", "<Cmd>tabnew<CR><Cmd>DBUI<CR>", { desc = "New db tab" })

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
vim.opt.showmode = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

