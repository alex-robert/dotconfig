vim.cmd('colorscheme vscode')

-- TODO: using lazy, n mini.files, so needs to triggers on Yazi Rename
if not vim.g.vscode and not vim.g.light then
  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesActionRename",
    callback = function(event)
      Snacks.rename.on_rename_file(event.data.from, event.data.to)
    end,
  })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- local signs = {
--     Error = " ",
--     Warn  = " ",
--     Hint  = "  ",
--     Info  = " ",
-- }
--
-- local signConf = {
--   text = {},
--   texthl = {},
--   numhl = {},
-- }
--
-- for type, icon in pairs(signs) do
--   local severityName = string.upper(type)
--   local severity = vim.diagnostic.severity[severityName]
--   local hl = "DiagnosticSign" .. type
--   signConf.text[severity] = icon
--   signConf.texthl[severity] = h- end
--
-- vim.diagnostic.config({
--   signs = signConf,
-- })

