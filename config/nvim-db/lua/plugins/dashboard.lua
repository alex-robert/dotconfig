return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
      ____  ____  _   _ ___
     |  _ \| __ )| | | |_ _|
     | | | |  _ \| | | || |
     | |_| | |_) | |_| || |
     |____/|____/ \___/|___|

    ]],
        keys = {
          { icon = " ", key = "o", desc = "New DB Tab", action = ":tabnew | DBUI" },
          { icon = " ", key = "a", desc = "Add Connection", action = ":DBUI | DBUIAddConnection" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
