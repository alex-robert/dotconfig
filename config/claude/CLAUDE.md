# Main CLAUDE.md

## Plan and review
### Before starting to work
- Always start any request in plan mode
- When the plan is ready, save it to .claude/tasks/TASK_NAME.md
- Task plan should contain detailed reasoning as well as tasks breakdown
- Don't start implementation until the plan has been approved

### Task Implementation
- Always disable auto-accept edits if previously enabled and ask again
- Always verify actual return types and do not invent methods/types
- Always verify existing patterns first to keep codebase consistent
  doesn't
- Always start by writing the tests (UNLESS explicitly requested not to in the plan)
- Keep the plan and tasks files updated

### Finishing a task
- Do not Run the tests automatically, let the user
- Move the task to .claude/done/TASK_NAME.md with task implementation details
- Add a "Task Completion Summary" section at the end with:
  - Major features delivered
  - Architecture improvements
  - Production readiness status
  - Optional next steps
- Write some docs if revelant and approved in the plan
- Let the user handle the chores (git, debug investigation, cleanup, ... )

## Code Style and Guilelines
### Code style
- No semicolons unless required
- 2-space indentation
- Always add trailing commas on objects/arrays
- Interface names prefixed with `I` (e.g., `IMyInterface`)
- private methods are prefixed with an `_`
- File names use dashes for word separation
- Group imports on single lines when possible

### Comments
- Only add code comments when it adds context 
- Never just add comment to describe the next lines of code in human langage
- Do not use emojis

### Coding Guidelines 
- Always favor expressions style over statements
- Never use `switch` block
- Never use `let`, only `const`
- Never use loop control flow directives: `for`, `while`, `do {...} while (...)`
- Never use `else` or `else if` directives. 
- Use `if` when there is no functional expression possibility or for an early return