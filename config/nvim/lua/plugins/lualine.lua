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

      local function git_blame()
        local ok, gitsigns = pcall(require, 'gitsigns')
        if not ok then
          return ''
        end

        local blame_info = gitsigns.get_blame_line()
        if not blame_info then
          return ''
        end

        local author = blame_info.author or 'Unknown'
        local date = blame_info.author_time and os.date('%Y-%m-%d', blame_info.author_time) or ''

        if author == 'Not Committed Yet' then
          return ''
        end

        return string.format('%s • %s', author, date)
      end

      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })

      require("lualine").setup({
        options = {
          -- theme = 'powerline_dark',   
          theme = 'bubbles_theme',
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              separator = { left = '' }, right_padding = 2, 
            },
          },
          lualine_b = { 'branch', { 'diff', source = diff_source } , 'diagnostics' },
          lualine_c = {
            {
              'searchcount',
            },
            {
              symbols.get,
              cond = symbols.has,
            }
          },
          lualine_x = {
            --       {
              --         function()
                --           local ok, gitsigns = pcall(require, 'gitsigns')
                --           if not ok then
                --             return "canot call gitsigns"
                --           end
                --           return "can call gitsigns"
                --           -- local blame_info = gitsigns.get_blame_line()
                --           -- if not blame_info then
                --           --   return 'no blame info'
                --           -- end
                --           -- return blame_info.author or "unknown author"
                --   end,
                --   icon = "",
                -- },
                'encoding',
                'fileformat',
                'filetype',
              },
              lualine_y = { 'progress' },
              lualine_z = { 'location', separator = { right = '' }, left_padding = 2 },
            },
            tabline = {
              lualine_a = {},
              lualine_b = {'buffers'},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {{'tabs', mode = 2, tab_max_length = 30, max_length = vim.o.columns / 2,}},
            }
          })
        end,
      },
    }
