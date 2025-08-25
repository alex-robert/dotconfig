# Neovim `vim.keymap.set()` Function Explained

## Basic Syntax
```lua
vim.keymap.set(mode, lhs, rhs, opts)
```

## Arguments Breakdown

### 1. `mode` (string or table)
Specifies which Vim mode(s) the mapping applies to:

```lua
-- Single mode examples
keymap.set("n", "i", "h")  -- Normal mode only
keymap.set("i", "jk", "<Esc>")  -- Insert mode only
keymap.set("v", "i", "h")  -- Visual mode only

-- Multiple modes
keymap.set({"n", "v"}, "i", "h")  -- Both normal and visual modes
keymap.set({"n", "v", "x"}, "<leader>y", '"+y')  -- Multiple modes
```

**Common modes:**
- `"n"` = Normal mode
- `"i"` = Insert mode  
- `"v"` = Visual mode (character-wise)
- `"V"` = Visual line mode
- `"x"` = Visual block mode
- `"c"` = Command mode
- `"t"` = Terminal mode
- `"o"` = Operator-pending mode

### 2. `lhs` (Left Hand Side - string)
The key combination you want to press:

```lua
-- Simple keys
keymap.set("n", "i", "h")          -- Press 'i'
keymap.set("n", "j", "gj")         -- Press 'j'

-- Key combinations with modifiers
keymap.set("n", "<C-s>", ":w<CR>") -- Ctrl+s
keymap.set("n", "<A-j>", ":m+<CR>") -- Alt+j
keymap.set("n", "<S-j>", "J")       -- Shift+j

-- Leader key combinations
keymap.set("n", "<leader>w", ":w<CR>")     -- Space+w (if leader is space)
keymap.set("n", "<leader>ff", ":Files<CR>") -- Space+f+f

-- Special keys
keymap.set("n", "<Esc>", ":nohl<CR>")   -- Escape key
keymap.set("n", "<CR>", "o<Esc>")       -- Enter key
keymap.set("n", "<Tab>", ">>")          -- Tab key
```

**Modifier notation:**
- `<C-x>` = Ctrl+x
- `<A-x>` or `<M-x>` = Alt+x (Meta)
- `<S-x>` = Shift+x
- `<D-x>` = Cmd+x (Mac only)

### 3. `rhs` (Right Hand Side - string or function)
What should happen when the key is pressed:

```lua
-- Simple key replacement
keymap.set("n", "i", "h")  -- 'i' becomes 'h'

-- Vim commands
keymap.set("n", "<leader>w", ":w<CR>")        -- Execute :w command
keymap.set("n", "<leader>q", ":quit<CR>")     -- Execute :quit command

-- Multiple commands
keymap.set("n", "<leader>x", ":w<CR>:q<CR>")  -- Save then quit

-- Lua functions
keymap.set("n", "<leader>t", function()
  print("Hello from Lua!")
end)

-- Built-in functions
keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)

-- Special characters
keymap.set("i", "jk", "<Esc>")    -- Insert mode: jk becomes Escape
keymap.set("n", "o", "o<Esc>")    -- Create new line but stay in normal mode
```

**Special RHS characters:**
- `<CR>` = Enter/Return
- `<Esc>` = Escape key
- `<BS>` = Backspace
- `<Del>` = Delete key
- `<Space>` = Space bar
- `<Tab>` = Tab key

### 4. `opts` (Options table - optional)
Additional configuration for the mapping:

```lua
-- Basic options
keymap.set("n", "i", "h", { 
  desc = "Move left",           -- Description for which-key plugin
  silent = true,                -- Don't show command in command line
  noremap = true,               -- Non-recursive (default: true)
  expr = false,                 -- Expression mapping (default: false)
  nowait = false,               -- Don't wait for more characters (default: false)
  buffer = nil,                 -- Buffer-specific mapping (default: global)
})

-- Real examples
keymap.set("n", "<leader>w", ":w<CR>", { 
  desc = "Save file",
  silent = true 
})

keymap.set("n", "j", "gj", { 
  desc = "Move down (display lines)",
  expr = false,
  silent = true 
})

-- Buffer-specific mapping (only applies to current buffer)
keymap.set("n", "<leader>r", ":!python %<CR>", {
  desc = "Run Python file",
  buffer = 0  -- 0 = current buffer
})

-- Expression mapping (rhs is evaluated as expression)
keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })
```

## Complete Examples

### Simple Movement Remap
```lua
-- Map 'i' to move left instead of 'h'
vim.keymap.set("n", "i", "h", { desc = "Move left" })
```

### Leader Key Command
```lua
-- Space + w saves file
vim.keymap.set("n", "<leader>w", ":write<CR>", { 
  desc = "Save file",
  silent = true 
})
```

### Function Mapping
```lua
-- Custom function for complex behavior
vim.keymap.set("n", "<leader>t", function()
  local current_time = os.date("%H:%M:%S")
  print("Current time: " .. current_time)
end, { desc = "Show current time" })
```

### Multi-Mode Mapping
```lua
-- Same mapping for normal and visual modes
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { 
  desc = "Copy to system clipboard" 
})
```

### Conditional Mapping
```lua
-- Different behavior based on context
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"  -- Next completion item
  else
    return "<Tab>"  -- Regular tab
  end
end, { 
  desc = "Smart tab completion",
  expr = true,
  silent = true 
})
```

## Common Patterns

### Window Navigation
```lua
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
```

### Plugin Integration
```lua
vim.keymap.set("n", "<leader>ff", function()
  require('telescope.builtin').find_files()
end, { desc = "Find files" })
```

### Insert Mode Shortcuts
```lua
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save and continue editing" })
```

## Key Points

1. **`noremap = true`** is the default (non-recursive mapping)
2. **`silent = true`** prevents the command from showing in the command line
3. **`desc`** is very useful for documentation and which-key plugin
4. **Functions** in `rhs` are more powerful than simple string commands
5. **Multiple modes** can share the same mapping using a table
6. **Buffer-specific** mappings only apply to specific buffers