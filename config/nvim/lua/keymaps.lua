local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Word movement with Shift
keymap.set("n", "H", "b", { desc = "Move word backward" })
keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-- Window navigation (splits)
keymap.set("n", "<C-w>h", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-w>j", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-w>k", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-w>l", "<C-w>l", { desc = "Go to right split" })

-- Window management
keymap.set("n", "<C-w>v", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<C-w>s", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<C-w>e", "<C-w>=", { desc = "Equal window sizes" })
keymap.set("n", "<C-w>t", "<C-w>T", { desc = "Send current window to new tab" })
keymap.set("n", "<C-w>x", ":close<CR>", { desc = "Close current window" })

-- Tab management
keymap.set("n", "<C-c>l", "<Cmd>tabnext<CR>", { desc = "Go to next tab"})
keymap.set("n", "<C-c>h", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab"})
keymap.set("n", "<C-c>x", "<Cmd>tabclose<CR>", { desc = "Close tab"})

vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("tabnew")
  require("telescope.builtin").find_files()
end, { desc = "New tab with file picker" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Scratch / Buffer management
keymap.set("n", "<leader>sn", "<Cmd>enew<CR>", { desc = "New scratch buffer" })
keymap.set("n", "<leader>sw", function()
  vim.ui.input({ prompt = "Save as: " }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("saveas " .. filename)
    end
  end)
end, { desc = "Save buffer as..." })

keymap.set("n", "<C-x>l", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-x>h", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-x>x", ":bdelete<CR>", { desc = "Delete buffer" })

-- AZERTY-friendly text objects (brackets are hard to reach on AZERTY)
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

-- Tabs
keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", "<Cmd>tabnext<CR>", { desc = "Go to next tab" })
