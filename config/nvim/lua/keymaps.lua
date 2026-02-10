local keymap = vim.keymap

-- Save current buffer with Ctrl+S
keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save current buffer" })

vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("tabnew")
  require("telescope.builtin").find_files()
end, { desc = "New tab with file picker" })

keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tn", "<Cmd>tabnext<CR>", { desc = "Go to next tab" })

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
