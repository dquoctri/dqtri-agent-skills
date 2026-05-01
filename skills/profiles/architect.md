---
name: architect
description: Profile for a software architect making system design decisions, defining boundaries, designing APIs, and planning structural changes.
context_budget_tokens: 5000
memory_layers: [0, 1]
---

# Role Profile: Architect

Use this profile when the work is structural: system design, module boundaries, API contracts, data models, or planning large changes. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `architecture` — system design, boundaries, dependency direction, migrations
2. `api-design` — APIs, schemas, contracts, events, compatibility
3. `spec-design` — turn requirements into scoped, testable specs
4. `planning` — break architectural decisions into safe, ordered implementation steps

## Secondary Skills (load only if the task explicitly requires it)

- `code-review` — review structural changes before recommending them
- `security-review` — when trust boundaries or auth design is involved

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 always for architects: `decisions.md`, `patterns.md`, `mistakes.md`
- Layer 2 only if reviewing recurring architectural debt

## Context Budget

5 000 tokens. Architects need fuller context — decisions.md and patterns.md are always worth loading.

## Quality Gates to Apply

For every task:
- Architecture: dependency direction safe, boundaries named, tradeoffs explicit
- API: backward-compatible or migration defined, errors and auth explicit

For security-sensitive design: also apply Security gate.

## Harness Reminder

Follow `core/rules/harness.md`. Record every architectural decision to `decisions.md` — this is the role most responsible for filling that file.
