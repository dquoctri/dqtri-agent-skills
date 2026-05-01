---
name: api-design
description: Design or change APIs, command interfaces, schemas, events, and integration contracts with compatibility, validation, auth, errors, and tests in mind.
tokens: ~550
tier: critical
triggers: api, endpoint, schema, contract, interface, event, integration, versioning, backward compatibility
chains:
  before: [spec-design, architecture]
  after: [feature-implementation, testing]
---

# Skill: api-design

## When to use

Use for designing or changing APIs, command interfaces, schemas, events, or integration contracts.

## Inputs to check

- Existing API patterns, schemas, docs, clients, and compatibility constraints.
- Consumers, auth requirements, validation rules, errors, pagination, and versioning.
- Backward compatibility, migration, observability, and test requirements.

## Steps

1. Identify consumers and the contract they need.
2. Reuse existing project API patterns where possible.
3. Define request, response, errors, auth, validation, and edge cases.
4. Plan compatibility, migration, and deprecation behavior.
5. Add contract tests or examples when the interface changes.

## Review checklist

- Contract is explicit and stable.
- Error behavior is predictable.
- Security and authorization boundaries are clear.
- Existing consumers are not broken unintentionally.

## Memory update guidance

Update memory for durable API conventions, compatibility decisions, or integration constraints. Do not store one-off payload dumps.

## Quality Gate

Gates: API, Security  
- Contract is backward-compatible, or breaking change has a migration plan and version.
- Error behavior is explicit and consistent — status codes, messages, error shape.
- Auth boundary is clear: who can call this, under what conditions, what is denied.
- Validation covers invalid input, missing required fields, and boundary values.
- Existing consumer tests still pass, or consumers are notified of the change.

See `core/rules/quality-gates.md` → API, Security dimensions.

## Done When

- Contract, errors, auth, validation, and compatibility expectations are explicit.
- Relevant contract tests or verification approach are defined.
- Diff or proposal was reviewed for scope and consumer impact.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
