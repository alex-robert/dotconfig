require('mini.deps').setup({})

local add = MiniDeps.add
local now, later = MiniDeps.now, MiniDeps.later

-- now(function()
--     require('mini.base16').setup({
--       palette = {
--         -- Background shades (darkest to lighter)
--         base00 = '#1f1f1f',  -- Default background
--         base01 = '#252526',  -- Lighter background (status bars, line numbers)
--         base02 = '#2d2d2d',  -- Selection background
--         base03 = '#6e7681',  -- Comments, invisibles
--
--         -- Foreground shades (darker to lightest)
--         base04 = '#9d9d9d',  -- Dark foreground (e.g. line numbers)
--         base05 = '#cccccc',  -- Default foreground
--         base06 = '#e5e5e5',  -- Light foreground
--         base07 = '#ffffff',  -- Lightest foreground
--
--         -- Accent colors (Arctic's syntax highlighting colors)
--         base08 = '#F14C4C',  -- Red - errors, deletion, variables
--         base09 = '#D7BA7D',  -- Orange - integers, booleans, constants
--         base0A = '#DCDCAA',  -- Yellow - classes, search highlights
--         base0B = '#6A9955',  -- Green - strings, additions
--         base0C = '#4EC9B0',  -- Cyan - support, regex, escape chars
--         base0D = '#569CD6',  -- Blue - functions, methods, headings
--         base0E = '#C586C0',  -- Purple - keywords, storage, tags
--         base0F = '#D16969',  -- Brown - deprecated, embedded
--       },
--       use_cterm = false,
--     })
-- end)

now(function()
    require('mini.basics').setup({
        options = {
            basic = false
        },
        mappings = {
            basic = false,
            windows = false,
      move_with_alt = false
        },
        autocommands = {
            basic = true
        }
    })

    require('mini.extra').setup()
end)

now(function()
    -- Set up to not prefer extension-based icon for some extensions
    local ext3_blocklist = {
        scm = true,
        txt = true,
        yml = true
    }
    local ext4_blocklist = {
        json = true,
        yaml = true
    }

    require('mini.icons').setup({
        use_file_extension = function(ext, _)
            return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
        end
    })

    -- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
    -- Not needed for 'mini.nvim' or MiniMax, but might be useful for others.
    later(MiniIcons.mock_nvim_web_devicons)

    -- Add LSP kind icons. Useful for 'mini.completion'.
    later(MiniIcons.tweak_lsp_kind)
end)

now(function()
    -- Makes `:h MiniMisc.put()` and `:h MiniMisc.put_text()` public
    require('mini.misc').setup()

    -- Change current working directory based on the current file path. It
    -- searches up the file tree until the first root marker ('.git' or 'Makefile')
    -- and sets their parent directory as a current directory.
    -- This is helpful when simultaneously dealing with files from several projects.
    MiniMisc.setup_auto_root()

    -- Restore latest cursor position on file open
    MiniMisc.setup_restore_cursor()

    -- Synchronize terminal emulator background with Neovim's background to remove
    -- possibly different color padding around Neovim instance
    MiniMisc.setup_termbg_sync()
end)


now(function()
    require('mini.keymap').setup()
    local map_combo = require('mini.keymap').map_combo
    local map_multistep = require('mini.keymap').map_multistep
    local mode =  {'i', 'c', 'x', 's'}
    map_combo(mode, 'jj', '<BS><BS><Esc>')
    map_combo(mode, 'kk', '<BS><BS><Esc>')
    map_combo(mode, 'ii', '<BS><BS><Esc>')
    map_combo(mode, 'lll', '<BS><BS><BS><Esc>')
    map_combo(mode, 'kj', '<BS><BS><Esc>')
    map_combo(mode, 'kl', '<BS><BS><Esc>')


end)

later(function()
    require('mini.cmdline').setup()
    require('mini.tabline').setup()
    require('mini.trailspace').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
end)

later(function()
    -- Enable directory/file preview
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
end)

later(function()
    local ai = require('mini.ai')
    ai.setup({
        custom_textobjects = {
            B = MiniExtra.gen_ai_spec.buffer(),
            F = ai.gen_spec.treesitter({
                a = '@function.outer',
                i = '@function.inner'
            })
        }
    })

    require('mini.surround').setup()
end)

-- later(function()
--   require('mini.completion').setup()
-- end)

later(function()
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
end)

later(function() require('mini.align').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.move').setup() end)
