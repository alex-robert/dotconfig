return {
  'nvim-mini/mini.clue',
  version = '*',
  config = function()
    local MiniClue = require('mini.clue')
    MiniClue.setup({
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = 's' },
        { mode = 'x', keys = 's' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },

        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'n', keys = '"' },
      },
      clues = {
        { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
        { mode = 'n', keys = '<Leader>l', desc = '+Line Numbers' },
        { mode = 'n', keys = '<Leader>c', desc = '+LSP actions' },
        { mode = 'n', keys = '<Leader>d', desc = '+Debug' },
        { mode = 'n', keys = '<Leader>e', desc = '+Explore' },
        { mode = 'n', keys = '<Leader>f', desc = '+Find' },
        { mode = 'n', keys = '<Leader>g', desc = '+Git & LSP' },
        -- { mode = 'n', keys = '<Leader>n', desc = '+Move' },
        { mode = 'n', keys = '<Leader>o', desc = '+Code Utils' },
        -- { mode = 'n', keys = '<Leader>p', desc = '+Swap' },
        { mode = 'n', keys = '<Leader>r', desc = '+Rename' },
        { mode = 'n', keys = '<Leader>s', desc = '+Scratchpad' },
        { mode = 'n', keys = '<Leader>S', desc = '+Sessions' },
        { mode = 'n', keys = '<Leader>t', desc = '+Tabs' },
        { mode = 'n', keys = 's', desc = '+Surround' },
        { mode = 'n', keys = 'sa', desc = '+Add' },
        { mode = 'x', keys = 's', desc = '+Surround' },
        { mode = 'x', keys = 'sa', desc = '+Add' },
        MiniClue.gen_clues.g(),
        MiniClue.gen_clues.marks(),
        MiniClue.gen_clues.registers(),
        MiniClue.gen_clues.windows(),
        MiniClue.gen_clues.z(),
      },
      window = {
        delay = 400,
        config = {
          width = 'auto',
          border = 'rounded',
        },
      },
    })
  end
}
