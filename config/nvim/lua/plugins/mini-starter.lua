return {
  'nvim-mini/mini.starter',
  version = '*',
  lazy = false,
  priority = 999,
  config = function()
    local starter = require('mini.starter')

    local new_section = function(name, action, section)
      return { name = name, action = action, section = section }
    end

    starter.setup({
      autoopen = false,
      evaluate_single = false,
      items = {
        new_section('Find file', 'Telescope find_files', 'Telescope'),
        new_section('Recent files', 'Telescope oldfiles', 'Telescope'),
        -- new_section('Grep text', 'Telescope live_grep', 'Telescope'),
        new_section('Restore session', 'lua MiniSessions.read(".mini.session.vim")', 'Session'),
        new_section('New file', 'enew', 'Built-in'),
        new_section('Quit', 'qall', 'Built-in'),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet('│ ', false),
        starter.gen_hook.aligning('center', 'center'),
      },
      header = function()
        local hour = tonumber(vim.fn.strftime('%H'))
        local greeting = 'Good '
        if hour < 12 then
          greeting = greeting .. 'morning'
        elseif hour < 18 then
          greeting = greeting .. 'afternoon'
        else
          greeting = greeting .. 'evening'
        end
        return greeting .. '!'
      end,
      footer = '',
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        starter.config.footer = 'Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(starter.refresh)
      end,
    })

    -- Only show starter if no session file exists
    vim.api.nvim_create_autocmd('VimEnter', {
      nested = true,
      callback = function()
        if vim.fn.argc() == 0 and vim.fn.filereadable('.mini.session.vim') == 0 then
          require('mini.starter').open()
        end
      end,
    })
  end,
}
