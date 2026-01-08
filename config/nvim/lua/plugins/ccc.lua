return {
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup({
        highlighter = {
          auto_enable = true,
          max_byte = 100 * 1024, -- 100 KB

        }
      })
    end
  }
}
