# Memory Rules

dqtri-agent-skills memory is for durable project knowledge. It is optional and must stay local to a project or under the shared `memory/projects/<project-name>/` directory.

## Memory Hygiene

- Store only information that is likely to remain useful across future sessions.
- Keep entries concise, factual, and easy to validate.
- Date entries when timing matters.
- Prefer links or file references over copied logs.
- Remove or update stale memory when it becomes misleading.

## Store

- Project-specific architecture decisions that still apply.
- Non-obvious coding, testing, deployment, or review conventions.
- Important setup and verification commands.
- Durable constraints from integrations, environments, data models, or product behavior.
- Known risks or follow-up items that remain relevant after the current task.
- Raw but useful project experience in `project-experience-log.md`.
- Reusable skill improvement candidates in `skill-improvement-proposals.md`.

## Do Not Store

- Temporary debugging logs.
- Raw command output that is only useful for the current session.
- Stack traces, build logs, or test output unless summarized as a durable known issue.
- Secrets, tokens, credentials, private keys, or personal data.
- Content inside `<private>...</private>` tags.
- General programming advice that belongs in rules or skills.
- Chat transcripts or transient reasoning.

## Write Triggers

Use these rules to decide which memory file to write to after a task:

| Situation | Write to |
|---|---|
| Agent chose one approach over another (library, pattern, structural decision) | `decisions.md` |
| Same implementation pattern solved a problem for the second time | `patterns.md` |
| Task required backtracking more than one step | `mistakes.md` |
| Every session, regardless of outcome | `project-experience-log.md` (micro-entry) |
| Same mistake or gap appears across sessions | `skill-improvement-proposals.md` |

Write to `decisions.md` only once per decision. Write to `patterns.md` only after the second occurrence. Write to `mistakes.md` only if the mistake is non-obvious or likely to repeat.

## Session Close (Required)

At the end of every task, append one micro-entry to `project-experience-log.md`:

```
## YYYY-MM-DD | <skill-used>
- Task: <one line>
- Worked: <what helped>
- Didn't work: <what failed or slowed down>
- Memory updated: <file or "none">
- Proposal: <skill-improvement-proposals.md entry or "none">
```

Keep each entry under 10 lines. Do not store secrets, raw logs, or chat transcripts.

## Memory Compression Trigger

When `project-experience-log.md` contains 30 or more entries:
1. Group entries by task type.
2. Extract recurring patterns into `patterns.md`.
3. Extract recurring mistakes into `mistakes.md`.
4. Truncate the log to the 10 most recent entries plus a summary header.
5. Run `bash scripts/check-memory-hygiene.sh` after truncating.

Do not compress automatically. Only compress when the user asks or when the log is clearly oversize.

## Project-Specific vs Reusable Knowledge

- Project-specific knowledge belongs in project memory.
- Reusable coding guidance belongs in shared rules or skills, but must not be promoted automatically.
- Do not turn one project's context into a shared rule.
- If a reusable skill improvement seems useful, record it in `skill-improvement-proposals.md` first for later review.
- `skill-improvements.md` is a compatibility name for older projects.
- Only modify shared skills or rules when the user explicitly asks to change this skill system itself.
- For durable technical decisions, record the decision, reason, consequences, and alternatives considered when useful.

## Skill Contribution Flow

How project learnings become shared skill improvements:

1. A pattern appears in `patterns.md` for the same project 3 or more times — propose a skill improvement.
2. Write the proposal to `skill-improvement-proposals.md` using the schema in `schemas/skill-proposal.schema.md`.
3. Set `status: proposed`. Do not edit shared skills directly.
4. When explicitly asked to promote a proposal, a human must review and approve it first.
5. Promoted improvements are applied to the relevant `SKILL.md` in `skills/` by explicit user request only.
6. Update `docs/skill-changelog.md` when a skill improvement is merged.

## Learning Loop

- One mistake becomes a memory note.
- Repeated mistakes become skill improvement proposals.
- Repeated skill gaps become shared skill updates after review.
- Repeated rule enforcement issues become explicit scripts or checks.
- Do not turn one project's unusual case into a global rule without evidence.

## Progressive Memory Loading

Load memory in layers to minimize token use:

| Layer | Files | When to load | Est. tokens |
|---|---|---|---|
| 0 — always | `summary.md`, `project-config.md` | Every session | ~150 |
| 1 — complex tasks | `decisions.md`, `patterns.md`, `mistakes.md` | Multi-step or unfamiliar work | ~400 |
| 2 — debugging only | `project-experience-log.md` | Diagnosing recurring failures | ~800+ |
| 3 — system work only | `skill-improvement-proposals.md`, `skill-improvements.md` | Improving the skill system | skip normally |

Do not load layer 2 or 3 unless the task type requires it.

## Reading And Writing

- Read project-local memory before shared project memory when both exist.
- Treat memory as context, not truth. Current code, tests, and user instructions take precedence.
- Update memory only when useful and allowed by project instructions or explicit user request.
