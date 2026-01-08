-- Create command to view all keymaps in a buffer
vim.api.nvim_create_user_command('ShowKeymaps', function(opts)
  local sort_mode = opts.args or 'grouped'  -- 'grouped' or 'bymode'

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}

  local modes = {
    { mode = 'n', name = 'NORMAL', short = 'N' },
    { mode = 'i', name = 'INSERT', short = 'I' },
    { mode = 'v', name = 'VISUAL', short = 'V' },
    { mode = 'x', name = 'VISUAL-BLOCK', short = 'X' },
    { mode = 'o', name = 'OPERATOR', short = 'O' },
    { mode = 't', name = 'TERMINAL', short = 'T' },
  }

  if sort_mode == 'grouped' then
    -- Group keymaps by lhs (key)
    local grouped = {}

    for _, m in ipairs(modes) do
      local keymaps = vim.api.nvim_get_keymap(m.mode)
      for _, keymap in ipairs(keymaps) do
        local key = keymap.lhs
        if not grouped[key] then
          grouped[key] = {}
        end
        table.insert(grouped[key], {
          mode = m.short,
          rhs = keymap.rhs or keymap.callback and '<function>' or '',
          desc = keymap.desc or '',
        })
      end
    end

    -- Sort keys alphabetically
    local sorted_keys = {}
    for key in pairs(grouped) do
      table.insert(sorted_keys, key)
    end
    table.sort(sorted_keys)

    table.insert(lines, '=== KEYMAPS GROUPED BY KEY (ALPHABETICAL) ===')
    table.insert(lines, '')

    for _, key in ipairs(sorted_keys) do
      local mappings = grouped[key]

      -- Replace space with <leader> for display
      local display_key = key:gsub('^ ', '<leader>')

      -- Build mode list
      local mode_list = {}
      for _, mapping in ipairs(mappings) do
        table.insert(mode_list, mapping.mode)
      end
      local modes_str = '[' .. table.concat(mode_list, ',') .. ']'

      -- Use first mapping for rhs/desc (usually they're the same across modes)
      local rhs = mappings[1].rhs
      local desc = mappings[1].desc

      local line = string.format('%-20s %-10s -> %-30s %s', display_key, modes_str, rhs, desc)
      table.insert(lines, line)

      -- If mappings differ across modes, show details
      local differs = false
      for i = 2, #mappings do
        if mappings[i].rhs ~= mappings[1].rhs or mappings[i].desc ~= mappings[1].desc then
          differs = true
          break
        end
      end

      if differs then
        for _, mapping in ipairs(mappings) do
          local detail = string.format('  [%s] -> %-30s %s', mapping.mode, mapping.rhs, mapping.desc)
          table.insert(lines, detail)
        end
      end
    end
  else
    -- Original: group by mode
    for _, m in ipairs(modes) do
      table.insert(lines, '')
      table.insert(lines, '=== ' .. m.name .. ' MODE ===')
      table.insert(lines, '')

      local keymaps = vim.api.nvim_get_keymap(m.mode)
      table.sort(keymaps, function(a, b)
        return a.lhs < b.lhs
      end)

      for _, keymap in ipairs(keymaps) do
        local rhs = keymap.rhs or keymap.callback and '<function>' or ''
        local desc = keymap.desc or ''
        local display_key = keymap.lhs:gsub('^ ', '<leader>')
        local line = string.format('%-20s -> %-30s %s', display_key, rhs, desc)
        table.insert(lines, line)
      end
    end
  end

  -- Add helpful header to the beginning
  local header = {
    'View: ' .. (sort_mode == 'grouped' and 'Grouped by key' or 'Grouped by mode'),
    'Usage: :ShowKeymaps [grouped|bymode]',
    '',
  }
  for i = #header, 1, -1 do
    table.insert(lines, 1, header[i])
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'keymaps')

  vim.api.nvim_win_set_buf(0, buf)
  vim.cmd('setlocal nowrap')
end, {
  desc = 'Show all keymaps',
  nargs = '?',
  complete = function()
    return { 'grouped', 'bymode' }
  end
})

-- Add keymap to trigger it
vim.keymap.set('n', '<leader>?k', ':ShowKeymaps<CR>', { desc = 'Show all keymaps' })
