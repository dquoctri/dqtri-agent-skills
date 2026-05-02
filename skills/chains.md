# Skill Chains

Common SDLC skill sequences. Use this to understand what comes before and after the current skill. Do not load all skills in a chain upfront — load one at a time as the flow progresses.

Check the `chains.before` and `chains.after` in each skill's frontmatter for skill-level guidance. This file provides the full flow view.

## How to use

1. Identify which chain matches your task.
2. Confirm which step you are on.
3. Load only the skill for the current step.
4. After completing a step, load the next skill in the chain.
5. Do not skip steps without stating why.
6. Do not add steps speculatively.

---

## Chain: New Feature

> Use for shipping new user-visible behavior.

```
spec-design → planning → feature-implementation → testing → code-review
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | spec-design | Testable acceptance criteria and non-goals written |
| 2 | planning | Steps with verification methods, risks isolated |
| 3 | feature-implementation | Behavior works, lint/typecheck clean |
| 4 | testing | Tests cover behavior + at least one failure path |
| 5 | code-review | No severity findings blocking merge |

---

## Chain: Bug Fix

> Use for diagnosed failures, regressions, or incorrect outputs.

```
debugging → testing → code-review
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | debugging | Root cause identified, narrowest fix made |
| 2 | testing | Reproduction test added, regression checks pass |
| 3 | code-review | Fix is minimal, no unrelated changes |

---

## Chain: System Change

> Use for structural decisions affecting module boundaries, APIs, or data flow.

```
architecture → api-design → planning → feature-implementation → testing
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | architecture | Boundaries, tradeoffs, migration path explicit |
| 2 | api-design | Contract, auth, errors, compatibility defined |
| 3 | planning | Safe ordered steps, risky work isolated |
| 4 | feature-implementation | Change implemented in thin slices |
| 5 | testing | Contracts and boundaries covered by tests |

---

## Chain: Tech Debt / Refactor

> Use for behavior-preserving cleanup, simplification, or dependency changes.

```
spec-design → refactor → testing → code-review
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | spec-design | Scope and non-goals clear — what will NOT change |
| 2 | refactor | Behavior unchanged, structure improved |
| 3 | testing | Existing tests still pass, no new brittle tests |
| 4 | code-review | No behavior change introduced |

---

## Chain: Release

> Use for preparing and verifying a production deployment.

```
code-review → deployment → release-verification
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | code-review | No blocking findings, diff matches scope |
| 2 | deployment | Steps, rollback, secrets, verification all explicit |
| 3 | release-verification | Acceptance criteria checked, residual risk stated |

---

## Chain: Security Hardening

> Use when hardening a feature, API, or system against security risks.

```
security-review → feature-implementation → testing → code-review
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | security-review | Findings severity-labeled, mitigations defined |
| 2 | feature-implementation | Mitigations implemented, narrowest change |
| 3 | testing | Security checks covered (invalid input, auth bypass, etc.) |
| 4 | code-review | No new vulnerabilities introduced |

---

## Chain: Migration

> Use for deprecations, API removals, framework upgrades, or codebase-wide transitions.  
> Note: a dedicated `migration` skill is planned — see `docs/backlog.md`.

```
spec-design → planning → feature-implementation → testing → deployment → release-verification
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | spec-design | Usage discovery complete, replacement readiness defined |
| 2 | planning | Steps safe-ordered: discovery → dual-write/compat → cutover → cleanup |
| 3 | feature-implementation | Replacement in place, old path still works |
| 4 | testing | Both old and new paths covered |
| 5 | deployment | Rollback defined, migration order safe |
| 6 | release-verification | Zero-usage of old path confirmed |

---

## Chain: UI Build

> Use when building a React/Vite/TS UI from a design spec (HTML prototype, Figma, screenshots).

```
spec-design → frontend-scaffold → design-token-system → ui-component-library → feature-implementation → code-review
```

| Step | Skill | Success signal |
|---|---|---|
| 1 | spec-design | Component inventory complete, page list and token dimensions defined |
| 2 | frontend-scaffold | Project runs, folder structure, router, context, and mock data in place |
| 3 | design-token-system | `buildTheme()`, `RADII`, and `useTheme()` complete; `tsc --noEmit` clean |
| 4 | ui-component-library | All layers (primitives → charts → layout → pages) built and type-check clean |
| 5 | feature-implementation | Individual page features, interactions, and edge cases implemented |
| 6 | code-review | No hardcoded tokens, no type errors, no layout regressions |

---

## Quick Reference

| Task type | Chain |
|---|---|
| New feature | spec-design → planning → feature-implementation → testing → code-review |
| Bug fix | debugging → testing → code-review |
| System change | architecture → api-design → planning → feature-implementation → testing |
| Tech debt | spec-design → refactor → testing → code-review |
| Release | code-review → deployment → release-verification |
| Security hardening | security-review → feature-implementation → testing → code-review |
| Migration | spec-design → planning → feature-implementation → testing → deployment → release-verification |
| UI build | spec-design → frontend-scaffold → design-token-system → ui-component-library → feature-implementation → code-review |
