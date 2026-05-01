# Skill Dispatch Table

Use this table to select the 1-2 most relevant skills for a task. Match the task description against the trigger keywords. Prefer `critical` tier skills; load `optional` tier only when the task specifically requires it.

Read a skill's frontmatter `tokens` and `tier` before loading the full body. If the context budget is tight, skip `optional` skills.

## Dispatch Table

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

Available skills:
- `spec-design` — ~500 tokens, critical
- `planning` — ~450 tokens, critical
- `architecture` — ~550 tokens, critical
- `api-design` — ~550 tokens, critical
- `feature-implementation` — ~500 tokens, critical
- `debugging` — ~550 tokens, critical
- `refactor` — ~500 tokens, critical
- `testing` — ~500 tokens, critical
- `code-review` — ~550 tokens, critical
- `security-review` — ~550 tokens, optional
- `performance-review` — ~500 tokens, optional
- `deployment` — ~550 tokens, optional
- `release-verification` — ~500 tokens, optional
