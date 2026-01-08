return {
  {
    'nvim-mini/mini.files',
    version = '*',
    config = function()
      require('mini.files').setup({
        windows = {
          preview = false,
          max_number = 3,
          width_focus = 30,
          width_nofocus = 30
        },
        mappings = {
          close = 'q',
          go_in = 'l',
          go_in_plus = 'L',
          go_out = 'j',
          go_out_plus = 'J',
          mark_goto = '',
          mark_set = '',
          reset = '<BS>',
          reveal_cwd = '@',
          show_help = 'g?',
          synchronize = '=',
          trim_left = '<',
          trim_right = '>'
        }
      })
    end
  },
  {
    'nvim-mini/mini.icons',
    config = function()
      local ext3_blocklist = {
        scm = true,
        txt = true,
        yml = true
      }
      local ext4_blocklist = {
        json = true,
        yaml = true
      }
      local MiniIcons = require('mini.icons')
      MiniIcons.setup({
        use_file_extension = function(ext, _)
          return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
        end
      })
      MiniIcons.mock_nvim_web_devicons()
      -- Add LSP kind icons. Useful for 'mini.completion'.
      MiniIcons.tweak_lsp_kind()

    end
  },
  {
    'nvim-mini/mini.extra',
    version = '*',
    config = function()
      require('mini.extra').setup()
    end
  },
  {
    'nvim-mini/mini.misc',
    version = '*',
    config = function()
      local MiniMisc = require('mini.misc')
      MiniMisc.setup()
      MiniMisc.setup_auto_root()
      MiniMisc.setup_termbg_sync()
    end
  },
  {
    'nvim-mini/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'nvim-mini/mini.ai',
    dependencies = {
      'nvim-mini/mini.extra',
    },
    version = '*',
    config = function()
      local ai = require('mini.ai')
      local MiniExtra = require('mini.extra')
      ai.setup({
        custom_textobjects = {
          B = MiniExtra.gen_ai_spec.buffer(),
          F = ai.gen_spec.treesitter({
            a = '@function.outer',
            i = '@function.inner'
          })
        }
      })
    end
  },
  {
    'nvim-mini/mini.tabline',
    version = '*',
    config = function()
      require('mini.tabline').setup()
    end
  },
  {
    version = '*',
    'nvim-mini/mini.trailspace',
    config = function()
      require('mini.trailspace').setup()
    end
  },
  {
    'nvim-mini/mini.keymap',
    version = '*',
    config = function()
      require('mini.keymap').setup()
      local map_combo = require('mini.keymap').map_combo
      local map_multistep = require('mini.keymap').map_multistep
      local mode =  {'i', 'c', 'x', 's'}
      -- map_combo(mode, 'jj', '<BS><BS><Esc>')
      -- map_combo(mode, 'kk', '<BS><BS><Esc>')
      -- map_combo(mode, 'ii', '<BS><BS><Esc>')
      -- map_combo(mode, 'lll', '<BS><BS><BS><Esc>')
      -- map_combo(mode, 'kj', '<BS><BS><Esc>')
      -- map_combo(mode, 'kl', '<BS><BS><Esc>')
    end
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'nvim-mini/mini.map',
    version = '*',
    config = function()


      local MiniMap = require('mini.map')
      MiniMap.setup({
        symbols = { encode = MiniMap.gen_encode_symbols.dot('4x2') },
        -- integrations = {
          --   MiniMap.gen_integration.builtin_search(),
          -- },
        })

        -- Auto-open minimap for compatible buffers
        vim.api.nvim_create_autocmd('BufEnter', {
          callback = function()
            local buftype = vim.bo.buftype
            local filetype = vim.bo.filetype

            -- Code filetypes to show minimap for
            local code_filetypes = {
              'lua', 'python', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
              'rust', 'go', 'c', 'cpp', 'java', 'ruby', 'php', 'html', 'css', 'scss',
              'json', 'yaml', 'toml', 'vim', 'sh', 'bash', 'zsh', 'sql',
            }

            -- Exclude list (just in case)
            local exclude_filetypes = {
              'markdown', 'text', 'help', 'man', 'gitcommit',
            }

            -- Only for normal buffers
            if buftype == '' and filetype ~= '' then
              -- Check if it's a code file and not excluded
              local is_code = vim.tbl_contains(code_filetypes, filetype)
              local is_excluded = vim.tbl_contains(exclude_filetypes, filetype)

              if is_code and not is_excluded then
                -- Optional: skip very small or very large files
                local line_count = vim.api.nvim_buf_line_count(0)
                if line_count > 50 and line_count < 5000 then
                  MiniMap.open()
                end
              end
            end
          end,
        })
        -- Keymap to toggle manually
        vim.keymap.set('n', '<leader>om', '<Cmd>lua MiniMap.toggle()<CR>', { desc = 'Toggle minimap' })
      end
    },
    {
      'nvim-mini/mini.move',
      version = '*',
      config = function()
        require('mini.move').setup({
          mappings = {
            left = '<M-j>',
            right = '<M-l>',
            down = '<M-k>',
            up = '<M-i>',
            line_left = '<M-j>',
            line_right = '<M-l>',
            line_down = '<M-k>',
            line_up = '<M-i>',
          },
          options = {
            -- Automatically reindent selection during linewise vertical move
            reindent_linewise = true,
          },
        })
      end
    },
    {
      'nvim-mini/mini.splitjoin',
      version = '*',
      config = function()
        require('mini.splitjoin').setup()
      end
    },
  }
