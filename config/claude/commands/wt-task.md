---
description: Create a worktree and start a task
argument-hint: [task-name]
allowed-tools: Bash(wt:*), Bash(git:*), Bash(cd:*), Bash(awk:*)
---

## Setup

!`wt switch --create --no-cd --yes cc-task/$ARGUMENTS 2>&1`

Worktree path: !`git worktree list | grep "cc-task/$ARGUMENTS" | awk '{print $1}'`

## Your task

Use the absolute worktree path above as the base for all file operations (Read, Edit, Glob, Grep).
Use `cd <worktree_path>` before any git commands.

Ask the user: what should we work on?

When done:
- `wt merge cc-task/$ARGUMENTS` to squash, merge and clean up
- `wt list` to see all worktrees
