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


      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end

      local function git_blame()
        local ok, gitsigns = pcall(require, 'gitsigns')
        if not ok then
          return ''
        end

        local blame_info = gitsigns.get_blame_line()
        if not blame_info then
          return ''
        end

        local author = blame_info.author or 'Unknown'
        local date = blame_info.author_time and os.date('%Y-%m-%d', blame_info.author_time) or ''

        if author == 'Not Committed Yet' then
          return ''
        end

        return string.format('%s • %s', author, date)
      end


      require("lualine").setup({
        options = {
          theme = 'powerline_dark',
          -- component_separators = { left = "", right = "" },
          -- section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              -- fmt = function(str)
                --   if vim.b.visual_multi then
                --     local vm_status = vim.fn['VMInfos']()
                --     if vm_status and vm_status.status then
                --       return 'CURSOR [' .. vm_status.status .. ']'
                --     end
                --     return 'CURSOR'
                --   end
                --   return str
                -- end,
              },
            },
            lualine_b = { 'branch', { 'diff', source = diff_source } , 'diagnostics' },
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = {
        --       {
        --         function()
        --           local ok, gitsigns = pcall(require, 'gitsigns')
        --           if not ok then 
        --             return "canot call gitsigns"
        --           end
        --           return "can call gitsigns"
        --           -- local blame_info = gitsigns.get_blame_line()
        --           -- if not blame_info then
        --           --   return 'no blame info'
        --           -- end
        --           -- return blame_info.author or "unknown author"
        --   end,
        --   icon = "",
        -- },
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
