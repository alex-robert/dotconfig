local M = {}

M.nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, {
    desc = desc,
  })
end

M.xmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, {
    desc = desc,
  })
end

return M
