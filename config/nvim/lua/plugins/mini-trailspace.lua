return {
  'nvim-mini/mini.trailspace',
  version = '*',
  keys = {
    { '<leader>ot', function() MiniTrailspace.trim() end, desc = 'Trim trailing whitespace' },
  },
  config = function()
    require('mini.trailspace').setup()
  end
}
