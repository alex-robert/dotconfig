local neovim_banner = {
"                                                      ",
"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
"                                                      ",
}

local muny_banner = {
"                                                            ",
"   ██████   ██████ █████  █████ ██████   █████ █████ █████  ",
"  ░░██████ ██████ ░░███  ░░███ ░░██████ ░░███ ░░███ ░░███   ",
"   ░███░█████░███  ░███   ░███  ░███░███ ░███  ░░███ ███    ",
"   ░███░░███ ░███  ░███   ░███  ░███░░███░███   ░░█████     ",
"   ░███ ░░░  ░███  ░███   ░███  ░███ ░░██████    ░░███      ",
"   ░███      ░███  ░███   ░███  ░███  ░░█████     ░███      ",
"   █████     █████ ░░████████   █████  ░░█████    █████     ",
"  ░░░░░     ░░░░░   ░░░░░░░░   ░░░░░    ░░░░░    ░░░░░      ",
"                                                            ",
}


return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = neovim_banner

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      local function footer()
        return "Welcome back!"
      end

      dashboard.section.footer.val = footer()

      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
}
