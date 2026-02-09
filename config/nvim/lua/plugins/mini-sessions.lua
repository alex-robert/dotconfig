return {
  'nvim-mini/mini.sessions',
  version = '*',
  lazy = false,
  keys = {
    { '<leader>Sr', function() MiniSessions.read(MiniSessions.get_latest()) end, desc = 'Restore latest session' },
    { '<leader>Ss', function() MiniSessions.write(".mini.session.vim", { force = true }) end, desc = 'Save session' },
  },
  config = function()
    require('mini.sessions').setup({
      autoread = false,
      autowrite = true,
      directory = '',
      file = '.mini.session.vim',
      force = { read = false, write = true, delete = false },
    })

    -- Auto-restore local session on startup
    vim.api.nvim_create_autocmd('VimEnter', {
      nested = true,
      callback = function()
        if vim.fn.argc() == 0 and vim.fn.filereadable('.mini.session.vim') == 1 then
          vim.schedule(function()
            MiniSessions.read('.mini.session.vim')
          end)
        end
      end,
    })

    -- Ensure session is saved before exiting (preserves unsaved buffer state)
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        if vim.fn.filereadable('.mini.session.vim') == 1 or #vim.api.nvim_list_bufs() > 1 then
          MiniSessions.write('.mini.session.vim', { force = true })
        end
      end,
    })
  end
}
