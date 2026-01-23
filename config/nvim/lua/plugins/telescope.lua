return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "tiagovla/scope.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fF", function() require("telescope.builtin").find_files({no_ignore = true, hidden = true}) end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find help" },
      { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
      { "<leader>fc", function() require("telescope.builtin").git_commits() end, desc = "Git commits" },
      { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
      { "<leader>ft", function() require("telescope.builtin").colorscheme() end, desc = "Find theme" },
      { "<leader>fab", ":Telescope scope buffers<CR>", desc = "Find all buffers" },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              width = 0.88,
              height = 0.8,
              preview_cutoff = 120,
            },
          },
          file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "dist/",
            "build/",
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
              ["<Esc>"] = require("telescope.actions").close,
              ["<S-j>"] = require("telescope.actions").move_selection_next,
              ["<S-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            -- no_ignore = true,
            -- hidden = true,
          },
          oldfiles = {
            cwd_only = true,
          },
          keymaps = {
            layout_strategy = "center",
            layout_config = { width = 0.4 },
          }
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("scope")
    end
  },
}
