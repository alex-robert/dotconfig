# NVIM CONFIGURATION CHEATSHEET

## Quick Reference

**Most Common Keymaps:**
- `Space` = Leader key
- `e/E` = Insert mode (i/I replacement)
- `i/j/k/l` = Up/Left/Down/Right (AZERTY IJKL)
- `gc/gcc` = Comment toggle
- `sa/sd/sr` = Surround add/delete/replace
- `<leader>ed` = File explorer (mini.files)
- `<leader>ff/fg` = Find files/grep (Telescope)
- `<leader>gg` = Lazygit
- `gd/gr/gh` = LSP: definition/references/hover

---

## ARCHITECTURE
Your setup uses a hybrid approach:
- **mini.nvim** (via mini.deps) - Core editor features and utilities
- **lazy.nvim** - Standalone plugins for specialized functionality

## MINI.NVIM MODULES (via mini.deps)

### Core Features
- `mini.basics` - Essential autocommands only
- `mini.extra` - Extended functionality and generators
- `mini.icons` - File/folder icons (mocks nvim-web-devicons)
- `mini.misc` - Auto root detection, cursor restore, termbg sync
- `mini.keymap` - Keymap utilities

### Editor Features
- `mini.cmdline` - Enhanced command line
- `mini.tabline` - Tab/buffer line at top
- `mini.trailspace` - Trailing whitespace management
- `mini.comment` - Code commenting (replaces Comment.nvim)
- `mini.pairs` - Auto-pairs (replaces nvim-autopairs)
- `mini.files` - File explorer (replaces neo-tree)
- `mini.ai` - Extended text objects
- `mini.surround` - Surround text operations
- `mini.completion` - Completion engine
- `mini.map` - Code minimap

### Theme
- `miniwinter` colorscheme

## LAZY.NVIM STANDALONE PLUGINS

### LSP & Completion
- `mason.nvim` - LSP/DAP/Linter installer
- `mason-lspconfig.nvim` - Bridge to lspconfig
- `nvim-lspconfig` - LSP configurations
- `nvim-cmp` + sources - Autocompletion (cmp-nvim-lsp, cmp-buffer, cmp-path, luasnip)

### Navigation & Search
- `telescope.nvim` - Fuzzy finder
- `telescope-fzf-native.nvim` - FZF sorter

### Code Intelligence
- `nvim-treesitter` - Syntax parsing/highlighting
- `nvim-treesitter-textobjects` - Enhanced text objects
- `ts-comments.nvim` - Treesitter-aware comments

### Debugging
- `nvim-dap` - Debug Adapter Protocol
- `nvim-dap-ui` - DAP UI
- `mason-nvim-dap` - Auto-install debug adapters

### Database
- `vim-dadbod` - Database interface
- `vim-dadbod-ui` - UI for dadbod
- `vim-dadbod-completion` - SQL completion

### UI & Utilities
- `which-key.nvim` - Keymap hints
- `lualine.nvim` - Statusline
- `gitsigns.nvim` - Git decorations
- `snacks.nvim` - Lazygit integration + statuscolumn
- `render-markdown.nvim` - Markdown rendering
- `codestats.nvim` - Code stats tracking

---

## CUSTOM KEYBINDINGS

### IJKL Movement (AZERTY-optimized)

#### Normal Mode Navigation
```
i = up (k)
j = left (h)
k = down (j)
l = right (l)
e = insert mode (i)
E = insert at line start (I)

I = 5 lines up
J = word backward (b)
K = 5 lines down
L = word forward (w)

w = end of word (e)
W = end of WORD (E)
```

#### Visual Mode
```
i/j/k/l = same as normal mode
```

#### Window Navigation
```
<C-w>i = go to top window
<C-w>j = go to left window
<C-w>k = go to bottom window
<C-w>l = go to right window
<C-w>v = split vertically
<C-w>h = split horizontally
<C-w>e = equal window sizes
<C-w>x = close split
```

### AZERTY Text Objects

#### Operator-pending & Visual
```
iq/aq = inner/around double quotes
iz/az = inner/around single quotes
ip/ap = inner/around parentheses
ib/ab = inner/around braces
ir/ar = inner/around brackets
```

### Treesitter Text Objects

#### Selection
```
af/if = outer/inner function
ac/ic = outer/inner class
aa/ia = outer/inner parameter
```

