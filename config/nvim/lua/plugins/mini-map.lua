return {
  'nvim-mini/mini.map',
  version = '*',
  config = function()
    local MiniMap = require('mini.map')
    MiniMap.setup({
      window = {
        show_integration_count = false
      },
      symbols = { encode = MiniMap.gen_encode_symbols.dot('4x2') },
      integrations = {
        MiniMap.gen_integration.builtin_search(),
        MiniMap.gen_integration.diagnostic(),
        MiniMap.gen_integration.gitsigns(),
      },
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        local buftype = vim.bo.buftype
        local filetype = vim.bo.filetype

        local code_filetypes = {
          'lua', 'python', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
          'rust', 'go', 'c', 'cpp', 'java', 'ruby', 'php', 'html', 'css', 'scss',
          'json', 'yaml', 'toml', 'vim', 'sh', 'bash', 'zsh', 'sql',
        }

        local exclude_filetypes = {
          'markdown', 'text', 'help', 'man', 'gitcommit',
        }

        if buftype == '' and filetype ~= '' then
          local is_code = vim.tbl_contains(code_filetypes, filetype)
          local is_excluded = vim.tbl_contains(exclude_filetypes, filetype)

          if is_code and not is_excluded then
            local line_count = vim.api.nvim_buf_line_count(0)
            if line_count > 50 and line_count < 5000 then
              MiniMap.open()
            end
          end
        end
      end,
    })
    vim.keymap.set('n', '<leader>om', '<Cmd>lua MiniMap.toggle()<CR>', { desc = 'Toggle minimap' })
  end
}
