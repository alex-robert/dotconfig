return {
  'nvim-mini/mini.sessions',
  version = '*',
  keys = {
    { '<leader>Sr', function() MiniSessions.read(MiniSessions.get_latest()) end, desc = 'Restore latest session' },
    { '<leader>Ss', function() MiniSessions.write(".mini.session.vim", { force = true }) end, desc = 'Save session' },
  },
  config = function()
    require('mini.sessions').setup({
      autoread = false,
      autowrite = true,
      directory = '',
      file= '.mini.session.vim',
      force = { read = false, write = true, delete = false },
    })
  end
}
