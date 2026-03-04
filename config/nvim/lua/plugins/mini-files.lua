return {
  'nvim-mini/mini.files',
  version = '*',
  keys = {
    { '<leader>er', function() MiniFiles.open(nil, false) end,                   desc = 'Root Directory' },
    -- { '<leader>eer', function() MiniFiles.open(nil, false) end, desc = 'Root Directory (clean)' },
    { '<leader>ef', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = 'Current File Directory' },
    -- { '<leader>eef', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, desc = 'Current File Directory (clean)' },
  },
  config = function()
    local MiniFiles = require('mini.files')

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. ' split')
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, '<C-h>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')
        map_split(buf_id, '<C-t>', 'tab')
      end,
    })

    local ignored_files = {
      ['.DS_Store'] = true,
      ['.git'] = true,
      ['.gitkeep'] = true,
      ['Thumbs.db'] = true,
    }

    MiniFiles.setup({
      content = {
        filter = function(fs_entry)
          return not ignored_files[fs_entry.name]
        end,
      },
      windows = {
        preview = false,
        max_number = 4,
        width_focus = 50,
        width_nofocus = 50,
        width_preview = 50,
      },
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'L',
        go_out = 'h',
        go_out_plus = 'H',
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
}
