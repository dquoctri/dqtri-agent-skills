---
name: release-verification
description: Verify delivered behavior after implementation, review, testing, deployment, or migration using acceptance criteria and smoke checks.
tokens: ~500
tier: optional
triggers: verify release, smoke test, acceptance, post-deploy, post-migration, confirm behavior, sign off
chains:
  before: [deployment, testing]
  after: []
---

# Skill: release-verification

## When to use

Use after implementation, review, test, deployment, or migration to confirm the delivered behavior works as intended.

## Inputs to check

- Acceptance criteria, release scope, test commands, monitoring links, logs, and user workflows.
- Known risks, changed files, migrations, and affected integrations.
- Project verification conventions and memory.

## Steps

1. Map acceptance criteria to concrete checks.
2. Run the smallest reliable automated checks first.
3. Add manual or runtime checks for user-facing and integration paths.
4. Compare actual results with expected behavior.
5. Report pass/fail, gaps, and residual risk.

## Review checklist

- Verification covers the changed behavior, not just generic tests.
- Failures are investigated before claiming success.
- Manual checks are named when automation is absent.
- Residual risk is explicit.

## Memory update guidance

Update memory for durable verification commands, recurring smoke tests, or known release checks. Do not store raw logs unless summarized as a lasting issue.

## Quality Gate

Gates: Deployment, Tests  
- Every acceptance criterion maps to a concrete check — none are assumed to pass.
- Failures are investigated before claiming success — no "probably fine".
- Manual checks are named when automation is absent.
- Residual risk is explicit and accepted by the team, not silently ignored.

See `core/rules/quality-gates.md` → Deployment, Tests dimensions.

## Done When

- Acceptance criteria map to completed checks or explicit gaps.
- Verification results, failures, and residual risks are clear.
- Diff scope or release scope was reviewed.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
