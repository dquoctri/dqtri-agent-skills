---
name: qa
description: Profile for a QA engineer designing test strategy, reviewing coverage, verifying releases, and preventing regressions.
context_budget_tokens: 4000
memory_layers: [0, 1]
---

# Role Profile: QA Engineer

Use this profile when the work is quality assurance: test strategy, coverage review, release verification, or regression prevention. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `testing` — add, repair, or design tests and coverage
2. `code-review` — review changes for missing tests, brittle assertions, regressions
3. `release-verification` — verify acceptance criteria and smoke checks post-delivery
4. `performance-review` — when load, latency, or throughput is part of the acceptance criteria

## Secondary Skills (load only if needed)

- `debugging` — when a failing test needs root cause analysis
- `security-review` — when test coverage includes auth or input handling paths

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 for strategy work: `decisions.md`, `patterns.md`, `mistakes.md`
- Layer 2 for regression investigation: `project-experience-log.md`

## Context Budget

4 000 tokens.

## Quality Gates to Apply

For every task: Tests gate (deterministic, isolated, behavior-focused, meaningful failure messages).
For release verification: Deployment gate (acceptance criteria mapped to checks, residual risk named).
For performance acceptance: Performance gate (metric tied to baseline).

## Harness Reminder

Follow `core/rules/harness.md`. QA sessions often surface recurring gaps — write them to `mistakes.md` and `skill-improvement-proposals.md` when the same gap appears twice.
