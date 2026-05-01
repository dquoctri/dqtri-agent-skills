# Improvement Backlog

Planned improvements not yet implemented. Each phase is self-contained and can be picked up independently. Implement in priority order within each phase.

---

## Phase 3 — Context Auto-Optimization

**Goal:** Recover gracefully when context exceeds budget mid-session, and structure content for maximum Anthropic prompt cache efficiency.

**Status:** Designed, not implemented.

### 3a. Per-Project Context Config (`ai-memory/config.md`)

Add an optional `ai-memory/config.md` to each consuming project:

```markdown
# Context Config
context_budget_tokens: 8000
experience_log_compress_threshold: 30
memory_layers_default: [0, 1]
role_profile: developer
```

- `context_budget_tokens`: total token budget for rules + memory + skill. Default: 8 000.
- `experience_log_compress_threshold`: entry count that triggers compression warning. Default: 30.
- `memory_layers_default`: which layers to load by default. Override per task.
- `role_profile`: which `skills/profiles/<role>.md` to load. Overrides manual skill selection.

Add `config.md` to `schemas/memory.schema.md` as an optional file. Add reading it to step 3 of the execution loop in `core/rules/harness.md`.

Update `scripts/new-project-memory.sh` to generate a `config.md` template.

### 3b. Context Optimization Script (`scripts/optimize-context.sh`)

When context exceeds budget, this script helps the agent recover:

```bash
#!/usr/bin/env bash
# optimize-context.sh
# Usage: bash scripts/optimize-context.sh [project-dir]
# Prints reload instructions when context is over budget.
```

Logic:
1. Read `ai-memory/config.md` for budget.
2. Estimate loaded files' sizes (wc -w as proxy for tokens / 0.75).
3. If over budget: print which files to drop (layer 2, layer 3 first).
4. Print reload order: memory layer 0 → current-task.md → active skill only.
5. Do not modify any files — output instructions only.

### 3c. Prompt Cache Structure Rule

Add a rule to `core/rules/harness.md` (Pre-Task Gate section):

> Load order for cache efficiency: shared rules first (stable, cached), skill body second (stable per task), memory last (dynamic). User message and diff always last. Stable content before the 5-minute TTL window stays cached across turns in a session.

This requires no code — it is a rule about the order of reads, not a script.

---

## Phase 4 — Missing SDLC Skills

**Goal:** Cover three high-frequency SDLC workflows that currently have no dedicated skill.

**Status:** Proposed, not implemented.

### 4a. Migration Skill (`skills/migration/SKILL.md`)

```yaml
name: migration
tokens: ~600
tier: critical
triggers: migrate, deprecate, upgrade, remove, transition, codebase-wide, framework upgrade
chains:
  before: [spec-design, planning]
  after: [testing, deployment, release-verification]
```

Steps:
1. Usage discovery — find all call sites of the thing being migrated.
2. Replacement readiness — confirm the new path is complete before cutting over.
3. Compatibility window — add dual-write or adapter if consumers need transition time.
4. Batch planning — migrate in small, independently-verifiable slices.
5. Cutover — switch consumers one at a time or all at once with a feature flag.
6. Zero-usage verification — confirm old path has no remaining callers.
7. Cleanup — remove old code only after zero-usage is confirmed.

Quality Gate: Architecture (dependency direction), API (backward compat window), Deployment (rollback path at each step).

### 4b. Incident Response Skill (`skills/incident-response/SKILL.md`)

```yaml
name: incident-response
tokens: ~500
tier: optional
triggers: incident, outage, production failure, critical bug, P0, P1, on-call
chains:
  before: []
  after: [debugging, testing, deployment]
```

Steps:
1. Impact scoping — who is affected, what is broken, severity level.
2. Reproduce — confirm the failure in a safe environment.
3. Stop the bleeding — apply the fastest safe mitigation (rollback, feature flag off, kill switch).
4. Root cause — trace from symptom to root, not the other way.
5. Minimal fix — narrowest change that addresses root cause without introducing new risk.
6. Regression test — add a test that would have caught this.
7. Post-mortem note — write to `mistakes.md`: what happened, why it mattered, how to avoid.

Quality Gate: Code (narrowest fix), Tests (reproduction test), Deployment (mitigation is reversible).

### 4c. Dependency Update Skill (`skills/dependency-update/SKILL.md`)

```yaml
name: dependency-update
tokens: ~450
tier: optional
triggers: update dependency, upgrade package, security patch, npm update, pip upgrade, major version
chains:
  before: []
  after: [testing, deployment]
```

Steps:
1. Changelog review — read release notes for the target version range.
2. Breaking changes scan — identify API changes, removed functions, behavior changes.
3. Update in isolation — update one dependency at a time, not all at once.
4. Run full test suite — not just unit tests; integration tests matter here.
5. Lockfile review — confirm no transitive surprise upgrades snuck in.
6. Staged rollout for major versions — deploy to a canary or staging first.

Quality Gate: Tests (full suite, not partial), Code (no accidental transitive changes), Deployment (lockfile committed, canary for majors).

---

## Phase 5 — Modern SDLC Best Practices

