return {
  {
    'hedyhli/outline.nvim',
    keys = {
      { "<leader>oo", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup({
        outline_window = {
          position = 'left',  -- Left side to avoid mini.map on right
          width = 26,
          relative_width = true,
          auto_jump = true,
        },
        keymaps = {
          -- Navigation (IJKL scheme)
          up_and_jump = 'i',      -- i = up
          down_and_jump = 'k',    -- k = down

          -- Folding (use j/l for left/right metaphor)
          close_fold = 'j',       -- j = left = close
          open_fold = 'l',        -- l = right = open
          toggle_fold = '<Tab>',
          close_all_folds = 'J',  -- Shift+J = close all
          open_all_folds = 'L',   -- Shift+L = open all

          -- Actions
          goto_location = '<CR>',
          peek_location = 'p',
          goto_and_close = 'o',
          restore_location = '<C-g>',
          hover_symbol = 'gh',
          rename_symbol = 'r',
          code_actions = 'a',

          -- Window
          close = 'q',
        },
      })
    end,
  },
}
