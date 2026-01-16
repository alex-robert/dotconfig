return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗██╗   ██╗     ██████╗ ██████╗ ██████╗ ███████╗
████╗  ██║██║   ██║    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██╔██╗ ██║██║   ██║    ██║     ██║   ██║██║  ██║█████╗  
██║╚██╗██║╚██╗ ██╔╝    ██║     ██║   ██║██║  ██║██╔══╝  
██║ ╚████║ ╚████╔╝     ╚██████╗╚██████╔╝██████╔╝███████╗
╚═╝  ╚═══╝  ╚═══╝       ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
]],
        keys = {
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "n", desc = "New Buffer", action = ":enew | startinsert" },
          { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = " ", key = "h", desc = "Recent Files", action = ":Telescope oldfiles" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        {
          { section = "header" },
          { section = "startup" },
        },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
        },
      }
    },
  },
}
