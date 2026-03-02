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

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

keymap.set("n", "<C-M-v>", ":vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<C-M-h>", ":split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<C-M-e>", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<C-M-w>", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-w>v", ":vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<C-w>h", ":split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<C-w>e", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<C-w>w", ":close<CR>", { desc = "Close current window" })

keymap.set("n", "<C-M-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-M-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-M-x>", ":bdelete<CR>", { desc = "Delete buffer" })

keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

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

-- Save current buffer with Ctrl+S
keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save current buffer" })

-- Split + find file (C-w + f)
keymap.set("n", "<C-w>f", function()
  vim.cmd("vsplit")
  require("telescope.builtin").find_files()
end, { desc = "Vertical split + find file" })

keymap.set("n", "<C-w>F", function()
  vim.cmd("split")
  require("telescope.builtin").find_files()
end, { desc = "Horizontal split + find file" })

vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("tabnew")
  require("telescope.builtin").find_files()
end, { desc = "New tab with file picker" })

-- Tabs 
keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", "<Cmd>tabnext<CR>", { desc = "Go to next tab" })

-- Scratch buffer & new files
keymap.set("n", "<leader>sn", "<Cmd>enew<CR>", { desc = "New scratch buffer" })
keymap.set("n", "<leader>sw", function()
  vim.ui.input({ prompt = "Save as: " }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("saveas " .. filename)
    end
  end)
end, { desc = "Save buffer as..." })

-- Paste in visual mode without yanking deleted text
vim.keymap.set('x', 'p', '"0p', { desc = 'Paste without yanking' })
vim.keymap.set('x', 'P', '"0P', { desc = 'Paste before without yanking' })

-- Toggle line numbers
keymap.set("n", "<leader>ln", function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle line numbers" })

-- Close all auxiliary windows (help, quickfix, loclist, etc.)
keymap.set("n", "<leader>cx", function()
  local auxiliary = { help = true, quickfix = true, nofile = true }
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if auxiliary[vim.bo[buf].buftype] and not vim.bo[buf].modifiable then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close auxiliary windows" })
