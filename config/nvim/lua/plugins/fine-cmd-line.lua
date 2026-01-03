return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()

      vim.api.nvim_set_hl(0, "FineCmdlineNormal", { fg = "#d4d4d4" })
      vim.api.nvim_set_hl(0, "FineCmdlineBorder", { fg = "#569CD6", bold = true })
      vim.api.nvim_set_hl(0, "FineCmdlineBorderText", { fg = "#4EC9B0", bold = true, italic = true })

      require('fine-cmdline').setup({
        popup = {
          relative = "editor",
          position = {
            row = '15%',
            col = '35%',
          },
          size = {
            width = '60%',
          },
          border = {
            style = 'rounded',
            text = {
              top = ' <cmd> ',
              top_align = 'center',
            },
          },
          win_options = {
            winhighlight = 'Normal:FineCmdlineNormal,FloatBorder:FineCmdlineBorder,FloatTitle:FineCmdlineBorderText',
          },
        },
      })

      local fine_cmdline_augroup = vim.api.nvim_create_augroup("FineCmdlineProtection", { clear = true })
      local cmdline_open = false

      vim.api.nvim_create_autocmd("CmdlineEnter", {
        group = fine_cmdline_augroup,
        callback = function()
          cmdline_open = true
        end,
      })

      vim.api.nvim_create_autocmd("CmdlineLeave", {
        group = fine_cmdline_augroup,
        callback = function()
          cmdline_open = false
        end,
      })

      vim.keymap.set('n', ':', function()
        if not cmdline_open then
          vim.cmd('FineCmdline')
        end
      end, {noremap = true, desc = "Open fine cmdline"})

    end
  }
}
