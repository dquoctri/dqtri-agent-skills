---
name: planning
description: Break specs, bugs, migrations, and multi-file changes into thin, ordered, verifiable implementation steps.
tokens: ~450
tier: critical
triggers: plan, steps, sequence, multi-step, break down, order, slice
---

# Skill: planning

## When to use

Use for breaking a spec, bug, migration, or multi-file change into executable steps.

## Inputs to check

- Current spec, user request, and acceptance criteria.
- Relevant code areas, tests, commands, risks, and dependencies.
- Project conventions for sequencing, branching, review, and rollout.

## Steps

1. Define success criteria.
2. Split work into thin, verifiable slices.
3. Identify dependencies, risky steps, and rollback points.
4. Map each step to a verification check.
5. Keep the next action small enough to implement immediately.

## Review checklist

- Each step has a clear outcome.
- Each step has a verification method.
- Risky work is isolated early.
- The plan avoids unrelated cleanup and speculative work.

## Memory update guidance

Update memory only for durable project workflow constraints or recurring planning patterns. Do not store temporary task lists.

## Done When

- The plan is split into thin, bounded steps.
- Each step has input, action, output, verification, and stop point.
- Risky or irreversible work has a rollback or review point.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
