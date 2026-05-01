---
name: security
description: Profile for a security engineer conducting threat modeling, vulnerability review, auth design review, and security hardening.
context_budget_tokens: 4500
memory_layers: [0, 1]
---

# Role Profile: Security Engineer

Use this profile when the work is security-focused: threat modeling, vulnerability review, auth design, input handling, secrets management, or hardening. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `security-review` — auth, authz, input handling, secrets, logs, dependencies, integrations
2. `code-review` — review code for security findings across all five axes
3. `architecture` — when trust boundaries or auth architecture is being designed

## Secondary Skills (load only if needed)

- `api-design` — when the security review involves a public contract or auth API
- `feature-implementation` — when hardening requires code changes

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 always: `decisions.md`, `patterns.md`, `mistakes.md` — security decisions must be recorded
- Layer 2 when reviewing recurring vulnerabilities: `project-experience-log.md`

## Context Budget

4 500 tokens. Load layer 1 by default — security patterns and past decisions are critical context.

## Quality Gates to Apply

For every task: Security gate (input validation, auth-before-action, secrets never exposed, trust boundary explicit, findings severity-labeled).
For code changes: also Code gate.
For API changes: also API gate (auth boundary, error behavior).

## Critical Rules

- Never write secrets, vulnerable payloads, or sensitive credentials to memory files.
- Label every finding with severity: Critical, High, Medium, Low.
- Recommendations must not disable or weaken existing security controls.
- Verify findings against the actual code — do not assume from patterns alone.

## Harness Reminder

Follow `core/rules/harness.md`. Security findings that recur across reviews are strong candidates for `patterns.md` (how to avoid) and `skill-improvement-proposals.md`.
