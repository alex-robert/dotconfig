return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_default_mappings = 0

      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Select All"] = "<C-S-l>",
        ["Skip Region"] = "<C-x>",
        ["Remove Region"] = "<C-p>",

        ["Add Cursor At Pos"] = "<leader>cc",
        ["Visual Cursors"] = "<leader>cv",

        ["Add Cursor Down"] = "<A-k>",
        ["Add Cursor Up"] = "<A-i>",

        ["Move Down"] = "k",
        ["Move Up"] = "i",
        ["Move Left"] = "j",
        ["Move Right"] = "l",

        ["Goto Next"] = "L",
        ["Goto Prev"] = "J",

        ["Move 5 Down"] = "K",
        ["Move 5 Up"] = "I",

        ["$"] = "$",
        ["0"] = "0",
        ["^"] = "^",

        ["I Insert"] = "e",
        ["I Append"] = "a",
        ["Delete Char"] = "x",
        ["I BS"] = "<BS>",

        ["Undo"] = "u",
        ["Redo"] = "<C-r>",
        ["Abort"] = "<Esc>",
      }

      vim.g.VM_leader = {
        default = "<leader>c",
        visual = "<leader>c",
        buffer = "<leader>c",
      }

      vim.g.VM_theme = "codedark"
      vim.g.VM_highlight_matches = "underline"

      vim.g.VM_set_statusline = 0
      vim.g.VM_silent_exit = 1
    end,
    config = function()
      vim.keymap.set("n", "<leader>ca", "<Plug>(VM-Select-All)", { desc = "Select all occurrences" })
      vim.keymap.set("n", "<leader>c/", "<Plug>(VM-Start-Regex-Search)", { desc = "Start regex search cursors" })
      vim.keymap.set("v", "<leader>c", "<Plug>(VM-Visual-Cursors)", { desc = "Add cursors in selection" })
    end,
  },
}
