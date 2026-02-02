return {
  {
    'nvim-mini/mini.basics',
    version = '*',
    config = function()
      require('mini.basics').setup({
        options = {
          basic = true,
          extra_ui = false,
          win_borders = 'auto',
        },
        mappings = {
          window = true,
        }
      })
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
}
