return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      '<leader>et',
      function()
        require('neo-tree.command').execute({ toggle = true })
      end,
      desc = 'Toggle tree view',
    },
    {
      '<leader>eT',
      function()
        require('neo-tree.command').execute({
          toggle = true,
          reveal = true,
        })
      end,
      desc = 'Toggle tree view (reveal file)',
    },
  },
  config = function()
    local function smart_open(state)
      local node = state.tree:get_node()
      if node.type == "directory" then
        require("neo-tree.sources.filesystem.commands").toggle_node(state)
      else
        require("neo-tree.sources.common.commands").preview(state)
      end
    end

    local function smart_mouse_open(state)
      local node = state.tree:get_node()
      if node.type ~= "directory" then
        require("neo-tree.sources.common.commands").preview(state)
      end
    end

    require('neo-tree').setup({
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,

      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        }, 
        mappings = {
          -- ["<space>"] = {
          --   "toggle_node",
          --   nowait = true,
          -- },
          -- ["<LeftMouse>"] = smart_mouse_open,
          ["<2-LeftMouse>"] = "open",
          ["l"] = smart_open,
          ["L"] = "open",
          ["h"] = "close_node",
          ["<cr>"] = "open",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["C"] = "close_all_nodes",
          ["z"] = "close_all_subnodes",
          ["R"] = "refresh",
          ["P"] = "toggle_preview",
          ["?"] = "show_help",
          ["q"] = "close_window",
          ["<leader>et"] = "close_window",
        },
      },

      preview = {
        enable = true,
      },

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
          },
          never_show = {
            ".git",
          },
        },
        follow_current_file = {
          enabled = false,
        },
        use_libuv_file_watcher = true,
      },

    })

    -- vim.api.nvim_create_autocmd("BufEnter", {
      --   group = vim.api.nvim_create_augroup("neotree_auto_close", { clear = true }),
      --   callback = function()
        --     local buftype = vim.bo.buftype
        --     local filetype = vim.bo.filetype
        --
        --     if buftype == "" and filetype ~= "neo-tree" then
        --       local manager = require("neo-tree.sources.manager")
        --       local state = manager.get_state("filesystem")
        --
        --       if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
        --         require("neo-tree.command").execute({ action = "close" })
        --       end
        --     end
        --   end,
        -- })
      end,
    }
