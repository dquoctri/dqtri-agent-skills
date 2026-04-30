# Workflow Rules

Use the dqtri-agent-skills execution loop for software development lifecycle tasks. Keep context small and load only what the current step needs.

## Execution Loop

1. Read the project `AGENTS.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Read project memory if the project has it or points to it.
4. Select 1-2 relevant skills from `~/dqtri-agent-skills/skills/`.
5. Define success criteria and plan the next coherent change.
6. Implement one step.
7. Review the change and run relevant verification.
8. Update memory only if useful and allowed.

## Rule Loading

- Always prefer project instructions over generic defaults when they do not conflict with user instructions.
- Load only the shared rule files relevant to the current task.
- Do not preload every rule or every skill.
- If instructions conflict, use this priority order: current user request, project instructions, project memory, shared dqtri-agent-skills rules, selected skills.

## Skill Selection

- Select no more than 1-2 skills for a normal task.
- Choose skills by task type, not by habit.
- Read the selected skill file before applying it.
- If no skill fits, proceed with the shared rules only.

## Lifecycle Skill Map

- Idea or requirement shaping: `spec-design`
- Multi-step sequencing: `planning`
- System structure or boundaries: `architecture`
- API, schema, command, or integration contract: `api-design`
- Implementation: `feature-implementation`
- Behavior-preserving cleanup: `refactor`
- Failing behavior or runtime errors: `debugging`
- Tests or coverage: `testing`
- Review before merge or handoff: `code-review`
- Security review or threat analysis: `security-review`
- Performance investigation or optimization: `performance-review`
- Release or environment rollout: `deployment`
- Post-change or post-deploy checks: `release-verification`

## Implementation Loop

- Transform broad requests into verifiable goals: validation gets invalid-input tests, bug fixes get reproduction checks, refactors get before/after verification.
- For multi-step tasks, plan each step with its verification check.
- Make one coherent change at a time.
- Prefer narrow edits that can be reviewed and verified.
- For larger work, use thin slices that leave the project buildable and testable after each step.
- Stop adding new changes when tests, builds, or runtime checks fail unexpectedly; diagnose before continuing.
- Run the smallest meaningful verification after each substantial change.
- Expand verification when shared code, public contracts, data migrations, or user-facing behavior are affected.

## Review

- Review diffs before reporting completion.
- Check for unrelated rewrites, accidental formatting churn, missing tests, and broken project conventions.
- Review tests first when they exist; they usually reveal intended behavior and coverage gaps.
- If verification cannot be run, state what was skipped and why.

## Memory Update

- Update memory only when the result is durable project knowledge.
- Do not write temporary notes, debugging traces, or chat history into memory.
- Do not update shared skills or rules during normal project work.
