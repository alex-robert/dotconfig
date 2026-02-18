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
      { "<leader>ff", function() require("telescope.builtin").find_files({no_ignore = true, hidden = true}) end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },

      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
      { "<leader>fB", ":Telescope scope buffers<CR>", desc = "Find all buffers" },
      
      {"<leader>fs", function() require("telescope.builtin").search_history() end, desc = "Search History" },
      {"<leader>fh", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
      
      { "<leader>fc", function() require("telescope.builtin").git_commits() end, desc = "Git commits" },

      { "<leader>fC", function() require("telescope.builtin").commands() end, desc = "Find commands" },
      { "<leader>fH", function() require("telescope.builtin").help_tags() end, desc = "Find help" },
      { "<leader>fK", function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
      { "<leader>fT", function() require("telescope.builtin").colorscheme() end, desc = "Find theme" },

      {"<S-Up>", function() require("telescope.builtin").cycle_history_prev() end},
      {"<S-Down>", function() require("telescope.builtin").cycle_history_next() end},
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          history = {
            limit = 50,
            path = vim.fn.stdpath("data") .. "/telescope_history",
          },
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.68,
              width = 0.99,
              height = 0.99,
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
              -- ["<Esc>"] = require("telescope.actions").close,
              ["<S-j>"] = require("telescope.actions").move_selection_next,
              ["<S-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-h>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-Down>"] = require('telescope.actions').cycle_history_next,
              ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
            },
            n = {
              ["<C-Down>"] = require('telescope.actions').cycle_history_next,
              ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
            }
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
            layout_strategy = "horizontal",
            layout_config = {
              width = 0.9,
              height = 0.8,
              preview_width = 0.6,
            },
          }
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("scope")
    end
  },
}
