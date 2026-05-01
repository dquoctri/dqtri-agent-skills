# Workflow Rules

Use the dqtri-agent-skills execution loop for software development lifecycle tasks. Keep context small and load only what the current step needs.

## Execution Loop

1. Read the project `AGENTS.md`.
2. Load shared rules relevant to the task (not all rules).
3. Load memory layer 0: `summary.md` and `project-config.md` if present (~150 tokens).
4. For complex or multi-step tasks, load memory layer 1: `decisions.md`, `patterns.md`, `mistakes.md`.
5. Check `ai-memory/current-task.md` — if it exists and is non-empty, resume from where it left off.
6. Select 1-2 relevant skills from `~/dqtri-agent-skills/skills/` using the dispatch table in `skills/index.md`.
7. Define success criteria and plan the next coherent change.
8. Implement one bounded step.
9. Review the diff and run relevant verification.
10. Update memory only if useful and allowed (see `core/rules/memory.md` write triggers).
11. Append session close entry to `project-experience-log.md`.
12. Clear `ai-memory/current-task.md` on successful task completion.

## Current Task Continuity

- Before starting a multi-step task, write the plan to `ai-memory/current-task.md`.
- Update the current step number after each step completes.
- If a session ends mid-task, the next session reads `current-task.md` to resume.
- Clear `current-task.md` by emptying it when the task is done (do not delete the file).

Format:
```
# Current Task (clear when done)
Goal: <one line>
Skill: <skill-name>
Steps: <total>
Step reached: <N>/<total>
Blocked on: <reason or "none">
Resume with: <next action>
```

## Progressive Memory Loading

Load only what the task requires. Loading everything wastes tokens and increases cost.

| Layer | Files | Load when | Est. tokens |
|---|---|---|---|
| 0 | `summary.md`, `project-config.md` | Always | ~150 |
| 1 | `decisions.md`, `patterns.md`, `mistakes.md` | Complex or unfamiliar tasks | ~400 |
| 2 | `project-experience-log.md` | Debugging recurring failures | ~800+ |
| 3 | `skill-improvement-proposals.md` | System improvement only | skip normally |

Do not load layer 2 or layer 3 on normal tasks.

## Rule Loading

- Always prefer project instructions over generic defaults when they do not conflict with user instructions.
- Load only the shared rule files relevant to the current task.
- Do not preload every rule or every skill.
- If instructions conflict, use this priority order: current user request, project instructions, project memory, shared dqtri-agent-skills rules, selected skills.

## Skill Selection

- Select no more than 1-2 skills for a normal task.
- Choose skills by task type using `skills/index.md` as the dispatch table.
- Read the selected skill's token tier header before loading the full skill body.
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
- Bound each step with clear input, allowed action, output, verification, and stop point.
- Make one coherent change at a time.
- Prefer narrow edits that can be reviewed and verified.
- For larger work, use thin slices that leave the project buildable and testable after each step.
- Stop adding new changes when tests, builds, or runtime checks fail unexpectedly; diagnose before continuing.
- Run the smallest meaningful verification after each substantial change.
- Expand verification when shared code, public contracts, data migrations, or user-facing behavior are affected.

## Before Commit

- Run the declared test command when it exists and is relevant.
- Run lint, typecheck, build, or smoke commands when declared and relevant.
- Inspect the diff before proposing or creating a commit.
- Confirm no unrelated files changed.
- Confirm protected files, generated files, lockfiles, and secrets were not changed unexpectedly.
- If verification fails or cannot run, report that instead of proposing a commit.

## Review

- Review diffs before reporting completion.
- Check for unrelated rewrites, accidental formatting churn, missing tests, and broken project conventions.
- Review tests first when they exist; they usually reveal intended behavior and coverage gaps.
- If verification cannot be run, state what was skipped and why.

## Memory Update

- Update memory only when the result is durable project knowledge.
- Do not write temporary notes, debugging traces, or chat history into memory.
- Do not update shared skills or rules during normal project work.
- Use the write triggers in `core/rules/memory.md` to decide which file to update.
- Always append a session close micro-entry to `project-experience-log.md` at task end.
- Record reusable process ideas in `skill-improvement-proposals.md`; do not promote them automatically.