#### Navigation
```
<leader>nf/nF = next function start/end
<leader>nc/nC = next class start/end
<leader>na = next parameter
<leader>pf/pF = previous function start/end
<leader>pc/pC = previous class start/end
<leader>pa = previous parameter
```

---

## MINI.NVIM DEFAULT KEYBINDINGS & FEATURES

### mini.comment
**Toggle commenting:**
```
gc = toggle comment (works with motions)
gcc = toggle comment on current line
gc<motion> = comment text object (e.g., gcap = comment paragraph)
```
- Supports dot-repeat and count
- Tree-sitter aware comment detection
- Smart indentation handling

### mini.ai (Extended Text Objects)
**Default text objects (use with operators like `d`, `c`, `y`, `v`):**
```
a) i) ab ib = parentheses ( )
a] i] ar ir = brackets [ ]
a} i} aB iB = braces { }
a> i> = angle brackets < >
a' i' aq iq = quotes ' "
at it = tags <tag></tag>
a? i? = user prompt
af if = function call
aa ia = argument/parameter
```

**Custom text objects (configured):**
```
aF iF = treesitter function (@function.outer/inner)
aB iB = buffer (entire file)
```

**Navigation:**
```
g[ = go to left edge of text object
g] = go to right edge of text object
```
- Supports `[count]` to select nth occurrence
- Dot-repeatable
- Search methods: cover, next, previous, nearest

### mini.surround
**Surrounding operations:**
```
sa<motion><char> = add surrounding (e.g., saiw" = surround word with ")
sd<char> = delete surrounding (e.g., sd" = delete surrounding quotes)
sr<old><new> = replace surrounding (e.g., sr"' = replace " with ')
sf<char> = find surrounding to the right
sF<char> = find surrounding to the left
sh<char> = highlight surrounding
```

**Search suffixes:**
```
sn = suffix to search with 'next' method
sl = suffix to search with 'prev' method
```
- Examples: `sdn"` = delete next `"`, `sdl)` = delete previous `)`
- Dot-repeatable
- Supports `[count]`