**Goal:** Update existing skills to reflect current professional practices: trunk-based development, feature flags, observability-first, contract testing, and security-left.

**Status:** Designed, not implemented. These are additive changes to existing skill files — each can be merged independently.

### 5a. Feature Flag + Trunk-Based Dev (`skills/feature-implementation/SKILL.md`)

Add to Steps section:
- For risky or long-running changes: wrap new behavior in a feature flag before merging to main.
- Prefer thin slices that merge to main daily over long-lived branches.
- Ship dark (flag off in production) before enabling for users.

Add to Quality Gate section: flag off by default unless explicitly enabling, flag name recorded in memory.

### 5b. Observability-First (`skills/feature-implementation/SKILL.md`, `skills/deployment/SKILL.md`)

Add to feature-implementation Steps:
- Before shipping behavior that processes data or user actions: add a structured log line and/or metric increment.
- Observability is part of done, not a follow-up ticket.

Add to deployment Steps:
- Confirm alerts are defined for the new behavior before traffic shifts.
- Deployment is not complete until the relevant dashboard reflects expected behavior.

### 5c. Contract Testing (`skills/testing/SKILL.md`, `skills/api-design/SKILL.md`)

Add to testing Steps:
- For APIs consumed by external services: use consumer-driven contract tests (e.g. Pact) in addition to unit tests.
- A contract test failure is a breaking change, not a test failure.

Add to api-design Review checklist:
- Consumer contract tests updated when interface changes.

### 5d. Bounded Context + Domain Language (`skills/architecture/SKILL.md`)

Add to Steps:
- Name each module boundary using domain language, not technical layer names.
- Define a ubiquitous language for the bounded context: the same word means the same thing everywhere inside the boundary.
- Each bounded context owns its own data schema — no cross-context direct DB joins.

### 5e. Security-Left (`skills/security-review/SKILL.md`)

Add a Security-Left section:
- Security review happens at design time (spec-design, architecture, api-design), not only at code-review.
- Check the threat model when the spec is written, not when the code is merged.
- Dependency CVE check: run before the implementation step, not only before deploy.

Add to `core/rules/coding.md` as Principle 5 (or appendix):
- Validate user input at the system boundary — never trust input that crosses a trust boundary.
- Use parameterized queries, not string formatting for SQL.
- Never log credentials, tokens, or PII even during debugging.

---

## Phase 7 — Memory Learning Loop Tooling

**Goal:** Give the growing experience log a path to distillation — surfacing patterns and mistakes that should graduate to shared skills.

**Status:** `collect-project-lessons.sh` exists but is shallow. `compress-memory.sh` exists but is advisory only. Need smarter extraction.

### 7a. Improve `scripts/collect-project-lessons.sh`

Current version only counts 4 keyword patterns. Extend to:
- Count entries per skill used (most-used skills should be reviewed for quality).
- Count entries where "Didn't work" is non-empty (candidates for `mistakes.md`).
- Count entries where "Proposal:" is non-"none" (ready for `skill-improvement-proposals.md`).
- Print ranked table: skill name | usage count | didn't-work count | proposal count.
- Print: "Top candidate for mistakes.md: <entry header>" for the highest didn't-work skill.

### 7b. Add `scripts/distill-memory.sh`

New script for human-guided distillation (output instructions only, does not edit files):

```bash
#!/usr/bin/env bash
# distill-memory.sh
# Usage: bash scripts/distill-memory.sh [project-dir]
# Reads experience log, groups by skill, surfaces candidates for patterns.md and mistakes.md
```

Logic:
1. Read `project-experience-log.md`.
2. Group entries by skill used.
3. For each skill with 3+ entries: extract "Worked" lines → candidate patterns.
4. For each skill with 2+ "Didn't work" lines: extract → candidate mistakes.
5. Print candidates with entry headers as evidence.
6. Print: "Review `ai-memory/skill-improvement-proposals.md` for any Proposal: entries with status: proposed".

### 7c. Memory Distillation Cadence Rule

Add to `core/rules/memory.md`:
- After 5 sessions in a project: run `bash scripts/collect-project-lessons.sh` and review output.
- After 10 sessions: run `bash scripts/distill-memory.sh` before starting the next major feature.
- When `project-experience-log.md` has 30+ entries: run `bash scripts/compress-memory.sh`.

---

## Implementation Notes

- Phases can be implemented in any order — they are independent.
- Phase 3a (`ai-memory/config.md`) unblocks Phase 3b (`optimize-context.sh`).
- Phase 5 changes are additive — existing skill behavior is preserved.
- Phase 7a should be implemented before 7b — the improved lesson scan informs what distill-memory.sh should surface.
- All new scripts must follow the existing pattern: read-only output, no auto-edits, `--help` flag, POSIX-compatible sh.

## Review Checklist (before implementing any phase)

- [ ] Does the change stay zero-install?
- [ ] Does it keep shared skills read-only unless user explicitly requests a change?
- [ ] Does it work without a daemon, hook, or background service?
- [ ] Is the new file or script inspectable in git?
- [ ] Does it reduce token cost or context complexity rather than increase it?
