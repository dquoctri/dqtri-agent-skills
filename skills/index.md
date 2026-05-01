# Skill Dispatch Table

Use this table to select the 1-2 most relevant skills for a task. Match the task description against the trigger keywords. Prefer `critical` tier skills; load `optional` tier only when the task specifically requires it.

Read a skill's frontmatter `tokens` and `tier` before loading the full body. If the context budget is tight, skip `optional` skills.

## Start Here: Role Profiles

If you know the role for this session, load the role profile instead of selecting skills manually. The profile pre-selects skills, memory layers, and context budget.

| Role | Profile file | Use when |
|---|---|---|
| Developer | `skills/profiles/developer.md` | Implementing features, fixing bugs, refactoring, writing tests |
| Architect | `skills/profiles/architect.md` | System design, API contracts, module boundaries, structural planning |
| Tech Lead | `skills/profiles/tech-lead.md` | Code review, sprint planning, engineering standards, spec shaping |
| QA Engineer | `skills/profiles/qa.md` | Test strategy, coverage review, release verification |
| DevOps / SRE | `skills/profiles/devops.md` | Deployments, CI/CD, environments, rollbacks, release checks |
| Security Engineer | `skills/profiles/security.md` | Threat modeling, vulnerability review, auth design, hardening |

When no role is declared, use the dispatch table below.

## Multi-Skill Tasks: Check the Chain First

If a task spans multiple steps or skills, check `skills/chains.md` for the recommended SDLC flow sequence before selecting skills individually.

Common chains:
- **New feature**: spec-design → planning → feature-implementation → testing → code-review
- **Bug fix**: debugging → testing → code-review
- **System change**: architecture → api-design → planning → feature-implementation → testing
- **Release**: code-review → deployment → release-verification

## Dispatch Table (single-skill tasks)

| Task keyword or description | Primary skill | Secondary skill | Tier |
|---|---|---|---|
| spec, requirement, idea, product request, acceptance criteria | `spec-design` | `planning` | critical |
| plan, break down, multi-step, sequence, slice | `planning` | `spec-design` | critical |
| architecture, module boundary, dependency, data flow, service | `architecture` | `planning` | critical |
| api, endpoint, schema, contract, interface, event, versioning | `api-design` | `feature-implementation` | critical |
| implement, add feature, build, create, new behavior, workflow | `feature-implementation` | `testing` | critical |
| refactor, restructure, simplify, extract, rename, clean up | `refactor` | `testing` | critical |
| debug, fix bug, error, failing, crash, regression, broken | `debugging` | `testing` | critical |
| test, coverage, unit test, integration test, assertion, fixture | `testing` | `debugging` | critical |
| review, audit, code review, assess, check diff, before merge | `code-review` | — | critical |
| security, auth, authorization, vulnerability, injection, OWASP | `security-review` | `code-review` | optional |
| performance, slow, latency, optimize, bottleneck, N+1, cache | `performance-review` | `code-review` | optional |
| deploy, release, rollout, CI/CD, environment, ship | `deployment` | `release-verification` | optional |
| verify release, smoke test, acceptance, post-deploy, sign off | `release-verification` | `deployment` | optional |

## Token Budget Guide

- **Tight context** (< 4k tokens free): Load layer 0 memory only + 1 critical skill.
- **Normal context**: Load layer 0 + optional layer 1 + 1-2 skills as needed.
- **Ample context**: Load layers 0-1 + up to 2 skills + layer 2 if debugging.

Total cost for a typical task: ~150 (memory layer 0) + ~500 (one skill) = ~650 tokens of loaded context rules.

## Skill Files

All skills live at `~/dqtri-agent-skills/skills/<name>/SKILL.md`.

Each skill has `tokens`, `tier`, `triggers`, and `chains` in its frontmatter — read frontmatter before loading the full body.

| Skill | Tokens | Tier |
|---|---|---|
| `spec-design` | ~500 | critical |
| `planning` | ~450 | critical |
| `architecture` | ~550 | critical |
| `api-design` | ~550 | critical |
| `feature-implementation` | ~500 | critical |
| `debugging` | ~550 | critical |
| `refactor` | ~500 | critical |
| `testing` | ~500 | critical |
| `code-review` | ~550 | critical |
| `security-review` | ~550 | optional |
| `performance-review` | ~500 | optional |
| `deployment` | ~550 | optional |
| `release-verification` | ~500 | optional |
