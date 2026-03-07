return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local empty = require('lualine.component'):extend()
      function empty:draw(default_highlight)
        self.status = ''
        self.applied_separator = ''
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
      end

      local colors = {
        grey = '#a0a1a7',
      }
      -- Put proper separators and gaps between components in sections
      local function process_sections(sections)
        for name, section in pairs(sections) do
          local left = name:sub(9, 10) < 'x'
          for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.grey, bg = colors.grey } })
          end
          for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
              comp = { comp }
              section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
          end
        end
        return sections
      end

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
        return ' '
      end


      local function file_name()
        return {
          'filename',
          symbols = {
            modified = '● ', -- Text to show when the buffer is modified
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]', -- Text to show for newly created file before first write
          },
        }
      end


      local function is_zen()
       return Snacks.zen.win ~= nil
      end


      require("lualine").setup({
        options = {
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = process_sections {
          lualine_a = {
            {
              'mode',
              right_padding = 2,
            },
          },
          lualine_b = {
            'branch',
            { 'diff', source = diff_source },
            'diagnostics'
          },
          lualine_c = {
            'selectioncount',
            'searchcount',
          },
          lualine_x = {
            {
              'tabs',
              mode = 1,
              tab_max_length = 30,
              max_length = vim.o.columns / 2,
              show_modified_status = false,
              tabs_color = {
                active = 'lualine_a_normal',
                inactive = 'lualine_c_inactive',
              },
              cond = function()
                if vim.fn.tabpagenr('$') > 1 then
                  return true
                end
                return false
              end
            },
            'lsp_status',
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = {
            'location',
          },
        },

        winbar = {
          lualine_a = { tab_header },
          lualine_b =  { file_name() },
          lualine_c = {},


          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },

        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { file_name() },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },

        -- tabline = {
        --   lualine_a = {},
        --   lualine_b = {
        --     {
        --       'buffers',
        --       separator = '',
        --       max_length = vim.o.columns,
        --       use_mode_colors = true,
        --       buffers_color = {
        --         active = 'lualine_a_normal',
        --         inactive = 'lualine_c_inactive',
        --       },
        --       symbols = {
        --         modified = ' ●', -- Text to show when the buffer is modified
        --         alternate_file = '', -- Text to show to identify the alternate file
        --         directory = '', -- Text to show when the buffer is a directory
        --       },
        --     },
        --   },
        --   lualine_c = {},
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {},
        -- }
      })
    end,
  },
}
