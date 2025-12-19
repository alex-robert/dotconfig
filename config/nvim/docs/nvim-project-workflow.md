# Neovim Project Workflow Guide

## Starting a Project Session

### Method 1: Open from project directory
```bash
cd ~/your-project
nvim .                    # Opens nvim in current directory
# or
nvim                      # Opens nvim, then navigate to files
```

### Method 2: Open specific file
```bash
nvim src/main.js          # Opens specific file
nvim package.json README.md   # Opens multiple files in buffers
```

## Core Workflow with Your Custom Keys

### 1. Navigation & Movement
```
Your movement keys: i(up), j(left), k(down), l(right)
```

**Basic movement:**
- `i/j/k/l` - Move cursor up/left/down/right
- `I/J/K/L` - Word movements (up faster/word left/down faster/word right)
- `w` - Jump to end of word (remapped from original 'e')
- `0` - Beginning of line
- `$` - End of line
- `gg` - Top of file  
- `G` - Bottom of file

### 2. File Explorer (nvim-tree)
```
<leader>t = Space + t
```

**In file tree:**
- `i/k` - Navigate up/down files
- `<Enter>` - Open file
- `o` - Open file in new buffer
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `R` - Refresh tree
- `H` - Toggle hidden files
- `q` - Close tree

**Workflow:**
1. `<leader>t` - Open file tree
2. Navigate to file with `i/k`
3. Press `<Enter>` to open
4. `<leader>t` again to close tree

### 3. Finding Files (Telescope)

**Find files:**
```
<leader>ff = Space + f + f
```

**Search in files:**
```
<leader>fg = Space + f + g  
```

**Switch between open files:**
```
<leader>fb = Space + f + b
```

**In Telescope interface:**
- `i/k` - Navigate up/down results
- `<Enter>` - Open selected file
- `<C-x>` - Open in horizontal split
- `<C-v>` - Open in vertical split
- `<C-t>` - Open in new tab
- `<Esc>` - Close telescope

**Workflow:**
1. `<leader>ff` - Quick file search
2. Type filename (fuzzy matching)
3. `<Enter>` to open

### 4. Editing Workflow

**Enter insert mode:**
```
e = Enter insert mode
E = Insert at beginning of line
```

**Other insert modes:**
- `o` - New line below cursor
- `O` - New line above cursor
- `a` - Insert after cursor
- `A` - Insert at end of line

**Exit insert mode:**
- `<Esc>` - Back to normal mode

**Copy/Paste/Delete:**
- `yy` - Copy (yank) line
- `dd` - Delete/cut line
- `p` - Paste after cursor
- `P` - Paste before cursor
- `x` - Delete character

### 5. Working with Multiple Files

**Buffer management:**
- `<leader>fb` - Show open buffers (Telescope)
- `:bn` - Next buffer
- `:bp` - Previous buffer
- `:bd` - Close current buffer

**Window splits:**
- `:split` or `:sp` - Horizontal split
- `:vsplit` or `:vsp` - Vertical split
- `<leader>i/j/k/l` - Navigate between windows
- `<C-w>q` - Close current window

### 6. Search and Replace

**Search:**
- `/searchterm` - Search forward
- `?searchterm` - Search backward
- `n` - Next match
- `N` - Previous match
- `<Esc>` - Clear search highlight

**Replace:**
- `:%s/old/new/g` - Replace all in file
- `:s/old/new/g` - Replace in current line
- `:%s/old/new/gc` - Replace with confirmation

## Typical Project Session Workflow

### 1. Opening Project
```bash
cd ~/my-react-project
nvim .
```

### 2. Quick File Navigation
```
<leader>ff → type "App.js" → <Enter>
```

### 3. Explore Project Structure
```
<leader>t → navigate with i/k → <Enter> to open files
```

### 4. Editing Files
```
e → make changes → <Esc> → :w (save)
```

### 5. Search Across Project
```
<leader>fg → type "useState" → <Enter> on result
```

### 6. Work with Multiple Files
```
<leader>ff → open another file
<leader>fb → switch between open files
```

## Common Development Tasks

### Creating New Files
1. `<leader>t` - Open file tree
2. Navigate to directory
3. `a` - Create new file
4. Type filename
5. `<Enter>` to confirm

### Editing Configuration Files
```bash
nvim package.json        # Open specific file
<leader>ff → "config"    # Or find config files
```

### Working with Imports/Dependencies
1. `<leader>fg` - Search for function usage
2. Type function name
3. Navigate through results with `i/k`
4. `<Enter>` to jump to usage

### Code Navigation
- `gd` - Go to definition (if LSP configured)
- `<C-o>` - Go back to previous location
- `<C-i>` - Go forward
- `*` - Find next occurrence of word under cursor

## Essential Commands Cheat Sheet

### File Operations
- `:w` or `<leader>w` - Save file
- `:q` or `<leader>q` - Quit
- `:wq` or `<leader>x` - Save and quit
- `:q!` - Quit without saving

### Your Custom Keys Summary
- **Movement**: `i`(up), `j`(left), `k`(down), `l`(right)
- **Edit**: `e` (insert mode)
- **File tree**: `<leader>t`
- **Find files**: `<leader>ff`
- **Search**: `<leader>fg`
- **Buffers**: `<leader>fb`
- **Save**: `<leader>w`

### Visual Mode (selecting text)
- `v` - Character selection
- `V` - Line selection
- `<C-v>` - Block selection
- Movement keys work in visual mode
- `y` - Copy selection
- `d` - Delete selection
- `>` - Indent selection
- `<` - Unindent selection

## Pro Tips

1. **Use fuzzy finding**: `<leader>ff` is usually faster than file tree for known files

2. **Search workflow**: `<leader>fg` + search term is incredibly powerful for large projects

3. **Buffer switching**: `<leader>fb` to quickly switch between recently opened files

4. **Stay in normal mode**: Try to spend most time in normal mode, only enter insert mode to make changes

5. **Learn incrementally**: Master movement first, then file operations, then advanced features

## Troubleshooting

**If plugins don't work:**
1. `:Lazy` - Check plugin status
2. `S` to sync if needed
3. Restart Neovim

**If file tree won't open:**
- Try `:NvimTreeOpen` directly
- Check `:messages` for errors

**If telescope won't work:**
- Make sure you're in a directory with files
- Try `:Telescope find_files` directly

Remember: It takes time to build muscle memory, but your custom movement keys should feel natural once you get used to them!