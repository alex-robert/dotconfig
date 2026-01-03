return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
          defaults = {
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                preview_width = 0.55,
              },
            },
            file_ignore_patterns = {
              "%.git/",
              "node_modules/",
            },
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--ignore-case",
            },
            mappings = {
              i = {
                ["<S-k>"] = require("telescope.actions").move_selection_next,
                ["<S-i>"] = require("telescope.actions").move_selection_previous,
              },
            },
          },
          pickers = {
            find_files = {
              hidden = true,
            },
          },
        })

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Git commits" })
    end
  },
}
