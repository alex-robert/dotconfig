local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Custom Movement Keys (IJKL scheme for AZERTY keyboard)
-- Normal mode
keymap.set("n", "i", "k", { desc = "Move up" })
keymap.set("n", "j", "h", { desc = "Move left" })
keymap.set("n", "k", "j", { desc = "Move down" })
keymap.set("n", "l", "l", { desc = "Move right" })

-- Use 'e' for insert mode (edit mode)
keymap.set("n", "e", "i", { desc = "Enter insert mode" })
keymap.set("n", "E", "I", { desc = "Insert at beginning of line" })

-- Visual mode movement
keymap.set("v", "i", "k", { desc = "Move up" })
keymap.set("v", "j", "h", { desc = "Move left" })
keymap.set("v", "k", "j", { desc = "Move down" })
keymap.set("v", "l", "l", { desc = "Move right" })

-- Word movement with custom keys
keymap.set("n", "I", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "J", "b", { desc = "Move word backward" })
keymap.set("n", "K", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-- Preserve original 'e' functionality (end of word) - remap to 'w'
keymap.set("n", "w", "e", { desc = "Move to end of word" })
keymap.set("n", "W", "E", { desc = "Move to end of WORD" })

-- Window navigation (splits)
keymap.set("n", "<leader>i", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<leader>j", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<leader>k", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal window sizes" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Essential shortcuts
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit all" })
keymap.set("n", "<leader>x", ":xa<CR>", { desc = "Save and quit all" })

-- Reload config
keymap.set("n", "<leader>r", ":source $MYVIMRC<CR>", { desc = "Reload config" })

-- AZERTY-friendly force quit (f = force, easier than !)
vim.api.nvim_create_user_command("Qf", "qa!", {})
vim.api.nvim_create_user_command("Wf", "w!", {})
vim.api.nvim_create_user_command("Xf", "xa!", {})

-- Clear search highlighting
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down (adapted for IJKL)
keymap.set("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-i>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-i>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- AZERTY-friendly command mode access
-- On AZERTY, semicolon is easier to type than colon
keymap.set("n", ";", ":", { noremap = true, desc = "Command mode" })
keymap.set("v", ";", ":", { noremap = true, desc = "Command mode" })
-- Keep original : for repeat last f/t/F/T motion
-- (swapped - so typing : will repeat the motion)
