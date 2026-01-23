return {
  'nvim-mini/mini.icons',
  config = function()
    local ext3_blocklist = {
      scm = true,
      txt = true,
      yml = true
    }
    local ext4_blocklist = {
      json = true,
      yaml = true
    }
    local MiniIcons = require('mini.icons')
    MiniIcons.setup({
      use_file_extension = function(ext, _)
        return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
      end
    })
    MiniIcons.mock_nvim_web_devicons()
    MiniIcons.tweak_lsp_kind()
  end
}
