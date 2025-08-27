local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Custom Movement Keys (your preference: i,j,k,l)
-- Normal mode
keymap.set("n", "i", "k", { desc = "Move up" })     -- i = up
keymap.set("n", "j", "h", { desc = "Move left" })   -- j = left
keymap.set("n", "k", "j", { desc = "Move down" })   -- k = down
keymap.set("n", "l", "l", { desc = "Move right" })  -- l = right (stays same)

-- Use 'e' for insert mode (edit mode)
keymap.set("n", "e", "i", { desc = "Enter insert mode (edit)" })
keymap.set("n", "E", "I", { desc = "Insert at beginning of line" })

-- Visual mode movement
keymap.set("v", "i", "k", { desc = "Move up" })
keymap.set("v", "j", "h", { desc = "Move left" })
keymap.set("v", "k", "j", { desc = "Move down" })
keymap.set("v", "l", "l", { desc = "Move right" })

-- Word movement with your custom keys
keymap.set("n", "I", "gk", { desc = "Move up faster" })    -- Shift+i for up movement
keymap.set("n", "J", "b", { desc = "Move word backward" })  -- Shift+j for word left
keymap.set("n", "K", "gj", { desc = "Move down faster" })   -- Shift+k for down movement  
keymap.set("n", "L", "w", { desc = "Move word forward" })   -- Shift+l for word right

-- Preserve original 'e' functionality (end of word) - remap to 'w'
keymap.set("n", "w", "e", { desc = "Move to end of word" })
keymap.set("n", "W", "E", { desc = "Move to end of WORD" })

-- Window navigation (when you have splits)
keymap.set("n", "<leader>i", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<leader>j", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<leader>k", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Essential shortcuts
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- File explorer
keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })

-- Clear search highlighting
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
