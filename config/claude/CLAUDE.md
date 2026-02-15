# Main CLAUDE.md

## Avoid Circular Planning
- **STOP and test basic workflows FIRST** before planning advanced features or exploring edge cases
- If you find yourself planning multiple "what ifs" or "future possibilities", pause and ask: "Can we test a simple end-to-end flow first?"
- Avoid bikeshedding on architecture, tooling, or patterns - implement the simple version, test it, THEN refine
- Remember: A working 80% solution tested beats a theoretically perfect 0% solution
- When uncertain about approach, default to: simple → test → refine (not: plan → design → implement → test)

## Plan and review
### Before starting to work
- Always start any request in plan mode
- When the plan is ready, save it to .claude/tasks/TASK_NAME.md
- Task plan should contain detailed reasoning as well as tasks breakdown
- Do not include code snippets or full implementation in the plan, just the theorie
- Don't start implementation until the plan or a subset todo from it has been approved

### Task Implementation
- Ask: Do we start by implementing tests (TDD) or do we don't care for this session ?
- Always disable auto-accept edits if previously enabled and ask again
- Always check existing return types and exisiting methods first => do not invent methods/types
- Always check existing patterns first to keep codebase consistent

### Finishing a tasks
- Ask if can try to build the project to spot common errors.
- Do not Run the tests (no npm run test) - user does.
- If task is not done: Keep the task file updated (check the todos, update the plan if it has changed durring the session)
- If task is done: Move the task to .claude/done/TASK_NAME.md with final task implementation details
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
- Do not add comments to just repeat the function name
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
