return {

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { 'folke/ts-comments.nvim', opts = {} },
    },

    branch = 'main',
    build = function()
      -- update parsers, if TSUpdate exists
      if vim.fn.exists(':TSUpdate') == 2 then vim.cmd('TSUpdate') end
    end,

    opts = {},

    config = function(_, opts)
      local ensure_installed = {
        'bash',
        'c',
        'lua',
        'vim',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'json',
        'toml',
        'python',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
      }

      -- make sure nvim-treesitter can load
      local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')

      -- no nvim-treesitter, maybe fresh install
      if not ok then return end
      nvim_treesitter.install(ensure_installed)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function()
      vim.g.no_plugin_maps = true
    end,
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['<leader>nf'] = '@function.outer',
            ['<leader>nc'] = '@class.outer',
            ['<leader>na'] = '@parameter.inner',
          },
          goto_next_end = {
            ['<leader>nF'] = '@function.outer',
            ['<leader>nC'] = '@class.outer',
          },
          goto_previous_start = {
            ['<leader>pf'] = '@function.outer',
            ['<leader>pc'] = '@class.outer',
            ['<leader>pa'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['<leader>pF'] = '@function.outer',
            ['<leader>pC'] = '@class.outer',
          },
        },
      },
    },
  }
}
