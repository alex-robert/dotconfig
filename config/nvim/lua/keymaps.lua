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

-- -- Visual mode movement
keymap.set("v", "i", "k", { desc = "Move up" })
keymap.set("v", "j", "h", { desc = "Move left" })
keymap.set("v", "k", "j", { desc = "Move down" })
keymap.set("v", "l", "l", { desc = "Move right" })

-- -- Word movement with custom keys
keymap.set("n", "I", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "J", "b", { desc = "Move word backward" })
keymap.set("n", "K", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-- -- Preserve original 'e' functionality (end of word) - remap to 'w'
keymap.set("n", "w", "e", { desc = "Move to end of word" })
keymap.set("n", "W", "E", { desc = "Move to end of WORD" })

-- -- Window navigation (splits)
keymap.set("n", "<C-w>i", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<C-w>j", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-w>k", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<C-w>l", "<C-w>l", { desc = "Go to right window" })

-- Window management
keymap.set("n", "<C-w>v", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<C-w>h", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<C-w>e", "<C-w>=", { desc = "Equal window sizes" })
keymap.set("n", "<C-w>t", "<C-w>T", { desc = "Send current window to new tab" })
keymap.set("n", "<C-w>x", ":close<CR>", { desc = "Close current split" })
--
-- Tab managements
keymap.set("n", "<C-c>l", "<Cmd>tabnext<CR>", { desc = "Got to next tab"})
keymap.set("n", "<C-c>j", "<Cmd>tabprevious<CR>", { desc = "Got to previous tab"})
keymap.set("n", "<C-c>w", "<Cmd>tabclose<CR>", { desc = "Close tab"})

vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("tabnew")
  require("telescope.builtin").find_files()
end, { desc = "New tab with file picker" })


-- Clear search highlighting
-- keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down (adapted for IJKL)
-- keymap.set("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
-- keymap.set("n", "<A-i>", ":m .-2<CR>==", { desc = "Move line up" })
-- keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- keymap.set("v", "<A-i>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

keymap.set("n", "<C-x>l", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-x>j", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-x>x", ":bdelete<CR>", { desc = "Delete buffer" })
-- AZERTY-friendly command mode access
-- On AZERTY, semicolon is easier to type than colon
-- keymap.set("n", ";", ":", { noremap = true, desc = "Command mode" })
-- keymap.set("v", ";", ":", { noremap = true, desc = "Command mode" })

-- AZERTY-friendly text objects (brackets are hard to reach on AZERTY)
-- Operator-pending mode shortcuts for common text objects
-- keymap.set("o", "iq", 'i"', { desc = "Inner double quotes" })
-- keymap.set("o", "aq", 'a"', { desc = "Around double quotes" })
-- keymap.set("o", "iz", "i'", { desc = "Inner single quotes" })
-- keymap.set("o", "az", "a'", { desc = "Around single quotes" })
-- keymap.set("o", "ip", "i(", { desc = "Inner parentheses" })
-- keymap.set("o", "ap", "a(", { desc = "Around parentheses" })
-- keymap.set("o", "ib", "i{", { desc = "Inner braces" })
-- keymap.set("o", "ab", "a{", { desc = "Around braces" })
-- keymap.set("o", "ir", "i[", { desc = "Inner brackets" })
-- keymap.set("o", "ar", "a[", { desc = "Around brackets" })

-- -- Visual mode text objects
-- keymap.set("v", "iq", 'i"', { desc = "Inner double quotes" })
-- keymap.set("v", "aq", 'a"', { desc = "Around double quotes" })
-- keymap.set("v", "iz", "i'", { desc = "Inner single quotes" })
-- keymap.set("v", "az", "a'", { desc = "Around single quotes" })
-- keymap.set("v", "ip", "i(", { desc = "Inner parentheses" })
-- keymap.set("v", "ap", "a(", { desc = "Around parentheses" })
-- keymap.set("v", "ib", "i{", { desc = "Inner braces" })
-- keymap.set("v", "ab", "a{", { desc = "Around braces" })
-- keymap.set("v", "ir", "i[", { desc = "Inner brackets" })
-- keymap.set("v", "ar", "a[", { desc = "Around brackets" })


_G.Config.utils.nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>', 'Root Directory')
_G.Config.utils.nmap_leader('eed', '<Cmd>lua MiniFiles.open(nil, false)<CR>', 'Root Directory (clean)')
_G.Config.utils.nmap_leader('ef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', 'Curent File Directory')
_G.Config.utils.nmap_leader('eef', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>', 'Curent File Directory (clean)')
_G.Config.utils.nmap_leader('eef', '<Cmd>lua MiniFiles.open(MiniFiles.get_latest_path()), false)<CR>', 'Last used Directory')

_G.Config.utils.nmap_leader('ot', '<Cmd>lua MiniTrailspace.trim()<CR>', 'Trim all trailing whitespace')
_G.Config.utils.nmap_leader('ot', '<Cmd>lua MiniTrailspace.trim()<CR>', 'Trim all trailing whitespace')


_G.Config.utils.nmap_leader('tp', '<Cmd>tabprevious<CR>', 'Go to previous tab')
_G.Config.utils.nmap_leader('tn', '<Cmd>tabnext<CR>', 'Go to next tab')
