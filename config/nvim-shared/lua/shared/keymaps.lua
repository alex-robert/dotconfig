local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set({ "n", "v" }, "<Up>", "<nop>")
keymap.set({ "n", "v" }, "<Down>", "<nop>")
keymap.set({ "n", "v" }, "<Left>", "<nop>")
keymap.set({ "n", "v" }, "<Right>", "<nop>")

keymap.set("n", "H", "b", { desc = "Move word backward" })
keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-- Split navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Split management
keymap.set("n", "<C-M-v>", ":vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<C-M-h>", ":split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<C-M-e>", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<C-M-w>", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-w>v", ":vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<C-w>h", ":split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<C-w>e", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<C-w>w", ":close<CR>", { desc = "Close current window" })

-- Buffer navigation (C-M + qd for horizontal movement)
keymap.set("n", "<C-M-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-M-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-M-x>", ":bdelete<CR>", { desc = "Delete buffer" })

-- Better indent in visual
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Texts object_style
keymap.set("o", "ip", "i(", { desc = "Inner parentheses" })
keymap.set("o", "ib", "i{", { desc = "Inner braces" })
keymap.set("o", "ir", "i[", { desc = "Inner brackets" })
keymap.set("o", "ap", "a(", { desc = "Around parentheses" })
keymap.set("o", "ab", "a{", { desc = "Around braces" })
keymap.set("o", "ar", "a[", { desc = "Around brackets" })

keymap.set("x", "ip", "i(", { desc = "Inner parentheses" })
keymap.set("x", "ib", "i{", { desc = "Inner braces" })
keymap.set("x", "ir", "i[", { desc = "Inner brackets" })
keymap.set("x", "ap", "a(", { desc = "Around parentheses" })
keymap.set("x", "ab", "a{", { desc = "Around braces" })
keymap.set("x", "ar", "a[", { desc = "Around brackets" })
