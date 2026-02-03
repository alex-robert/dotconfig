-- Arctic colorscheme - Standalone version
-- Original: https://github.com/rockyzhang24/arctic.nvim
-- Converted from lush format to standalone

local M = {}

M.setup = function()
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end

  vim.g.colors_name = 'arctic'
  vim.o.background = 'dark'

  -- Color palette
  local c = {
    norm_fg = '#cccccc',
    norm_bg = '#1f1f1f',

    dark_red = '#D16969',
    orange = '#f9ae28',
    brown = '#CE9178',
    yellow = '#DCDCAA',
    yellow_orange = '#D7BA7D',
    green = '#6A9955',
    blue_green = '#4EC9B0',
    light_green = '#B5CEA8',
    blue = '#4fc1ff',
    light_blue = '#9CDCFE',
    dark_blue = '#569CD6',
    cornflower_blue = '#6796E6',
    dark_pink = '#C586C0',
    bright_pink = '#f92672',
    purple = '#ae81ff',

    white = '#ffffff',
    gray = '#51504f',
    gray2 = '#6e7681',
    gray3 = '#808080',
    gray4 = '#9d9d9d',
    black = '#2d2d2d',
    black2 = '#252526',
    black3 = '#282828',
    black4 = '#181818',

    error_red = '#F14C4C',
    warn_yellow = '#CCA700',
    info_blue = '#3794ff',
    hint_gray = '#B0B0B0',
    ok_green = '#89d185',

    selected_item_bg = '#04395e',
    matched_chars = '#2aaaff',
    folded_blue = '#212d3a',
    float_border_fg = '#454545',
    indent_guide_fg = '#404040',
    indent_guide_scope_fg = '#707070',
    label_fg = '#c8c8c8',
    tab_border_fg = '#2b2b2b',
  }

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Preset
  hl('TabBorder', { fg = c.tab_border_fg })
  hl('FloatBorder', { fg = c.float_border_fg })
  hl('SelectionHighlightBackground', { bg = '#343a41' })
  hl('LightBulb', { fg = '#ffcc00' })
  hl('CodeLens', { fg = '#999999' })
  hl('GutterGitAdded', { fg = '#2ea043' })
  hl('GutterGitDeleted', { fg = '#f85149' })
  hl('GutterGitModified', { fg = '#0078d4' })
  hl('Breadcrumb', { fg = '#a9a9a9', bg = c.norm_bg })
  hl('ScrollbarGutter', { bg = c.norm_bg })
  hl('ScrollbarSlider', { bg = '#434343' })
  hl('ScrollbarSliderHover', { bg = '#4f4f4f' })
  hl('PeekViewBorder', { fg = '#3794ff' })
  hl('PeekViewNormal', { bg = c.norm_bg })
  hl('PeekViewTitle', { fg = c.white })
  hl('PeekViewCursorLine', { bg = c.black3 })
  hl('PeekViewMatchHighlight', { bg = '#5d4616' })
  hl('GhostText', { fg = '#6b6b6b' })
  hl('Icon', { fg = '#cccccc' })
  hl('Description', { fg = c.gray4 })
  hl('ProgressBar', { fg = '#0078d4' })
  hl('MatchedCharacters', { fg = c.matched_chars })
  hl('Hint', { fg = c.matched_chars })
  hl('UnnecessaryCode', { fg = '#729db4' })

  -- Git diff
  hl('DiffTextAdded', { bg = '#214d29' })
  hl('DiffTextDeleted', { bg = '#712928' })
  hl('DiffTextChanged', { bg = '#0E2FDC' })
  hl('DiffLineAdded', { bg = '#203424' })
  hl('DiffLineDeleted', { bg = '#442423' })
  hl('DiffLineChanged', { bg = '#0e2f44' })

  -- Quickfix
  hl('QfFileName', { fg = c.white })
  hl('QfSelection', { bg = '#3a3d41' })
  hl('QfText', { fg = '#bbbbbb' })

  -- Inline hints
  hl('InlayHint', { fg = '#969696', bg = '#242424' })
  hl('InlayHintType', { fg = '#969696', bg = '#242424' })

  -- Editor
  hl('Normal', { fg = c.norm_fg, bg = c.norm_bg })
  hl('CursorLine', { bg = c.black3 })
  hl('CursorColumn', { bg = c.black3 })
  hl('ColorColumn', { bg = c.black2 })
  hl('Conceal', { fg = c.gray2 })
  hl('Cursor', { fg = c.norm_bg, bg = c.norm_fg })
  hl('Directory', { fg = c.dark_blue })
  hl('DiffAdd', { bg = '#203424' })
  hl('DiffDelete', { bg = '#442423' })
  hl('DiffChange', { bg = '#0e2f44' })
  hl('DiffText', { bg = '#0E2FDC' })
  hl('EndOfBuffer', { fg = c.norm_bg })
  hl('ErrorMsg', { fg = c.error_red })
  hl('WinSeparator', { fg = '#333333' })
  hl('VirtSplit', { fg = '#333333' })
  hl('LineNr', { fg = c.gray2 })
  hl('CursorLineNr', { fg = '#cccccc' })
  hl('Folded', { bg = c.folded_blue })
  hl('CursorLineFold', { fg = '#cccccc' })
  hl('FoldColumn', { fg = c.gray2 })
  hl('SignColumn', { bg = c.norm_bg })
  hl('IncSearch', { bg = '#9e6a03' })
  hl('MatchParen', { bg = c.gray, bold = true, underline = true })
  hl('ModeMsg', { fg = c.norm_fg })
  hl('MsgArea', { fg = c.norm_fg })
  hl('MoreMsg', { fg = c.norm_fg })
  hl('NonText', { fg = c.gray2 })
  hl('Pmenu', { fg = c.norm_fg, bg = c.norm_bg })
  hl('PmenuSel', { fg = c.white, bg = c.selected_item_bg })
  hl('PmenuSbar', { bg = c.norm_bg })
  hl('PmenuThumb', { bg = '#434343' })
  hl('PmenuMatch', { fg = c.matched_chars, bg = c.norm_bg })
  hl('PmenuMatchSel', { fg = c.matched_chars, bg = c.selected_item_bg, bold = true })
  hl('NormalFloat', { fg = c.norm_fg, bg = c.norm_bg })
  hl('Question', { fg = c.dark_blue })
  hl('QuickFixLine', { bg = '#3a3d41' })
  hl('Search', { bg = '#623315' })
  hl('SpecialKey', { fg = c.gray2 })
  hl('SpellBad', { undercurl = true, sp = c.error_red })
  hl('SpellCap', { undercurl = true, sp = c.warn_yellow })
  hl('SpellLocal', { undercurl = true, sp = c.info_blue })
  hl('SpellRare', { undercurl = true, sp = c.info_blue })
  hl('StatusLine', { bg = c.black4 })
  hl('StatusLineNC', { fg = c.gray, bg = c.black4 })
  hl('TabLine', { fg = c.gray4, bg = c.black4, underline = true, sp = c.tab_border_fg })
  hl('TabLineFill', { bg = c.black4, underline = true, sp = c.tab_border_fg })
  hl('TabLineSel', { fg = c.white, bg = c.norm_bg, bold = true, underline = true, sp = c.tab_border_fg })
  hl('Title', { fg = c.dark_blue, bold = true })
  hl('Visual', { bg = '#264F78' })
  hl('WarningMsg', { fg = c.warn_yellow })
  hl('Whitespace', { fg = '#3e3e3d' })
  hl('WildMenu', { fg = c.white, bg = c.selected_item_bg })
  hl('Winbar', { fg = '#a9a9a9', bg = c.norm_bg })
  hl('WinbarNC', { fg = '#a9a9a9', bg = c.norm_bg })

  -- Syntax
  hl('Comment', { fg = c.green, italic = true })
  hl('Constant', { fg = c.dark_blue })
  hl('String', { fg = c.brown })
  hl('Character', { fg = c.dark_blue })
  hl('Number', { fg = c.light_green })
  hl('Boolean', { fg = c.dark_blue })
  hl('Float', { fg = c.light_green })
  hl('Identifier', { fg = c.light_blue })
  hl('Function', { fg = c.yellow })
  hl('Statement', { fg = c.dark_pink })
  hl('Conditional', { fg = c.dark_pink })
  hl('Repeat', { fg = c.dark_pink })
  hl('Label', { fg = c.dark_pink })
  hl('Operator', { fg = c.norm_fg })
  hl('Keyword', { fg = c.dark_blue })
  hl('Exception', { fg = c.dark_pink })
  hl('PreProc', { fg = c.dark_pink })
  hl('Include', { fg = c.dark_pink })
  hl('Define', { fg = c.dark_pink })
  hl('Macro', { fg = c.dark_pink })
  hl('PreCondit', { fg = c.dark_pink })
  hl('Type', { fg = c.dark_blue })
  hl('StorageClass', { fg = c.dark_blue })
  hl('Structure', { fg = c.dark_blue })
  hl('Typedef', { fg = c.dark_blue })
  hl('Special', { fg = c.yellow_orange })
  hl('SpecialChar', { fg = c.yellow_orange })
  hl('Tag', { fg = c.yellow_orange })
  hl('Delimiter', { fg = c.yellow_orange })
  hl('SpecialComment', { fg = c.yellow_orange })
  hl('Debug', { fg = c.yellow_orange })
  hl('Underlined', { underline = true })
  hl('Error', { fg = c.error_red })
  hl('Todo', { fg = c.norm_bg, bg = c.yellow_orange, bold = true })

  -- diff
  hl('diffAdded', { fg = '#2ea043' })
  hl('diffRemoved', { fg = '#f85149' })
  hl('diffChanged', { fg = '#0078d4' })

  -- LSP
  hl('LspReferenceText', { bg = '#343a41' })
  hl('LspReferenceRead', { bg = '#343a41' })
  hl('LspReferenceWrite', { bg = '#343a41' })
  hl('LspCodeLens', { fg = '#999999' })
  hl('LspSignatureActiveParameter', { fg = c.matched_chars })
  hl('LspInlayHint', { fg = '#969696', bg = '#242424' })

  -- Diagnostics
  hl('DiagnosticError', { fg = c.error_red })
  hl('DiagnosticWarn', { fg = c.warn_yellow })
  hl('DiagnosticInfo', { fg = c.info_blue })
  hl('DiagnosticHint', { fg = c.hint_gray })
  hl('DiagnosticOk', { fg = c.ok_green })
  hl('DiagnosticVirtualTextError', { fg = c.error_red, bg = '#332323' })
  hl('DiagnosticVirtualTextWarn', { fg = c.warn_yellow, bg = '#2f2c1b' })
  hl('DiagnosticVirtualTextInfo', { fg = c.info_blue, bg = '#212a35' })
  hl('DiagnosticVirtualTextHint', { fg = c.hint_gray, bg = c.black })
  hl('DiagnosticVirtualTextOk', { fg = c.ok_green, bg = '#233323' })
  hl('DiagnosticUnderlineError', { undercurl = true, sp = c.error_red })
  hl('DiagnosticUnderlineWarn', { undercurl = true, sp = c.warn_yellow })
  hl('DiagnosticUnderlineInfo', { undercurl = true, sp = c.info_blue })
  hl('DiagnosticUnderlineHint', { undercurl = true, sp = c.hint_gray })
  hl('DiagnosticUnderlineOk', { undercurl = true, sp = c.ok_green })
  hl('DiagnosticFloatingError', { fg = c.error_red })
  hl('DiagnosticFloatingWarn', { fg = c.warn_yellow })
  hl('DiagnosticFloatingInfo', { fg = c.info_blue })
  hl('DiagnosticFloatingHint', { fg = c.hint_gray })
  hl('DiagnosticFloatingOk', { fg = c.ok_green })
  hl('DiagnosticSignError', { fg = c.error_red })
  hl('DiagnosticSignWarn', { fg = c.warn_yellow })
  hl('DiagnosticSignInfo', { fg = c.info_blue })
  hl('DiagnosticSignHint', { fg = c.hint_gray })
  hl('DiagnosticSignOk', { fg = c.ok_green })
  hl('DiagnosticUnnecessary', { fg = '#729db4', undercurl = true })
  hl('DiagnosticDeprecated', { fg = c.gray3, strikethrough = true })

  -- Symbol kinds
  hl('SymbolKindText', { fg = '#cccccc' })
  hl('SymbolKindMethod', { fg = '#b180d7' })
  hl('SymbolKindFunction', { fg = '#b180d7' })
  hl('SymbolKindConstructor', { fg = '#b180d7' })
  hl('SymbolKindField', { fg = '#75beff' })
  hl('SymbolKindVariable', { fg = '#75beff' })
  hl('SymbolKindClass', { fg = '#ee9d28' })
  hl('SymbolKindInterface', { fg = '#75beff' })
  hl('SymbolKindModule', { fg = '#cccccc' })
  hl('SymbolKindProperty', { fg = '#cccccc' })
  hl('SymbolKindUnit', { fg = '#cccccc' })
  hl('SymbolKindValue', { fg = '#cccccc' })
  hl('SymbolKindEnum', { fg = '#ee9d28' })
  hl('SymbolKindKeyword', { fg = '#cccccc' })
  hl('SymbolKindSnippet', { fg = '#cccccc' })
  hl('SymbolKindColor', { fg = '#cccccc' })
  hl('SymbolKindFile', { fg = '#cccccc' })
  hl('SymbolKindReference', { fg = '#cccccc' })
  hl('SymbolKindFolder', { fg = '#cccccc' })
  hl('SymbolKindEnumMember', { fg = '#75beff' })
  hl('SymbolKindConstant', { fg = '#cccccc' })
  hl('SymbolKindStruct', { fg = '#cccccc' })
  hl('SymbolKindEvent', { fg = '#ee9d28' })
  hl('SymbolKindOperator', { fg = '#cccccc' })
  hl('SymbolKindTypeParameter', { fg = '#cccccc' })
  hl('SymbolKindArray', { fg = '#cccccc' })
  hl('SymbolKindBoolean', { fg = '#cccccc' })
  hl('SymbolKindKey', { fg = '#cccccc' })
  hl('SymbolKindNamespace', { fg = '#cccccc' })
  hl('SymbolKindString', { fg = '#cccccc' })
  hl('SymbolKindNull', { fg = '#cccccc' })
  hl('SymbolKindNumber', { fg = '#cccccc' })
  hl('SymbolKindObject', { fg = '#cccccc' })
  hl('SymbolKindPackage', { fg = '#cccccc' })

  -- Treesitter
  hl('@variable', { fg = c.light_blue })
  hl('@variable.builtin', { fg = c.dark_blue })
  hl('@variable.parameter', { fg = c.orange })
  hl('@variable.parameter.builtin', { fg = c.orange })
  hl('@variable.member', { fg = c.light_blue })
  hl('@constant', { fg = c.dark_blue })
  hl('@constant.builtin', { fg = c.dark_blue })
  hl('@constant.macro', { fg = c.dark_blue })
  hl('@module', { fg = c.blue_green })
  hl('@module.builtin', { fg = c.blue_green })
  hl('@label', { fg = c.label_fg })
  hl('@string', { fg = c.brown })
  hl('@string.documentation', { fg = c.brown })
  hl('@string.regexp', { fg = c.dark_red })
  hl('@string.escape', { fg = c.yellow_orange })
  hl('@string.special', { fg = c.yellow_orange })
  hl('@string.special.symbol', { fg = c.yellow_orange })
  hl('@string.special.url', { fg = c.yellow_orange })
  hl('@string.special.path', { fg = c.yellow_orange })
  hl('@character', { fg = c.dark_blue })
  hl('@character.special', { fg = c.yellow_orange })
  hl('@boolean', { fg = c.dark_blue })
  hl('@number', { fg = c.light_green })
  hl('@number.float', { fg = c.light_green })
  hl('@type', { fg = c.blue_green })
  hl('@type.builtin', { fg = c.dark_blue })
  hl('@type.definition', { fg = c.blue_green })
  hl('@attribute', { fg = c.blue_green })
  hl('@attribute.builtin', { fg = c.blue_green })
  hl('@property', { fg = c.light_blue })
  hl('@function', { fg = c.yellow })
  hl('@function.builtin', { fg = c.yellow })
  hl('@function.call', { fg = c.yellow })
  hl('@function.macro', { fg = c.yellow })
  hl('@function.method', { fg = c.yellow })
  hl('@function.method.call', { fg = c.yellow })
  hl('@constructor', { fg = c.blue_green })
  hl('@operator', { fg = c.norm_fg })
  hl('@keyword', { fg = c.dark_blue })
  hl('@keyword.coroutine', { fg = c.dark_pink })
  hl('@keyword.function', { fg = c.dark_blue })
  hl('@keyword.operator', { fg = c.norm_fg })
  hl('@keyword.import', { fg = c.dark_pink })
  hl('@keyword.type', { fg = c.dark_blue })
  hl('@keyword.modifier', { fg = c.dark_blue })
  hl('@keyword.repeat', { fg = c.dark_pink })
  hl('@keyword.return', { fg = c.dark_pink })
  hl('@keyword.debug', { fg = c.yellow_orange })
  hl('@keyword.exception', { fg = c.dark_pink })
  hl('@keyword.conditional', { fg = c.dark_pink })
  hl('@keyword.conditional.ternary', { fg = c.norm_fg })
  hl('@keyword.directive', { fg = c.dark_pink })
  hl('@keyword.directive.define', { fg = c.dark_pink })
  hl('@punctuation.delimiter', { fg = c.norm_fg })
  hl('@punctuation.bracket', { fg = c.norm_fg })
  hl('@punctuation.special', { fg = c.dark_blue })
  hl('@comment', { fg = c.green, italic = true })
  hl('@comment.documentation', { fg = c.green, italic = true })
  hl('@comment.error', { fg = c.error_red })
  hl('@comment.warning', { fg = c.warn_yellow })
  hl('@comment.hint', { fg = c.hint_gray })
  hl('@comment.info', { fg = c.info_blue })
  hl('@comment.todo', { fg = c.norm_bg, bg = c.yellow_orange, bold = true })
  hl('@markup.strong', { fg = c.norm_fg, bold = true })
  hl('@markup.italic', { fg = c.norm_fg, italic = true })
  hl('@markup.strikethrough', { fg = c.norm_fg, strikethrough = true })
  hl('@markup.underline', { fg = c.norm_fg, underline = true })
  hl('@markup.heading', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.1', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.2', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.3', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.4', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.5', { fg = c.dark_blue, bold = true })
  hl('@markup.heading.6', { fg = c.dark_blue, bold = true })
  hl('@markup.quote', { fg = c.green })
  hl('@markup.math', { fg = c.blue_green })
  hl('@markup.link', { fg = c.brown })
  hl('@markup.link.label', { fg = c.brown })
  hl('@markup.link.url', { fg = c.brown })
  hl('@markup.raw', { fg = c.brown })
  hl('@markup.raw.block', { fg = c.norm_fg })
  hl('@markup.list', { fg = c.cornflower_blue })
  hl('@diff.plus', { bg = '#214d29' })
  hl('@diff.minus', { bg = '#712928' })
  hl('@diff.delta', { bg = '#0E2FDC' })
  hl('@tag', { fg = c.dark_blue })
  hl('@tag.builtin', { fg = c.dark_blue })
  hl('@tag.attribute', { fg = c.light_blue })
  hl('@tag.delimiter', { fg = c.gray3 })

  -- Language specific - Lua
  hl('@variable.member.lua', { fg = c.blue_green })

  -- LSP semantic tokens
  hl('@lsp.type.namespace', { fg = c.blue_green })
  hl('@lsp.type.type', { fg = c.blue_green })
  hl('@lsp.type.class', { fg = c.blue_green })
  hl('@lsp.type.enum', { fg = c.dark_blue })
  hl('@lsp.type.interface', { fg = c.blue_green })
  hl('@lsp.type.struct', { fg = c.blue_green })
  hl('@lsp.type.typeParameter', { fg = c.blue_green })
  hl('@lsp.type.parameter', { fg = c.orange })
  hl('@lsp.type.variable', { fg = c.light_blue })
  hl('@lsp.type.property', { fg = c.light_blue })
  hl('@lsp.type.enumMember', { fg = c.blue })
  hl('@lsp.type.event', { fg = c.blue_green })
  hl('@lsp.type.function', { fg = c.yellow })
  hl('@lsp.type.method', { fg = c.yellow })
  hl('@lsp.type.macro', { fg = c.dark_blue })
  hl('@lsp.type.keyword', { fg = c.dark_blue })
  hl('@lsp.type.comment', { fg = c.green, italic = true })
  hl('@lsp.type.string', { fg = c.brown })
  hl('@lsp.type.number', { fg = c.light_green })
  hl('@lsp.type.regexp', { fg = c.dark_red })
  hl('@lsp.type.operator', { fg = c.norm_fg })
  hl('@lsp.type.decorator', { fg = c.blue_green })
  hl('@lsp.type.escapeSequence', { fg = c.yellow_orange })
  hl('@lsp.type.formatSpecifier', { fg = c.light_blue })
  hl('@lsp.type.builtinType', { fg = c.dark_blue })
  hl('@lsp.type.typeAlias', { fg = c.blue_green })
  hl('@lsp.type.unresolvedReference', { undercurl = true, sp = c.error_red })
  hl('@lsp.type.lifetime', { fg = c.dark_blue })
  hl('@lsp.type.generic', { fg = c.light_blue })
  hl('@lsp.type.selfKeyword', { fg = c.dark_blue })
  hl('@lsp.type.selfTypeKeyword', { fg = c.dark_blue })
  hl('@lsp.type.deriveHelper', { fg = c.blue_green })
  hl('@lsp.type.modifier', { fg = c.dark_blue })
  hl('@lsp.typemod.type.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.typeAlias.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.class.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.variable.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.function.defaultLibrary', { fg = c.yellow })
  hl('@lsp.typemod.method.defaultLibrary', { fg = c.yellow })
  hl('@lsp.typemod.macro.defaultLibrary', { fg = c.yellow })
  hl('@lsp.typemod.struct.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.enum.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.enumMember.defaultLibrary', { fg = c.dark_blue })
  hl('@lsp.typemod.variable.readonly', { fg = c.blue })
  hl('@lsp.typemod.variable.callable', { fg = c.yellow })
  hl('@lsp.typemod.variable.static', { fg = c.dark_blue })
  hl('@lsp.typemod.property.readonly', { fg = c.blue })
  hl('@lsp.typemod.keyword.async', { fg = c.dark_pink })
  hl('@lsp.typemod.keyword.injected', { fg = c.dark_blue })
  hl('@lsp.typemod.operator.injected', { fg = c.norm_fg })
  hl('@lsp.typemod.string.injected', { fg = c.brown })
  hl('@lsp.typemod.variable.injected', { fg = c.light_blue })
  hl('@lsp.type.property.lua', { fg = c.blue_green })

  -- Plugin highlights
  hl('LspInfoBorder', { fg = c.float_border_fg })

  -- nvim-cmp
  hl('CmpItemAbbrDeprecated', { fg = c.gray3, strikethrough = true })
  hl('CmpItemAbbrMatch', { fg = c.matched_chars })
  hl('CmpItemAbbrMatchFuzzy', { fg = c.matched_chars })
  hl('CmpItemMenu', { fg = c.gray4 })
  hl('CmpItemKindText', { fg = '#cccccc' })
  hl('CmpItemKindMethod', { fg = '#b180d7' })
  hl('CmpItemKindFunction', { fg = '#b180d7' })
  hl('CmpItemKindConstructor', { fg = '#b180d7' })
  hl('CmpItemKindField', { fg = '#75beff' })
  hl('CmpItemKindVariable', { fg = '#75beff' })
  hl('CmpItemKindClass', { fg = '#ee9d28' })
  hl('CmpItemKindInterface', { fg = '#75beff' })
  hl('CmpItemKindModule', { fg = '#cccccc' })
  hl('CmpItemKindProperty', { fg = '#cccccc' })
  hl('CmpItemKindUnit', { fg = '#cccccc' })
  hl('CmpItemKindValue', { fg = '#cccccc' })
  hl('CmpItemKindEnum', { fg = '#ee9d28' })
  hl('CmpItemKindKeyword', { fg = '#cccccc' })
  hl('CmpItemKindSnippet', { fg = '#cccccc' })
  hl('CmpItemKindColor', { fg = '#cccccc' })
  hl('CmpItemKindFile', { fg = '#cccccc' })
  hl('CmpItemKindReference', { fg = '#cccccc' })
  hl('CmpItemKindFolder', { fg = '#cccccc' })
  hl('CmpItemKindEnumMember', { fg = '#75beff' })
  hl('CmpItemKindConstant', { fg = '#cccccc' })
  hl('CmpItemKindStruct', { fg = '#cccccc' })
  hl('CmpItemKindEvent', { fg = '#ee9d28' })
  hl('CmpItemKindOperator', { fg = '#cccccc' })
  hl('CmpItemKindTypeParameter', { fg = '#cccccc' })
  hl('SuggestWidgetBorder', { fg = c.float_border_fg })
  hl('SuggestWidgetSelect', { bg = c.selected_item_bg })

  -- Gitsigns
  hl('GitSignsAdd', { fg = '#2ea043' })
  hl('GitSignsChange', { fg = '#0078d4' })
  hl('GitSignsDelete', { fg = '#f85149' })
  hl('GitSignsAddNr', { fg = '#2ea043' })
  hl('GitSignsChangeNr', { fg = '#0078d4' })
  hl('GitSignsDeleteNr', { fg = '#f85149' })
  hl('GitSignsAddLn', { bg = '#203424' })
  hl('GitSignsChangeLn', { bg = '#0e2f44' })
  hl('GitSignsDeleteLn', { bg = '#442423' })
  hl('GitSignsAddInline', { bg = '#214d29' })
  hl('GitSignsChangeInline', { bg = '#0E2FDC' })
  hl('GitSignsDeleteInline', { bg = '#712928' })

  -- Telescope
  hl('TelescopeBorder', { fg = c.float_border_fg })
  hl('TelescopePromptBorder', { fg = c.float_border_fg })
  hl('TelescopeResultsBorder', { fg = c.float_border_fg })
  hl('TelescopePreviewBorder', { fg = c.float_border_fg })
  hl('TelescopeSelection', { fg = c.white, bg = c.selected_item_bg })
  hl('TelescopeSelectionCaret', { fg = c.white, bg = c.selected_item_bg })
  hl('TelescopeMultiIcon', { fg = c.blue_green })
  hl('TelescopeMatching', { fg = c.matched_chars })
  hl('TelescopeNormal', { fg = c.norm_fg, bg = c.norm_bg })
  hl('TelescopePromptPrefix', { fg = '#cccccc' })

  -- indent-blankline
  hl('IblIndent', { fg = c.indent_guide_fg })
  hl('IblScope', { fg = c.indent_guide_scope_fg })

  -- nvim-ufo
  hl('UfoPreviewBorder', { fg = '#3794ff' })
  hl('UfoPreviewNormal', { bg = c.norm_bg })
  hl('UfoPreviewCursorLine', { bg = c.black3 })
  hl('UfoFoldedFg', { fg = c.norm_fg })
  hl('UfoFoldedBg', { bg = c.folded_blue })
  hl('UfoCursorFoldedLine', { bg = '#2F3C48', bold = true, italic = true })
  hl('UfoPreviewSbar', { bg = c.norm_bg })
  hl('UfoPreviewThumb', { bg = '#434343' })
  hl('UfoFoldedEllipsis', { fg = '#989ca0' })

  -- Treesitter context
  hl('TreesitterContextLineNumber', { fg = '#4d535a' })
  hl('TreesitterContextBottom', { underline = true, sp = c.float_border_fg })
end

return M
