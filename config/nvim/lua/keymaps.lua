local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set({ "n", "v" }, "<Up>", "<nop>")
keymap.set({ "n", "v" }, "<Down>", "<nop>")
keymap.set({ "n", "v" }, "<Left>", "<nop>")
keymap.set({ "n", "v" }, "<Right>", "<nop>")

------------------
-- Move arround --
------------------
keymap.set("n", "H", "b", { desc = "Move word backward" })
keymap.set("n", "J", "5j", { desc = "Move down 5 lines" })
keymap.set("n", "K", "5k", { desc = "Move up 5 lines" })
keymap.set("n", "L", "w", { desc = "Move word forward" })

-------------------
-- Manage Splits --
-------------------
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

keymap.set("n", "<C-w>e", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<C-w>w", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-w>V", ":vsplit<CR>", { desc = "Split vertically" })

keymap.set("n", "<C-w>H", ":split<CR>", { desc = "Split horizontally" })

keymap.set("n", "<C-w>v", function()
  vim.cmd("vsplit")
  require("telescope.builtin").find_files()
end, { desc = "Vertical split + find file" })

keymap.set("n", "<C-w>h", function()
  vim.cmd("split")
  require("telescope.builtin").find_files()
end, { desc = "Horizontal split + find file" })

---------------------
-- Manages buffers --
---------------------
keymap.set("n", "<C-M-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<C-M-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<C-M-x>", ":bdelete<CR>", { desc = "Delete buffer" })

-- Manage buffers in splits
keymap.set("n", "<C-w>x", function()
  Snacks.bufdelete.delete()
end, { desc = "Delete buffer in split" })

keymap.set("n", "<C-w>X", function()
  Snacks.bufdelete.all()
end, { desc = "Delete All buffers in splits" })

keymap.set("n", "<leader>bn", "<Cmd>enew<CR>", { desc = "New buffer" })
keymap.set("n", "<leader>bh", "<Cmd>new<CR>", { desc = "New buffer in horizontal split" })
keymap.set("n", "<leader>bv", "<Cmd>vnew<CR>", { desc = "New buffer in vertical split" })

keymap.set("n", "<C>n", "<Cmd>enew<CR>", { desc = "New buffer" })
keymap.set("n", "<C>N", "<Cmd>vnew<CR>", { desc = "New buffer in vertical split" })

keymap.set("n", "<leader>bw", function()
  vim.ui.input({ prompt = "Save as: " }, function(filename)
    if filename and filename ~= "" then
      vim.cmd("saveas " .. filename)
    end
  end)
end, { desc = "Save buffer as..." })

keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save current buffer" })

keymap.set("n", "<leader>bx", function()
  local auxiliary = { help = true, quickfix = true, nofile = true }
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if auxiliary[vim.bo[buf].buftype] and not vim.bo[buf].modifiable then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close auxiliary buffers" })


------------------
-- Indents      --
------------------
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-------------------
-- Texts objects --
-------------------
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

------------------
-- Manages Tabs --
------------------
vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("tabnew")
  require("telescope.builtin").find_files()
end, { desc = "New tab with file picker" })

keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", "<Cmd>tabnext<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tx", "<Cmd>tabclose<CR>", { desc = "Close current tab" })

------------------
-- Search       --
------------------
-- Search and replace (very magic)
keymap.set("n", "<C-f>", ":%s/\\v", { desc = "Search & replace (very magic)" })

-- Center screen on search result navigation
keymap.set("n", "n", "nzz", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzz", { desc = "Prev search result (centered)" })

--------------------
--
--------------------
-- Paste in visual mode without yanking deleted text
vim.keymap.set('x', 'p', '"0p', { desc = 'Paste without yanking' })
vim.keymap.set('x', 'P', '"0P', { desc = 'Paste before without yanking' })

-- Toggle line numbers
keymap.set("n", "<leader>oln", function()
 -- If any line number are visible, toggle to not visible
 if vim.wo.number or vim.wo.relativenumber then
  vim.wo.number = false
  vim.wo.relativenumber = false
 -- If no line numbers are visible, reset only absolute numbers
 elseif not vim.wo.number and not vim.wo.relativenumber then
  vim.wo.number = true
 end
end, { desc = "Toggle line numbers" })

keymap.set('n', '<leader>ola', function()
  vim.wo.relativenumber = false
  vim.wo.number = true
end, {desc = 'Show absolute line numbers'})

keymap.set('n', '<leader>olr', function()
  vim.wo.number = false
  vim.wo.relativenumber = true
end, {desc = 'Show relative line numbers'})


