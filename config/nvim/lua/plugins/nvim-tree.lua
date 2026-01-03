return {
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
                    enable = true
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
                dotfiles = false,
                custom = {
                "node_modules", ".git", ".DS_Store"}
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 400
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                    resize_window = true
                },
                use_system_clipboard = true
            },
            update_focused_file = {
                enable = true,
                update_cwd = false
            }
        })

        vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {
            desc = "Toggle file explorer"
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.argc() == 0 then
                    require("nvim-tree.api").tree.open()
                end
            end
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()

                -- vim.api.nvim_set_hl(0, "NvimTreeNormal",       { bg = "#181818", fg = "#cccccc" })
                -- vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",  { bg = "#181818", fg = "#181818" })
                -- vim.api.nvim_set_hl(0, "NvimTreeVertSplit",    { bg = "#181818", fg = "#2b2b2b" })
                -- vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "#181818", fg = "#2b2b2b" })

                vim.api.nvim_set_hl(0, "NvimTreeFolderName",       { fg = "#cccccc", bold = true })
                vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#cccccc", bold = true, italic = true })
                vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName",  { fg = "#8c8c8c" })

                vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#73c991" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#e2c08d" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#c74e39" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileRenamedHL", { fg = "#73c991" })
                vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = "#6a6a6a" })

                vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#569CD6", bold = true })
                vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#cccccc" })
                vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#cccccc" })
                vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#cccccc" })

              vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", { italic = true })



            end
        })

        vim.cmd("doautocmd ColorScheme")
    end
  },
}
