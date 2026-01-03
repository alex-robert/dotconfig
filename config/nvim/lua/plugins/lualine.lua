return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function vm_mode()
        local vm_info = vim.b['visual_multi']
        if vm_info then
          local count = vim.fn['VMInfos']().status
          return 'V-M [' .. (count or '?') .. ']'
        end
        return ''
      end


      require("lualine").setup({
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                if vim.b.visual_multi then
                  local vm_status = vim.fn['VMInfos']()
                  if vm_status and vm_status.status then
                    return 'CURSOR [' .. vm_status.status .. ']'
                  end
                  return 'CURSOR'
                end
                return str
              end,
            },
          },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end,
  },
}
