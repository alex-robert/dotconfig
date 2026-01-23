return {
  'nvim-mini/mini.files',
  version = '*',
  keys = {
    { '<leader>ed', function() MiniFiles.open() end, desc = 'Root Directory' },
    { '<leader>eed', function() MiniFiles.open(nil, false) end, desc = 'Root Directory (clean)' },
    { '<leader>ef', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = 'Current File Directory' },
    { '<leader>eef', function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end, desc = 'Current File Directory (clean)' },
  },
  config = function()
    local ignored_files = {
      ['.DS_Store'] = true,
      ['.git'] = true,
      ['.gitkeep'] = true,
      ['Thumbs.db'] = true,
    }

    require('mini.files').setup({
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
