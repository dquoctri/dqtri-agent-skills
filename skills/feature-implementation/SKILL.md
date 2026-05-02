---
name: feature-implementation
description: Implement new behavior, user workflows, UI changes, API endpoints, commands, and integrations in small verified slices.
tokens: ~500
tier: critical
triggers: implement, add feature, build, create, new behavior, workflow, UI, endpoint, command, integration
chains:
  before: [planning, spec-design, api-design]
  after: [testing, code-review]
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

## Quality Gate

Gates: Code, Tests, API (if public contract changed), Security (if auth/input boundary touched)  
- Lint and typecheck clean, or gap stated.
- No speculative abstraction — code solves the current request only.
- Tests cover the new behavior including at least one negative case.
- If a public API or contract changed: backward-compatible or migration defined.
- If user input flows to a sensitive operation: validated at the boundary.

See `core/rules/quality-gates.md` → Code, Tests, API, Security dimensions.

## Frontend notes (React/Vite/TS projects)

When `feature-implementation` applies to a React UI, apply these additional constraints:

- **Data before pages** — ensure `data/index.ts` matches the full shape that page components need before writing any page. Schema drift between data and pages is a common source of cascading type errors.
- **Build order** — within a page or feature: write/update primitives first, then composites, then the page. Never write top-down.
- **Token consumption** — destructure both `t` (colors) and `r` (radii) from `useTheme()`. Hardcoded hex values or pixel radii in component files are defects.
- **Batch type-check** — run `tsc --noEmit` after completing each logical group of files (e.g., after all new primitives, after the page). Fix errors before adding the next group.
- **Defer `npm run dev`** — don't start the dev server until all new imports resolve. Unresolved module errors pollute the output and slow diagnosis.

## Done When

- The smallest safe behavior change was made.
- Relevant tests, lint, typecheck, build, or smoke checks passed or gaps are stated.
- Diff was reviewed for unrelated changes.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
