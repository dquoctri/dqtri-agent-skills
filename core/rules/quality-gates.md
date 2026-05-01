# Quality Gates

Quality gates are applied at the post-task step of the harness. Each task applies only the dimensions relevant to its skill. Read this file only when the post-task gate requires it — do not load it on every task.

## How to use

Each `SKILL.md` declares which quality gate dimensions apply in its `## Quality Gate` section. After implementation, check every declared dimension before reporting done.

A gate is either **pass**, **fail**, or **skip with reason**. Never silently skip a gate.

---

## Dimension: Code

Apply when: any code was written or changed.

- Lint and typecheck pass (or declared as unavailable).
- No unused imports, variables, or dead branches introduced.
- Names describe domain concepts, not implementation details.
- No speculative abstraction — code solves the current problem only.
- No error handling for impossible scenarios.
- Style matches the surrounding file, even if you would write it differently.
- Every changed line traces back to the user's request or to verification of that request.

**Pass signal:** `lint/typecheck clean` + diff matches scope.  
**Fail signal:** any introduced complexity that does not map to a user requirement.

---

## Dimension: Tests

Apply when: tests were added, changed, or behavior under test was modified.

- Tests assert externally visible behavior, not implementation details.
- Tests are deterministic — no randomness, time-dependency, or network calls without isolation.
- Tests are isolated — one test does not depend on another's side effects.
- Test doubles: prefer real implementations, then fakes, then stubs, then mocks.
- Failure messages would help a future engineer diagnose the regression.
- Coverage matches the risk: bug fixes have a reproduction test, behavior changes have a positive + negative case.
- No skipped or commented-out tests left behind without a dated explanation.

**Pass signal:** test command green + new coverage matches changed behavior.  
**Fail signal:** test passes but only because it mirrors implementation structure.

---

## Dimension: Architecture

Apply when: module boundaries, dependency direction, data flow, or structural decisions changed.

- Dependency direction is explicit and enforced (no circular deps introduced).
- Boundaries are named and enforceable in code or workflow.
- The change fits the project's existing architectural style.
- Migration path, rollback, and verification needs are stated when the change is structural.
- No coupling introduced between modules that should be independent.

**Pass signal:** dependency graph unchanged or change is intentional and stated.  
**Fail signal:** new import that crosses a declared boundary without justification.

---

## Dimension: API

Apply when: a public API, schema, command interface, event, or integration contract changed.

- Backward compatible, or breaking change is intentional with migration plan stated.
- Error behavior is explicit and documented.
- Auth boundary is clear — who can call this, under what conditions.
- Validation rules cover invalid input, missing fields, and boundary values.
- Consumers are not broken unintentionally — check call sites or tests.
- Contract tests or examples updated when the interface changed.

**Pass signal:** existing consumer tests still pass + contract documented.  
**Fail signal:** response shape changed without a version or migration path.

---

## Dimension: Security

Apply when: auth, authorization, input handling, external integrations, secrets, or data sensitivity changed.

- User input is validated at system boundaries before use.
- Output is encoded for the target context (HTML, SQL, shell, JSON).
- Auth check happens before the action, not after.
- Secrets are never logged, returned in responses, or written to memory files.
- No `<private>...</private>` content in stored memory or output.
- External dependencies: no new dependencies with known CVEs introduced without review.
- Trust boundary is explicit — what is trusted, what is untrusted.

**Pass signal:** no raw user input reaches a sensitive operation unvalidated.  
**Fail signal:** any user-controlled string reaches a query, shell, template, or redirect without sanitization.

---

## Dimension: Performance

Apply when: a hot path, query, rendering loop, network call, or cache was changed.

- Change is tied to a real bottleneck or budget, not speculative optimization.
- No N+1 query pattern introduced.
- No unbounded loop or accumulation introduced.
- No avoidable waterfall (sequential calls that could be parallel).
- Correctness and readability are not sacrificed for micro-optimization.
- Before/after evidence provided when practical (benchmark, query plan, profile).

**Pass signal:** claim backed by measurement or clear structural reasoning.  
**Fail signal:** optimization with no baseline or measurement.

---

## Dimension: Deployment

Apply when: release steps, environment config, migrations, CI/CD, or rollout changed.

- Release steps are explicit and ordered.
- Rollback or recovery path is defined.
- Secrets referenced by variable name only — never exposed in config or memory.
- Pre-deploy and post-deploy verification steps are named.
- Migration order is safe — database before code, or code tolerates both states.
- Monitoring or alerting is in place before traffic shifts.

**Pass signal:** a second engineer could execute the release from the written steps alone.  
**Fail signal:** a deploy step requires undocumented knowledge or manual judgment.

---

## Quick Reference

| Skill | Gates to apply |
|---|---|
| spec-design | Architecture |
| planning | Architecture |
| architecture | Architecture, API (if contracts defined) |
| api-design | API, Security |
| feature-implementation | Code, Tests, API (if public), Security (if boundary) |
| debugging | Code, Tests |
| refactor | Code, Tests, Architecture |
| testing | Tests |
| code-review | All relevant to the diff |
| security-review | Security |
| performance-review | Performance, Code |
| deployment | Deployment, Security |
| release-verification | Deployment, Tests |
