---
name: architecture
description: Make system design decisions about module boundaries, dependency direction, data flow, service boundaries, migrations, and large structural changes.
tokens: ~550
tier: critical
triggers: architecture, design, module, boundary, dependency, data flow, service, structure, migration, redesign
---

# Skill: architecture

## When to use

Use for system design, module boundaries, dependency direction, data flow, service boundaries, migrations, or major structural choices.

## Inputs to check

- Current architecture from code, configuration, and deployment shape.
- Existing boundaries, ownership, contracts, and data flows.
- Constraints from scale, reliability, security, operations, and migration risk.

## Steps

1. Describe the current structure.
2. Identify forces and constraints.
3. Consider realistic alternatives and why they do or do not fit.
4. Choose the smallest structural change that addresses the problem.
5. Keep dependency direction and ownership explicit.
6. Define migration, verification, and rollback needs when relevant.

## Review checklist

- Recommendation fits the project scale.
- Tradeoffs and risks are explicit.
- Durable decisions include context, decision, consequences, and alternatives when useful.
- Boundaries are enforceable in code or workflow.
- Migration path preserves working behavior.

## Memory update guidance

Update memory for durable architecture decisions, accepted tradeoffs, or lasting boundaries. Do not store speculative designs that were not adopted.

## Done When

- The smallest fitting architectural decision or change is explicit.
- Tradeoffs, migration needs, verification, and rollback are named when relevant.
- Diff or recommendation was reviewed for scope and dependency direction.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
