return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>oO",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Toggle  Symbols",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle All Diagnostics",
    },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Toggle Buffer Diagnostics",
    },
    -- {
    --   "<leader>cl",
    --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --   desc = "LSP Definitions ",
    -- },
    -- {
    --   "<leader>oL",
    --   "<cmd>Trouble loclist toggle<cr>",
    --   desc = "Location List",
    -- },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix Diagnostics",
    },
  },
  config = function()
    require('trouble').setup({
      modes = {
        symbols = {
          win = { position = "left", size = 0.22 },
          format = "{kind_icon} {symbol.name}",
        }}
      })
    end

  }
