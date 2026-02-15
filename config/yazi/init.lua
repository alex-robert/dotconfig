Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)



require("full-border"):setup {
  type = ui.Border.ROUNDED,
}

-- require("omp"):setup ( {
--   -- config = "$HOME/.config/oh-my-posh/themes/hungry-compact-v3.omp.json"
--   -- config = "Users/alex/.config/oh-my-posh/themes/hungry-compact-v2.omp"
-- } )


