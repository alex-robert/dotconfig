return {
  'nvim-mini/mini.ai',
  dependencies = {
    'nvim-mini/mini.extra',
  },
  version = '*',
  config = function()
    local ai = require('mini.ai')
    local MiniExtra = require('mini.extra')
    ai.setup({
      mappings = {
        around = 'a',
        inside = 'i',
        around_next = 'an',
        inside_next = 'in',
        around_last = 'al',
        inside_last = 'il',
      },
      custom_textobjects = {
        B = MiniExtra.gen_ai_spec.buffer(),
        F = ai.gen_spec.treesitter({
          a = '@function.outer',
          i = '@function.inner'
        }),
      }
    })
  end
}
