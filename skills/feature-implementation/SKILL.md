---
name: feature-implementation
description: Implement new behavior, user workflows, UI changes, API endpoints, commands, and integrations in small verified slices.
---

# Skill: feature-implementation

## When to use

Use when implementing new behavior, UI, API endpoints, commands, integrations, or workflows.

## Inputs to check

- User request and acceptance criteria.
- Existing extension points, similar features, and project conventions.
- Tests, docs, schemas, configs, and public contracts affected by the feature.

## Steps

1. Clarify the smallest complete behavior.
2. Plan the implementation path through existing code.
3. Implement one thin coherent slice that can be verified.
4. Handle expected errors and empty states.
5. Add or update tests and docs when contracts change.
6. Run meaningful verification.

## Review checklist

- Feature matches the requested behavior.
- Existing conventions and interfaces are preserved.
- Work was split so each step stayed reviewable and rollback-friendly.
- Edge cases and failure paths are handled.
- Tests or checks cover the new behavior.

## Memory update guidance

Update memory only for durable feature decisions, new commands, or long-lived constraints. Do not store task notes or temporary implementation details.