### mini.pairs
**Auto-pairs (automatic in Insert mode):**
```
( [ { " ' ` = auto-insert closing pair
) ] } = smart closing (jumps over if already there)
<BS> = delete both pairs if between them
<CR> = add blank line between pairs
```
- Quotes won't pair after escape characters or letters
- Context-aware pairing

### mini.completion
**Completion shortcuts:**
```
<C-Space> = force two-step completion
<A-Space> = force fallback completion
<C-f> = scroll info/signature window down
<C-b> = scroll info/signature window up
```
- LSP completion with snippet support
- Automatic signature help
- Completion info in floating windows

### mini.files (IJKL-customized)
**File explorer mappings:**
```
<leader>ed = open mini.files directory browser
q = close explorer
l = expand/open entry
L = expand in new window
j = go to parent directory
J = go to parent in new window
'<char> = jump to bookmark
m<char> = set bookmark
<BS> = reset to current working directory
@ = reveal current working directory
g? = show help
= = apply/synchronize file operations
< = trim columns left
> = trim columns right
```
- Create files/folders by editing buffer
- Delete by removing lines
- Rename by editing text
- Copy/move with cut-paste metaphor

### mini.tabline
**Visual features (no keymaps):**
- Buffer list at top of screen
- Clickable buffer tabs
- Current buffer centered
- Unique buffer names
- Shows tabpage info when multiple tabs exist

### mini.trailspace
**Features (no default keymaps):**
- Automatically highlights trailing whitespace
- Only in Normal mode and modifiable buffers
- Functions available:
  - `MiniTrailspace.trim()` - remove all trailing whitespace
  - `MiniTrailspace.trim_last_lines()` - remove trailing blank lines

### mini.map
**Code minimap (no default keymaps):**
- Functions available:
  - `MiniMap.open()` - open minimap
  - `MiniMap.close()` - close minimap
  - `MiniMap.toggle()` - toggle minimap
  - `MiniMap.refresh()` - refresh minimap
- Shows scrollbar with current position
- Integrates with search, diagnostics, git signs
- Interactive: press `<CR>` to jump, `<Esc>` to cancel

### mini.cmdline
**Enhanced command line (no keymaps):**
- Visual command-line interface
- Automatic popup positioning

### mini.misc
**Utility features (no keymaps):**
- Auto root detection (sets cwd to git root)
- Cursor position restoration on file open
- Terminal background synchronization

### mini.extra
**Extended generators for:**
- Additional pickers for mini.pick
- Additional text object specifications for mini.ai
- Additional visits for mini.visits

---

## LEADER KEY MAPPINGS (Space)

### File Operations
```
<leader>ed = mini.files directory browser
<leader>ff = find files (telescope)
<leader>fg = live grep (telescope)
<leader>fb = find buffers (telescope)
<leader>fh = find help (telescope)
<leader>fr = recent files (telescope)
<leader>fc = git commits (telescope)
```

### LSP
```
gd = go to definition
gr = go to references
gD = go to declaration
gt = go to type definition
gh = hover documentation
<leader>ca = code action
<leader>rn = rename
<leader>d = show diagnostics
[d = previous diagnostic
]d = next diagnostic
```

### Git (gitsigns + snacks)
```
<leader>gg = lazygit (root dir)
<leader>gG = lazygit (cwd)
<leader>gl = lazygit log
<leader>gf = lazygit file history
<leader>gs = stage hunk
<leader>gr = reset hunk
<leader>gp = preview hunk
<leader>gb = blame line
]c = next git hunk
[c = previous git hunk
```

### Debugging (DAP)
```
<leader>db = toggle breakpoint
<leader>dc = continue/start debugging
<leader>di = step into
<leader>do = step over
<leader>dO = step out
<leader>dr = open REPL
<leader>dl = run last
<leader>dt = terminate
<leader>du = toggle DAP UI
```

### Database (dadbod)
```
<leader>db = toggle database UI
<leader>dbf = find database buffer
<leader>dba = add database connection
<leader>S = execute query (in SQL files)
```

### Miscellaneous
```
<leader>? = which-key buffer keymaps
<A-k> = move line/selection down
<A-i> = move line/selection up
< / > = indent left/right (visual mode, repeatable)
```

### Which-key Groups
```
<leader>f = Find
<leader>b = Buffer
<leader>s = Split
<leader>t = Tree/Tab
<leader>g = Git
<leader>c = Code
<leader>m = Multi-cursor
```

---

## COMPLETION KEYBINDINGS

**NOTE:** You have BOTH mini.completion and nvim-cmp active. They may conflict. Consider disabling one.

### nvim-cmp (from lazy plugins)
```
<C-Space> = trigger completion (nvim-cmp override)
<CR> = confirm selection
<Tab> = next item / expand snippet
<S-Tab> = previous item / jump back in snippet
<C-b> = scroll docs up
<C-f> = scroll docs down
<C-e> = abort completion
```

### mini.completion (from mini.nvim)
```
<C-Space> = force two-step completion
<A-Space> = force fallback completion
<C-f> = scroll info/signature window down
<C-b> = scroll info/signature window up
```
See mini.completion section above for details.

---

## REMOVED PLUGINS (now in parking/)

These plugins were replaced by mini.nvim equivalents or snacks:
- `alpha-nvim` - Startup screen (removed entirely)
- `arctic.lua` - Colorscheme (replaced by miniwinter)
- `auto-session` - Session management (removed)
- `comment.lua` - Commenting (replaced by mini.comment)
- `copilot` - AI completion (removed)
- `gutter-marks` - Mark visualization (removed)
- `lazygit.lua` - Git UI (replaced by snacks.lazygit)
- `neotree` - File explorer (replaced by mini.files)
- `nvim-autopairs` - Auto-pairs (replaced by mini.pairs)
- `snacks.lua` (old version - now active with new config)
- `telescope.lua` (old version - now active with updated config)

---

## EDITOR OPTIONS HIGHLIGHTS

```lua
relativenumber = true
tabstop/shiftwidth = 2
hlsearch = false
cursorline = true
cmdheight = 0
clipboard = "unnamedplus"
scrolloff = 20
foldmethod = "syntax"
foldenable = false
mouse = "a" (but drag/release disabled)
```

---

## FILE LOCATIONS

```
config/nvim/init.lua              - Main entry point
config/nvim/lua/options.lua       - Editor options
config/nvim/lua/keymaps.lua       - Custom keybindings
config/nvim/lua/configs/lazy/     - Lazy.nvim setup
config/nvim/lua/configs/mini/     - Mini.nvim modules
config/nvim/lua/plugins/          - Active lazy plugins
config/nvim/lua/plugins/parking/  - Disabled plugins
```
