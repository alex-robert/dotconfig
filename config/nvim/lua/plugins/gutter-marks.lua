return {
  {
    "dimtion/guttermarks.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "FileType" },
    config = function()
      require("guttermarks").setup({
        local_mark = {
          enabled = true,
          sign = nil,
          highlight_group = "GutterMarksLocal",
          priority = 10,
        },
        global_mark = {
          enabled = true,
          sign = nil,
          highlight_group = "GutterMarksGlobal",
          priority = 11,
        },
        special_mark = {
          enabled = false,
          sign = nil,
          marks = { "'", "^", ".", "[", "]", "<", ">", '"', "`", '"', "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" },
          highlight_group = "GutterMarksSpecial",
          priority = 10,
        },
        excluded_filetypes = { "" },
        excluded_buftypes = {},
        -- Advanced: Customize Autocmd events that trigger a refresh
        autocmd_triggers = {
          "BufEnter",
          "BufWritePost",
          "TextChanged",
          "TextChangedI",
        },
      })
    end
  }
}
