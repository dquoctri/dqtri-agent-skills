---
name: spec-design
description: Turn ideas, requirements, bug reports, and product requests into scoped implementation-ready specs with acceptance criteria and non-goals.
tokens: ~500
tier: critical
triggers: spec, requirement, idea, product request, acceptance criteria, scope
chains:
  before: []
  after: [planning, architecture, feature-implementation]
---

# Skill: spec-design

## When to use

Use for turning an idea, requirement, bug report, or product request into a clear implementation-ready spec.

## Inputs to check

- User goal, constraints, non-goals, and acceptance criteria.
- Existing product behavior, docs, issues, and project memory.
- Affected users, workflows, data, APIs, and operational constraints.

## Steps

1. Restate the problem and desired outcome.
2. Identify assumptions, open questions, and tradeoffs.
3. Define scope, non-goals, and acceptance criteria.
4. Sketch affected interfaces, data, states, and failure cases.
5. Produce the smallest spec that can drive implementation and verification.

## Review checklist

- Requirements are testable and unambiguous.
- Non-goals prevent scope creep.
- Edge cases and failure states are named.
- The spec is small enough to implement in slices.

## Memory update guidance

Update memory only for durable product decisions, accepted constraints, or lasting domain concepts. Put reusable process improvements in `skill-improvement-proposals.md`.

## Quality Gate

Gates: Architecture  
- Acceptance criteria are testable and unambiguous (not vague).
- Non-goals are explicit — they prevent scope creep in later skills.
- Edge cases and failure states are named, not deferred.
- The spec is small enough to implement in independent slices.

See `core/rules/quality-gates.md` → Architecture dimension.

## Done When

- The smallest useful spec is clear enough to implement.
- Acceptance criteria and non-goals are testable.
- Relevant verification approach is named.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
