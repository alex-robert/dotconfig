return {{
        "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    config = function()
        require('neo-tree').setup({
          close_if_last_window = false,
          -- auto_clean_after_session_restore = true,
          popup_border_style = 'rounded',
          window = {
            position = "right",
            width = 40,
            mappings = {
              -- Custom movement keys (your i,j,k,l layout)
              ["i"] = "move_cursor_up",      -- i = up
              ["k"] = "move_cursor_down",    -- k = down
              ["j"] = "close_node",       -- j = left (close/collapse)
              ["l"] = "open",             -- l = right (open/expand)

              -- Disable conflicting defaults
              ["h"] = "none",             -- disable default h
              ["I"] = "show_file_details", -- shift+i for file details (since i is now up)

              -- Refers to https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua for valid keymappings
            }
          },
          filesystem = {
            filtered_items = {
              hide_ignored = false,
              use_libuv_file_watcher = true,
              always_show_by_pattern = {
                ".env*", ".*rc", ".*ignore", ".*.yml",
              },
              hide_hidden = false,
              never_show = {
                ".DS_Store",
                "thumb.db",
              },
            },
            follow_current_file = {
              enabled = true,
              leave_dirs_open = true,
            }
          },
          buffers = {
            follow_current_file = {
              enabled = true,
            },
            show_unloaded = true,
          }
        })

        vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", {
            desc = "Toggle tree explorer"
        })


        -- vim.api.nvim_create_autocmd("VimEnter", {
        --   callback = function()
        --     if vim.fn.argc() == 0 then
        --       -- Check if neo-tree is already open
        --       local neotree_open = false
        --       for _, win in ipairs(vim.api.nvim_list_wins()) do
        --         local buf = vim.api.nvim_win_get_buf(win)
        --         local ft = vim.bo[buf].filetype
        --         if ft == 'neo-tree' then
        --           neotree_open = true
        --           break
        --         end
        --       end
        --
        --       if not neotree_open then
        --         vim.cmd "Neotree show"
        --       end
        --     end
        --   end,
        -- })
        vim.api.nvim_create_autocmd({"FileType", "BufWinEnter"}, {
            pattern = "neo-tree",
            callback = function()
                vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>", { buffer = true })
                vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>", { buffer = true })
            end
        })

    end
}}
