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

    -- Auto-hide mini.map when neo-tree is opened
    local minimap_was_open = false

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neo-tree',
      callback = function()
        minimap_was_open = MiniMap.current.win_data ~= nil
        if minimap_was_open then
          MiniMap.close()
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        local neo_tree_visible = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
          if ft == 'neo-tree' then
            neo_tree_visible = true
            break
          end
        end

        if not neo_tree_visible and minimap_was_open then
          local buftype = vim.bo.buftype
          local filetype = vim.bo.filetype
          if buftype == '' and filetype ~= '' and filetype ~= 'neo-tree' then
            vim.defer_fn(function()
              MiniMap.open()
            end, 100)
          end
        end
      end,
    })
  end
}

