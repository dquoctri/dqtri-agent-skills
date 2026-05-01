---
name: devops
description: Profile for a DevOps or SRE engineer managing deployments, CI/CD, environment config, rollbacks, and release verification.
context_budget_tokens: 4000
memory_layers: [0, 1]
---

# Role Profile: DevOps / SRE

Use this profile when the work is operational: deployments, releases, CI/CD pipeline changes, environment config, rollbacks, or post-deploy verification. Load this profile instead of selecting individual skills manually.

## Primary Skills (load in this order, max 2)

1. `deployment` — release prep, environment changes, migrations, rollout, rollback
2. `release-verification` — post-deploy acceptance checks and smoke tests
3. `performance-review` — latency, throughput, or resource consumption review

## Secondary Skills (load only if needed)

- `security-review` — when secrets management, network policy, or access control is involved
- `debugging` — when a deployment failure needs root cause analysis

## Memory Loading

- Layer 0 always: `summary.md`, `project-config.md`
- Layer 1 for release planning: `decisions.md`, `patterns.md`, `mistakes.md`
- Layer 2 when investigating recurring deploy failures: `project-experience-log.md`

## Context Budget

4 000 tokens.

## Quality Gates to Apply

For every deploy task: Deployment gate (explicit steps, rollback defined, secrets safe, verification named).
For post-deploy: Deployment + Tests gates (acceptance criteria mapped, failures investigated).
For infra changes touching secrets: Security gate.

## Harness Reminder

Follow `core/rules/harness.md`. Every non-trivial deployment should produce a session close entry — deploy patterns and failure modes are the most valuable memory for future DevOps sessions.
