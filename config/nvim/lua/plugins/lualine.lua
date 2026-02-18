return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()



      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end


      local function tab_header()
        return ''
      end


      require("lualine").setup({
        options = {
          theme = 'auto',
          -- theme = 'bubbles_theme',
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              -- separator = { left = '' },
              right_padding = 2,
            },
          },
          lualine_b = { 'branch', { 'diff', source = diff_source } , 'diagnostics' },
          lualine_c = {
            {
              'searchcount',
            },
            -- {
              --   symbols.get,
              --   cond = symbols.has,
              -- }
            },
            lualine_x = {
              'encoding',
              'fileformat',
              'filetype',
            },
            lualine_y = { 'progress' },
            lualine_z = {
              {
                'location',
                -- separator = { right = '' },
              }
            },
          },
          tabline = {
            lualine_a = { tab_header },
            lualine_b = {
              -- {
              --   'buffers',
              --   --   -- component_separators = ' | ',
              --   buffers_color = {
              --     -- Same values as the general color option can be used here.
              --     active = 'lualine_a_normal',     -- Color for active buffer.
              --     inactive = 'lualine_c_inactive', -- Color for inactive buffer.
              --   },
              --   symbols = {
              --     modified = '●',      -- Text to show when the buffer is modified
              --     alternate_file = '', -- Text to show to identify the alternate file
              --     directory =  '',     -- Text to show when the buffer is a directory
              --   },
              -- }
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                  'tabs',
                  mode = 0,
                  tab_max_length = 30,
                  max_length = vim.o.columns / 2,
                }
              },
            }
          })
        end,
      },
    }
