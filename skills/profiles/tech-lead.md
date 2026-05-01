---
name: tech-lead
description: Profile for a tech lead reviewing code, planning work, guiding specs, and maintaining engineering standards across the team.
context_budget_tokens: 4500
memory_layers: [0, 1]
---

# Role Profile: Tech Lead

Use this profile when the work is coordination and standards: code review, planning sprints, writing specs, or maintaining quality gates across the team. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `code-review` — review diffs for correctness, architecture, security, and tests
2. `planning` — break work into thin, verifiable steps for the team
3. `spec-design` — shape requirements into testable, scoped specs
4. `architecture` — weigh in on structural decisions and boundaries

## Secondary Skills (load only if needed)

- `testing` — when the review reveals missing or broken coverage
- `security-review` — when auth or trust boundary changes are in the diff

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 always: `decisions.md`, `patterns.md`, `mistakes.md` (needed for consistent standards)
- Layer 2 when reviewing recurring quality issues: `project-experience-log.md`

## Context Budget

4 500 tokens. Load layer 1 by default — tech leads need pattern context to give consistent feedback.

## Quality Gates to Apply

For every review task: apply all dimensions relevant to the diff (Code, Tests, Architecture, API, Security as applicable).
For planning tasks: Architecture gate (steps are dependency-safe, risky work isolated).
For spec tasks: Architecture gate (criteria testable, non-goals explicit).

## Harness Reminder

Follow `core/rules/harness.md`. After each code review session, check `project-experience-log.md` for repeated findings — those are skill improvement candidates.
