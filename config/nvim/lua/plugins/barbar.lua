return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = true,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      focus_on_close = 'left',
      icons = {
        buffer_index = false,
        buffer_number = false,
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = false },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        gitsigns = {
          added = { enabled = false },
          changed = { enabled = false },
          deleted = { enabled = false },
        },
        filetype = {
          custom_colors = false,
          enabled = true,
        },
        separator = { left = '▎', right = '' },
        separator_at_end = true,
        modified = { button = '●' },
        pinned = { button = '', filename = true },
        preset = 'default',
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = false },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },
      insert_at_end = false,
      insert_at_start = false,
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      minimum_length = 0,
      semantic_letters = true,
      sidebar_filetypes = {
        NvimTree = true,
      },
      no_name_title = nil,
    },
    config = function(_, opts)
      require('barbar').setup(opts)

      local map = vim.keymap.set
      local opts_keymap = { noremap = true, silent = true }

      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts_keymap)
      map('n', '<A-;>', '<Cmd>BufferNext<CR>', opts_keymap)

      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts_keymap)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts_keymap)

      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts_keymap)

      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts_keymap)

      map('n', '<A-C>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts_keymap)

      map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts_keymap)

      map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts_keymap)
      map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts_keymap)
      map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts_keymap)
      map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts_keymap)
      map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts_keymap)
    end,
  },
}
