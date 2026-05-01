---
name: developer
description: Profile for a software engineer implementing features, fixing bugs, writing tests, and cleaning up code.
context_budget_tokens: 4000
memory_layers: [0, 1]
---

# Role Profile: Developer

Use this profile when the work is hands-on implementation: building features, fixing bugs, refactoring, or writing tests. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `feature-implementation` — new behavior, workflows, endpoints, commands
2. `debugging` — failing tests, runtime errors, regressions, crashes
3. `refactor` — behavior-preserving restructuring and cleanup
4. `testing` — adding, repairing, or improving tests

## Secondary Skills (load only if primary skill explicitly requires it)

- `code-review` — review your own diff before proposing a commit
- `planning` — when the task spans more than 3 files or steps

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 for complex tasks: `decisions.md`, `patterns.md`, `mistakes.md`
- Layer 2 only for recurring failures: `project-experience-log.md`

## Context Budget

4 000 tokens. When exceeded, write task snapshot to `current-task.md` and trim to layer 0 + active skill.

## Quality Gates to Apply

For every task:
- Code: lint clean, no speculative abstraction, style matches file
- Tests: behavior-focused, deterministic, isolated

For feature work touching a public API: also apply API gate.
For work touching auth or user input: also apply Security gate.

## Harness Reminder

Follow `core/rules/harness.md`. Write session close entry to `project-experience-log.md` at the end of every task.
