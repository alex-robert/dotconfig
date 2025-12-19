# Another definition

- Move stuff arround : move a window to another workspace / screen
- Move around : navigate workspace / screens / opened window
- Move around in app : navigate panes, tabs


# Windows Management & Navigation
## Screen focus navigation (AeroSpace)
  - Select screen to focus  (select main, front, right)
  - Navigate screen focus (go up, down, left, right)
  - Send Workspace to screen => 

## Workspaces navigation (AeroSpace)
  - Navigate next/previous workspace => cmd+alt+(i,l)
  - Bring workspace (alpha, bravo, charlie, ...) => cmd+alt+(a,z,e,r,t,y...)

## Windows focus navigation (AeroSpace)
  - Navigate window focus (go up, down, left, right) => cmd+ctrl+(i,j,k,l)
  - Resize focused windows => mod layout ?
    - Full screen
    - Halves
    - Quarter
    - Custom (grow/shrink) => alt+=, alt+:
  - Move window (inside layout) up, down, left, right
  - Send Window to specific workspace
    - && Go to workspace || do not go
  - Send Window to previous/next workspace
    - && Go to workspace || do not go

# Apps 
## Terminal (WezTerm)
  - Navigate Pane's | cmd+alt+(i,j,k,l) | /!\ | conflict with workspace navigation |
    - Open new Vertical pane => cmd+shift+p 
    - Open new Horizontal pane
    - Switch pane focus (go up, down, left, right)
    - Close current pane
    - Navigate Tabs
    - Open New tab
    - Navigate between next/previous tab
    - Closse current tab

## VSCode (transitional)
  - Search & navigate to file
  - Bring command palette
  - 

## Nvim





m1 m2 m3 m4 k


| App           | Action                                           | binding                        |  mode  | comment                             |
|---------------|--------------------------------------------------|--------------------------------|--------|-------------------------------------|
| AeroSpace     | Send Workspace to monitor                        |                                | main   |                                     |
| AeroSpace     | Switch to next workspace                         |                                | main   |                                     |
| AeroSpace     | Switch to prev workspace                         |                                | main   |                                     |
| AeroSpace     | Focus windows Up                   |                                |        |                                     |
| AeroSpace     | Focus windows Down                   |                                |        |                                     |
| AeroSpace     | Focus windows Left                   |                                |        |                                     |
| AeroSpace     | Focus windows Right                   |                                |        |                                     |


| AeroSpace     | Resize focused windows                           |                                | layout |                                     |
| AeroSpace     | Full screen                                      |                                | layout |                                     |
| AeroSpace     | Halves                                           |                                | layout |                                     |
| AeroSpace     | Quarter                                          |                                | layout |                                     |
| AeroSpace     | Custom (grow/shrink)                             |                                | layout |                                     |
| AeroSpace     | Move window in layout                            |                                | ??     |                                     |
| AeroSpace     | Send Window to specific workspace && go          |                                |        |                                     |
| AeroSpace     | Send Window to specific workspace && stay        |                                |        |                                     |
| AeroSpace     |                                                  |                                |        |                                     |
| AeroSpace     | Select Monitor to focus                          |                                | main   |                                     |
| AeroSpace     | Monitor focus Next                               |                                | main   |                                     |
| AeroSpace     | Monitor focus Prev                               |                                | main   |                                     |
| AeroSpace     |                                                  |                                |        |                                     |
| AeroSpace     |                                                  |                                |        |                                     |
| AeroSpace     |                                                  |                                |        |                                     |
| Wezterm       | Navigate open panes                              |                                | /!\    | conflict with workspace navigation  |
| Wezterm       | Open new Vertical pane => cmd+shift+p            |                                |        |                                     |
| Wezterm       | Open new Horizontal pane                         |                                |        |                                     |
| Wezterm       | Switch pane focus (go up, down, left, right)     |                                |        |                                     |
| Wezterm       | Close current pane                               |                                |        |                                     |
| Wezterm       | Navigate Tabs                                    |                                |        |                                     |
| Wezterm       | Open New tab                                     |                                |        |                                     |
| Wezterm       | Navigate between next/previous tab               |                                |        |                                     |
| Wezterm       | Closse current tab                               |                                |        |                                     |



| Pattern	    |    | Notes                         |
|-------------|----|-------------------------------|
|⇧            | ⚠️ | Selection & app-specific      |
|⌃            | ⚠️ | Emacs-style editing, Terminal |
|⌥            | ⚠️ | Special characters            |
|⌘            | ❌ | Core system/app shortcuts     |
|⇧ ⌃          | ✅ | Mostly free                   |
|⇧ ⌥          | ✅ | Mostly free                   |
|⇧ ⌘          | ⚠️ | Many Finder/screenshot        |
|⌃ ⌥          | ✅ | Underused, good candidate     |
|⌃ ⌘          | ⚠️ | Fullscreen, emoji, lock       |
|⌥ ⌘          | ⚠️ | Force Quit, hide, minimize    |
|⇧ ⌃ ⌥        | ✅ | Almost all free               |
|⇧ ⌃ ⌘        | ⚠️ | Screenshot clipboard          |
|⇧ ⌥ ⌘        | ⚠️ | Finder, Save As               |
|⌃ ⌥ ⌘        | ⚠️ | Accessibility, shutdown       |
|⇧⌃⌥⌘ (Hyper) | ✅ | Safest “hyper” key            |








