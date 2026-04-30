---
name: release-verification
description: Verify delivered behavior after implementation, review, testing, deployment, or migration using acceptance criteria and smoke checks.
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
