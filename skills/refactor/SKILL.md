---
name: refactor
description: Perform behavior-preserving restructuring, simplification, extraction, renaming, dependency cleanup, and code clarity improvements.
tokens: ~500
tier: critical
triggers: refactor, restructure, simplify, extract, rename, clean up, dependency cleanup, clarity
chains:
  before: [spec-design]
  after: [testing, code-review]
---

# Skill: refactor

## When to use

Use for behavior-preserving restructuring, simplification, extraction, renaming, or dependency cleanup.

## Inputs to check

- Current behavior and public contracts that must remain stable.
- Existing tests, fixtures, snapshots, and verification commands.
- Adjacent patterns and naming conventions.

## Steps

1. Identify the behavior that must not change.
2. Understand why the current structure exists before removing or replacing it.
3. Choose one coherent structural improvement.
4. Make the smallest useful refactor.
5. Keep APIs, data formats, and side effects stable unless requested otherwise.
6. Run verification that would catch accidental behavior changes.

## Review checklist

- No feature change was introduced accidentally.
- Names and structure match the project style.
- Duplication or complexity was actually reduced.
- Error handling and boundary behavior were not weakened.
- Tests or checks still cover the preserved behavior.

## Memory update guidance

Update memory only when the refactor establishes a durable project convention or architectural boundary. Do not store local cleanup notes.

## Quality Gate

Gates: Code, Tests, Architecture  
- No feature change was introduced — behavior before and after is identical.
- Names and structure match the project's existing style.
- Duplication or complexity was actually reduced, not just moved.
- Tests still cover the preserved behavior.
- Dependency direction is unchanged or improved.

See `core/rules/quality-gates.md` → Code, Tests, Architecture dimensions.

## Done When

- The smallest behavior-preserving structural change was made.
- Relevant verification passed or gaps are stated.
- Diff was reviewed for scope drift and accidental behavior changes.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
