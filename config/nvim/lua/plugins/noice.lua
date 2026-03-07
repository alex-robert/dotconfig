return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        routes = {
          {
            filter = {
              event = "lsp",
              kind = "progress",
              cond = function(message)
                local client = vim.tbl_get(message.opts, "progress", "client")
                return client == "lua_ls"
              end,
            },
            opts = { skip = true },
          },
        },
        views = {
          cmdline_popup = {
            -- relative = "win",
            position = {
              row = "50%",
              col = "50%"
            },
            size = {
              width = 70,
              height = 'auto',
            }
          },
          popupmenu = {
            --  relative = "editor",
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 70,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      })
    end,
  },
}
