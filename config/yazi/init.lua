-- Show symlink in status bar
Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)

require("git"):setup {
  order = 1500,
}

require("full-border"):setup {
  type = ui.Border.ROUNDED,
}

require("duckdb"):setup()


require("mux"):setup({
  notify_on_switch = true,
  aliases = {
    eza_tree_1 = {
      previewer = "piper",
      args = {
        'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 1 --color=always --icons=always --group-directories-first --no-quotes .',
      },
    },
    eza_tree_2 = {
      previewer = "piper",
      args = {
        'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 2 --color=always --icons=always --group-directories-first --no-quotes .',
      },
    },
    eza_tree_3 = {
      previewer = "piper",
      args = {
        'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 3 --color=always --icons=always --group-directories-first --no-quotes .',
      },
    },
    eza_tree_4 = {
      previewer = "piper",
      args = {
        'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 4 --color=always --icons=always --group-directories-first --no-quotes .',
      },
    },
  },
})
