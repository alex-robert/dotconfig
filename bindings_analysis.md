
# macOS Modifier Patterns analysis

**The 4 primary modifiers**

⇧ ⇧  
⌃ Control  
⌥ Option (Alt)  
⌘ Command  

**Legend:**

✅ = widely available (rarely bound by system)
⚠️ = partially used (system may claim some combos, but not all)
❌ = reserved / heavily used by macOS

## Single modifiers combos

- ⇧ key : ⚠️ used in text selection & app shortcuts, not much system-wide
- ⌃ key : ⚠️ used in Terminal, Emacs-style bindings
- ⌥ key : ⚠️ used for special characters / diacritics
- ⌘ key : ❌ core system app shortcuts, heavily reserved

## Double modifiers

- ⇧ ⌃ key : ✅ mostly free, some accessibility use
- ⇧ ⌥ key : ✅ mostly free, few system bindings
- ⇧ ⌘ key : ⚠️ many Finder & screenshot bindings
- ⌃ ⌥ key : ✅ relatively underused, some accessibility bindings
- ⌃ ⌘ key : ⚠️ fullscreen, emoji picker, lock screen, Mission Control shortcuts
- ⌥ ⌘ key : ⚠️ Force Quit, hide others, minimize all, etc.
- ⌃ Fn key : ⚠️ window tiling 

## Triple modifiers

- ⇧ ⌃ ⌥ key : ✅ almost entirely free
- ⇧ ⌃ ⌘ key : ⚠️ screenshot-to-clipboard shortcuts
- ⇧ ⌥ ⌘ key : ⚠️ Finder variants, e.g. Save As
- ⌃ ⌥ ⌘ key : ⚠️ invert colors, shutdown variants

## Quadruple modifiers

- ⇧ ⌃ ⌥ ⌘ key : ✅ hyper combo, almost totally unused except screenshots

## Visual Grid
| Pattern	| Status | Notes |
|---------|--------|-------|
|⇧|	⚠️|	Selection & app-specific |
|⌃|	⚠️|	Emacs-style editing, Terminal |
|⌥|	⚠️|	Special characters |
|⌘|	❌|	Core system/app shortcuts |
|⇧⌃|	✅|	Mostly free |
|⇧⌥|	✅|	Mostly free |
|⇧⌘|	⚠️|	Many Finder/screenshot |
|⌃⌥|	✅|	Underused, good candidate |
|⌃⌘|	⚠️|	Fullscreen, emoji, lock |
|⌥⌘|	⚠️|	Force Quit, hide, minimize |
|⇧⌃⌥|	✅|	Almost all free |
|⇧⌃⌘|	⚠️|	Screenshot clipboard |
|⇧⌥⌘|	⚠️|	Finder, Save As |
|⌃⌥⌘|	⚠️|	Accessibility, shutdown |
|⇧⌃⌥⌘ (Hyper) |	✅	| Safest “hyper” key |

