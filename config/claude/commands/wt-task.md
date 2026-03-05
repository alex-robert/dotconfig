---
description: Create a worktrunk worktree and start a task
argument-hint: [task-name]
allowed-tools: Bash(command wt:*), Bash(git worktree:*), Bash(cd:*)
---

## Setup

Create the worktree for this task:

```
command wt switch --create --no-cd cc-task/$ARGUMENTS
```

Output: !`command wt switch --create --no-cd cc-task/$ARGUMENTS 2>&1`

Parse the worktree path from the output above (the path after "worktree @ ").
Expand `~` to the full home directory path.

Current worktrees: !`git worktree list`

## Your task

You are now set up to work in the worktree at the parsed path above.
Use that absolute path as the base directory for all file operations (Read, Edit, Glob, Grep).
Use `cd <worktree_path>` before any git commands.

Ask the user: what should we work on in this task?

Remind them that when done, they can:
- `wt list` to see the worktree
- `wt merge cc-task/$ARGUMENTS` to merge and clean up
- `wt switch cc-task/$ARGUMENTS` to navigate to the worktree
