---
name: testing
description: Add, repair, design, or review tests and coverage for behavior changes, bug fixes, edge cases, and verification strategy.
tokens: ~500
tier: critical
triggers: test, coverage, unit test, integration test, e2e, verify, assertion, fixture, regression test
chains:
  before: [feature-implementation, debugging, refactor]
  after: [code-review, release-verification]
---

# Skill: testing

## When to use

Use for adding tests, repairing tests, improving coverage, or designing a focused test strategy.

## Inputs to check

- Behavior, contract, or risk being tested.
- Existing test framework, naming style, fixtures, and helpers.
- Relevant commands for unit, integration, or end-to-end tests.

## Steps

1. Define the behavior under test.
2. For bug fixes, write or identify a reproduction test before changing code when practical.
3. Use the project's existing test style and helpers.
4. Write focused setup and assertions.
5. Cover important edge cases and failure paths.
6. Run the relevant test command and fix test issues.

## Review checklist

- Tests assert behavior, not incidental implementation.
- Tests are deterministic and isolated.
- Test doubles are as real as practical: prefer real implementations, then fakes, then stubs, then mocks.
- New coverage matches the risk being addressed.
- Failure messages would help diagnose regressions.

## Memory update guidance

Update memory only for durable test commands, fixture conventions, or known testing constraints. Do not store transient failures or raw test output.

## Quality Gate

Gates: Tests  
- Tests assert externally visible behavior, not implementation details.
- Tests are deterministic and isolated — no shared mutable state between cases.
- Test doubles match the risk: real implementation preferred, mocks only for external I/O.
- Failure messages name the expected behavior, not just "expected X got Y".
- No skipped or commented-out tests without a dated explanation.

See `core/rules/quality-gates.md` → Tests dimension.

## Done When

- Tests cover the behavior or risk being addressed.
- Relevant test command passed or the blocker is stated.
- Diff was reviewed for brittle or unrelated test changes.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
