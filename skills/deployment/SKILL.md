---
name: deployment
description: Prepare releases, deployments, migrations, environment changes, rollback plans, and CI/CD workflow changes without hidden automation.
---

# Skill: deployment

## When to use

Use for release preparation, deployment planning, migrations, environment changes, rollback planning, or CI/CD workflow changes.

## Inputs to check

- Release scope, deployment target, environment variables, migrations, and CI/CD config.
- Build, test, lint, packaging, rollout, monitoring, and rollback commands.
- Secrets handling, access requirements, and operational constraints.

## Steps

1. Identify what is being released and where.
2. Confirm prerequisites, config, secrets, and migration order.
3. Run or specify build/test checks before deploy.
4. Plan rollout, monitoring, and rollback.
5. Avoid networked or destructive deploy actions unless explicitly requested.

## Review checklist

- Release steps are explicit and ordered.
- Secrets are referenced by location or variable name only, never exposed.
- Rollback or recovery path is clear.
- Verification after deployment is defined.

## Memory update guidance

Update memory for durable deployment commands, environments, and rollback conventions. Do not store secrets or one-time release notes.

## Done When

- Release, rollout, monitoring, and rollback steps are explicit.
- Pre-deploy and post-deploy verification are defined or completed.
- Diff or config changes were reviewed for protected paths and secrets.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
