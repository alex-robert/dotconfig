# Main CLAUDE.md

## Core Rule
simple → test → refine: implement the minimum that works, verify it, then extend — never the other way around

## Session Workflow
### Plan task
- For multi-step or multi-file tasks: use `/wt-task task-name` to create a worktree, then write a brief `TASK.md` at the worktree root before implementing
- For simple/single-concern tasks: proceed directly
- Read `ARCHITECTURE.md` at the project root if it exists — it contains patterns, types, and conventions to follow
- Avoid bikeshedding on architecture, tooling, or patterns - plan implement the simplest version first
- Do not include code snippets or full implementation in the plan, just human readable instructions
- Ask if the plan should contains specific details for types or class / functions signatures

### Task Implementation
- Don't start implementation until the approach is clear (a Todos or a TASK.md exists, context files are scoped)
- Use `/wt-task task-name` to create the worktree and get its absolute path
- Use the absolute worktree path as the base for all file operations (Read, Edit, Glob, Grep)
- Use `cd <worktree_path>` for git commands
- Ask: Do we start by implementing tests (TDD) or implementation first ?
- Implement the minimum working version first
- Stop and verify it works before adding anything else — ask if refinement is needed
- Always disable auto-accept edits if previously enabled and ask again


### Finishing a task
- Update `ARCHITECTURE.md` if the task introduced new patterns, types, or conventions
- Commit on the task branch (include TASK.md if it was created)
- Do not add `co-Authored-By` in the commit message
- Ask if you can try to build the project to spot common errors
- Ask if you can run the tests
- Write docs if relevant and approved in the plan
- Do not mark the task as completed before it has been fully reviewed and approved
- Let the user handle the chores (git merge, debug investigation, cleanup, ...)

## Code Style
- Read `CODING_GUIDELINES.md` at the project root if it exists
