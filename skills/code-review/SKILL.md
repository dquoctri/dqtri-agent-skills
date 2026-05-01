---
name: code-review
description: Review code changes for correctness, readability, architecture fit, security, performance, missing tests, and behavioral regressions.
tokens: ~550
tier: critical
triggers: review, audit, code review, assess, check diff, before merge, correctness, readability
chains:
  before: [testing]
  after: [deployment]
---

# Skill: code-review

## When to use

Use when asked to review, audit, or assess code changes before or after implementation.

## Inputs to check

- Diff, changed files, or requested review scope.
- Intended behavior and affected contracts.
- Related tests, configuration, migrations, and call sites.

## Steps

1. Understand the goal of the change.
2. Review tests first when present to understand intended behavior.
3. Inspect high-risk paths first.
4. Check correctness, readability, architecture fit, security, performance, and verification.
5. Look for bugs, regressions, missing tests, data loss, security issues, and compatibility breaks.
6. Verify findings against code and tests.
7. Report actionable findings ordered by severity.

## Review checklist

- Findings include file and line when possible.
- Each finding explains risk and suggested fix.
- Findings are labeled by severity when severity matters.
- Non-issues and style preferences are omitted.
- If no issues are found, residual risk is stated briefly.

## Memory update guidance

Update memory only for durable review standards or recurring project risks. Do not promote one review's context into global guidance.

## Quality Gate

Gates: All dimensions relevant to the diff  
- Apply Code gate if implementation changed.
- Apply Tests gate if test coverage changed or is missing.
- Apply Architecture gate if module boundaries or dependency direction changed.
- Apply API gate if a public contract changed.
- Apply Security gate if auth, input handling, or secrets are involved.
- Apply Performance gate if a hot path, query, or loop changed.
- Each finding includes: file reference, severity label, risk description, suggested fix.

See `core/rules/quality-gates.md` → all dimensions.

## Done When

- Findings are ordered by severity and tied to concrete files or behavior.
- Verification evidence and missing checks are stated.
- Scope, unrelated changes, and residual risk were considered.
- Durable learning was recorded only if useful.
- Any skill improvement was proposed, not auto-applied.
