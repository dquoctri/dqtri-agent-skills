# Safety Rules

These rules protect user code, project context, and the shared dqtri-agent-skills repository.

## Shared Skills And Rules

- Never auto-modify shared skills, shared rules, templates, scripts, or shared memory.
- Agents may read files under `~/dqtri-agent-skills`.
- Agents must not edit shared dqtri-agent-skills files unless the user explicitly asks to change this skill system itself.
- Skill improvements must be proposed or recorded in `skill-improvements.md` first, not applied directly.
- Do not rely on session-start hooks, hidden registration, background loading, or packaged runtime archives to activate skills.
- Keep executable helpers explicit, documented, and user-invoked.

## Project Context

- Never promote project-specific context globally.
- Do not copy project conventions, private assumptions, logs, architecture details, or business context into shared rules or skills.
- Keep project memory local to the project or under `memory/projects/<project-name>/`.
- Do not store secrets or sensitive data in memory, templates, examples, skills, or rules.

## User Code

- Preserve the user's code style and project conventions.
- Do not rewrite code for personal preference.
- Do not revert, delete, overwrite, or reformat unrelated user changes.
- Treat uncommitted changes as user-owned unless you made them in the current task.

## Destructive Changes

- Ask before destructive changes.
- Destructive changes include recursive deletion, hard resets, force pushes, schema drops, data migrations that can lose data, and broad generated-file replacement.
- Before any approved destructive operation, verify the target path and scope.
- Prefer reversible, reviewable changes.
- Quarantine or ignore legacy hooks, deploy helpers, token helpers, and other broad side-effect automation unless the user explicitly opts in.

## Verification And Reporting

- Prefer project-provided scripts for build, test, lint, and format.
- Report verification that was run.
- If verification was skipped or failed for environmental reasons, say so plainly.
