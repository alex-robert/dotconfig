return { -- File explorer
{
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()

        require("nvim-tree").setup({
            view = {
                side = "right",
                width = 35,
                preserve_window_proportions = true -- Maintain proportions when resizing
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                root_folder_label = ":~:s?$?/..?", -- Show root folder nicely
                indent_markers = {
                    enable = true -- Show indent lines
                },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true
                    }
                }
            },
            filters = {
                dotfiles = false, -- Show hidden files
                custom = { -- Hide these patterns
                "node_modules", ".git", ".DS_Store"}
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 400
            },
            actions = {
                open_file = {
                    quit_on_open = false, -- Keep tree open
                    resize_window = true -- Resize window when opening files
                },
                use_system_clipboard = true -- Use system clipboard for copy/paste
            },
            update_focused_file = {
                enable = true, -- Highlight currently open file
                update_cwd = false -- Don't change working directory
            }
        })

        vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {
            desc = "Toggle file explorer"
        })
    end
}, -- Fuzzy finder
{
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {
            desc = "Find files"
        })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
            desc = "Live grep"
        })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            desc = "Find buffers"
        })
    end
}, -- Syntax highlighting
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"lua", "vim", "javascript", "typescript", "python", "html", "css"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}
,
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

    config = function()
    local wk = require("which-key")
    wk.setup({
      -- your configuration comes here
    })
    
    -- Register your keybindings with descriptions
    wk.register({
      ["<leader>f"] = { name = "+file" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
      ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    })
  end,
}


}
