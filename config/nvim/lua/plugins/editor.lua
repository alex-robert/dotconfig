return {
  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
    ft = "markdown",
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()

        require("nvim-tree").setup({
            view = {
                side = "right",
                width = 35,
                preserve_window_proportions = true,
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                root_folder_label = function(path)
                    local basename = vim.fn.fnamemodify(path, ":t")
                    return string.upper(basename)
                end,
                indent_markers = {
                    enable = true -- Show indent lines
                },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = false
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

        -- Open nvim-tree on startup
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                -- Only open if no file was specified
                if vim.fn.argc() == 0 then
                    require("nvim-tree.api").tree.open()
                end
            end
        })

        -- Custom color scheme for nvim-tree
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
              
                vim.api.nvim_set_hl(0, "NvimTreeNormal",       { bg = "#181818", fg = "#cccccc" })
                vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",  { bg = "#181818", fg = "#181818" })
                vim.api.nvim_set_hl(0, "NvimTreeVertSplit",    { bg = "#181818", fg = "#2b2b2b" })
                vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "#181818", fg = "#2b2b2b" })

                vim.api.nvim_set_hl(0, "NvimTreeFolderName",       { fg = "#cccccc", bold = true })
                vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#cccccc", bold = true, italic = true })
                vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName",  { fg = "#8c8c8c" })
                -- vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",       { fg = "#4EC9B0" })

                -- vim.api.nvim_set_hl(0, "NvimTreeFileNew", { fg = "#73c991" })
                -- vim.api.nvim_set_hl(0, "NvimTreeFileRenamed", { fg = "#4EC9B0" })
                -- vim.api.nvim_set_hl(0, "NvimTreeFileDirty", { fg = "#e2c08d" })

                vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#73c991" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#e2c08d" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#c74e39" })
                -- vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#81b88b" })
                -- vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#C586C0" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileRenamedHL", { fg = "#73c991" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = "#6a6a6a" })

                vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#569CD6", bold = true })
                -- vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#DCDCAA", underline = true })
                -- vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#9CDCFE", italic = true })
                -- vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#404040" })
                vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#cccccc" })
                vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#cccccc" })
                vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#cccccc" })

                -- vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#2a2d2e" })
                -- vim.api.nvim_set_hl(0, "NvimTreeCursorLineNr", { fg = "#cccccc" })
                
                -- vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", { bg = "#0078d4", fg = "#ffffff", bold = true })

                -- vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { bg = "#181818", fg = "#cccccc" })
                -- vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "#181818", fg = "#9d9d9d" })

              vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", { italic = true })


              
            end
        })

        -- Apply colors immediately
        vim.cmd("doautocmd ColorScheme")
    end
}, -- Fuzzy finder
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

        -- Load fzf extension
        telescope.load_extension("fzf")

        -- Keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Git commits" })
    end
}, -- Syntax highlighting
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"lua", "vim", "javascript", "typescript", "python", "html", "css", "markdown", "markdown_inline"},
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
        preset = "modern",
      })

      -- Add group descriptions
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffer" },
        { "<leader>s", group = "Split" },
        { "<leader>t", group = "Tree/Tab" },
        { "<leader>g", group = "Git" },
        { "<leader>c", group = "Code" },
        { "<leader>m", group = "Multi-cursor" },
      })
    end,
  },

  -- Multi-cursor (VSCode-like)
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- Disable all default mappings, we'll create our own
      vim.g.VM_default_mappings = 0

      -- Custom mappings optimized for IJKL layout
      vim.g.VM_maps = {
        -- Core multi-cursor operations
        ["Find Under"] = "<C-d>",              -- Ctrl+d to add cursor on next match
        ["Find Subword Under"] = "<C-d>",
        ["Select All"] = "<C-S-l>",            -- Ctrl+Shift+l to select all matches
        ["Skip Region"] = "<C-x>",             -- Ctrl+x to skip current match
        ["Remove Region"] = "<C-p>",           -- Ctrl+p to remove last cursor

        -- Start cursor mode with leader+c
        ["Add Cursor At Pos"] = "<leader>cc",  -- Leader+c+c to add cursor at position
        ["Visual Cursors"] = "<leader>cv",     -- Leader+c+v to add cursors in visual selection

        -- Add cursors above/below with Alt (Option) key
        ["Add Cursor Down"] = "<A-k>",         -- Alt+k to add cursor below (down in IJKL)
        ["Add Cursor Up"] = "<A-i>",           -- Alt+i to add cursor above (up in IJKL)

        -- Movement in cursor mode (IJKL) - lowercase for navigation only
        ["Move Down"] = "k",
        ["Move Up"] = "i",
        ["Move Left"] = "j",
        ["Move Right"] = "l",

        -- Word movement with Shift (capital letters)
        ["Goto Next"] = "L",                   -- Shift+L for next word
        ["Goto Prev"] = "J",                   -- Shift+J for prev word

        -- Fast movement
        ["Move 5 Down"] = "K",                 -- Shift+K move 5 lines down
        ["Move 5 Up"] = "I",                   -- Shift+I move 5 lines up

        -- Line start/end movement
        ["$"] = "$",                           -- End of line
        ["0"] = "0",                           -- Start of line (column 0)
        ["^"] = "^",                           -- First non-blank character

        -- Edit mode
        ["I Insert"] = "e",                    -- 'e' to enter insert mode at cursors
        ["I Append"] = "a",                    -- 'a' to append at cursors
        ["Delete Char"] = "x",                 -- 'x' to delete char at cursors
        ["I BS"] = "<BS>",                     -- Backspace

        -- Exit and undo
        ["Undo"] = "u",
        ["Redo"] = "<C-r>",
        ["Abort"] = "<Esc>",                   -- Escape to exit
      }

      -- Leader+c mappings for entering cursor mode
      vim.g.VM_leader = {
        default = "<leader>c",
        visual = "<leader>c",
        buffer = "<leader>c",
      }

      -- Customize appearance
      vim.g.VM_theme = "codedark"
      vim.g.VM_highlight_matches = "underline"

      -- Show mode in command line
      vim.g.VM_set_statusline = 0
      vim.g.VM_silent_exit = 1
    end,
    config = function()
      -- Additional keymaps for starting cursor mode
      vim.keymap.set("n", "<leader>ca", "<Plug>(VM-Select-All)", { desc = "Select all occurrences" })
      vim.keymap.set("n", "<leader>c/", "<Plug>(VM-Start-Regex-Search)", { desc = "Start regex search cursors" })
      vim.keymap.set("v", "<leader>c", "<Plug>(VM-Visual-Cursors)", { desc = "Add cursors in selection" })
    end,
  },
}
