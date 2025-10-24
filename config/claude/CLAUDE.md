# Main CLAUDE.md

## Plan and review
### Before starting to work
- Always start any request in plan mode
- When the plan is ready, save it to .claude/tasks/TASK_NAME.md
- Plan should be detailed implementation : detailed reasoning as well as tasks breakdown
- Never continue until the plan have been explicitly approved

### Task Implementation
- Always disable auto-accept edits if previously enabled and ask again
- Always start by writing the tests (UNLESS explicitly requested not to in the plan)
- Keep the plan and tasks files updated

### Finishing a task
- DO NOT Run the tests automatically, let a human do
- Move the task to .claude/done/TASK_NAME.md with task implementation details
- Write some docs if revelant and approved in the plan
- Let me handle the chores (git, merge request, ... )

## Code Style and Guilelines
### Code style
- No semicolons unless required
- 2-space indentation
- Always add trailing commas on objects/arrays
- Interface names prefixed with `I` (e.g., `IMyInterface`)
- private methods are prefixed with an `_`
- File names use dashes for word separation
- Group imports on single lines when possible

### Coding Guidelines 
- Always favor expressions style over statements
- Never use `switch` block
- Never use loop control flow directives: `for`, `while`, `do {...} while (...)`
- Never use `else` or `else if` directives. 
- Use `if` when there is no functional expression possibility or for an early return