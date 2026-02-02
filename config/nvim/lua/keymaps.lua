local keymap = vim.keymap

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

