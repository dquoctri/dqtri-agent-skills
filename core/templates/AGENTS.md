# AGENTS.md

This project uses dqtri-agent-skills for software development lifecycle work and project-local memory.

dqtri-agent-skills is referenced directly from:

```text
~/dqtri-agent-skills/
```

There is no install step, symlink requirement, package manager, daemon, or generated global config.

## Shared Rules

Read relevant shared rules from:

```text
~/dqtri-agent-skills/core/rules/
```

Use these rule files as needed:

- `coding.md`
- `workflow.md`
- `memory.md`
- `safety.md`

## Skills

Load skills lazily from:

```text
~/dqtri-agent-skills/skills/
```

Load at most 1-2 skills per task. Never load all skills.

Available skills:

- `spec-design`
- `planning`
- `architecture`
- `api-design`
- `feature-implementation`
- `debugging`
- `refactor`
- `testing`
- `code-review`
- `security-review`
- `performance-review`
- `deployment`
- `release-verification`

Never edit shared skills unless explicitly instructed by the user.

## Project Memory

Read project memory from:

```text
./ai-memory/
```

Update `./ai-memory/` only when information is durable and likely to help future sessions. Do not store temporary debugging logs, raw command output, secrets, or chat transcripts.

## Execution Loop

1. Read this project `AGENTS.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Read project memory from `./ai-memory/` when it exists.
4. Select at most 1-2 relevant skills from `~/dqtri-agent-skills/skills/`.
5. Plan the next coherent change.
6. Implement one step.
7. Review the change and run relevant verification.
8. Update `./ai-memory/` only when the new information is durable.

## Skill Selection Guide

- Use `spec-design` for requirements, acceptance criteria, non-goals, and implementation-ready specs.
- Use `planning` for breaking work into thin, verifiable steps.
- Use `architecture` for boundaries, dependency direction, system design, migrations, or major structural decisions.
- Use `api-design` for APIs, schemas, commands, events, and integration contracts.
- Use `feature-implementation` for new behavior, workflows, APIs, commands, or UI changes.
- Use `debugging` for failing tests, runtime errors, regressions, crashes, and incorrect behavior.
- Use `refactor` for behavior-preserving restructuring, simplification, renaming, or cleanup.
- Use `testing` for adding, repairing, or improving tests.
- Use `code-review` for review, audit, or risk assessment.
- Use `security-review` for vulnerability review, threat analysis, auth, input handling, and secrets.
- Use `performance-review` for latency, throughput, memory, bundle, rendering, or query performance.
- Use `deployment` for release preparation, environment changes, migrations, rollout, and rollback.
- Use `release-verification` for post-change, post-review, or post-deploy verification.

If no skill clearly fits, use the shared rules only.
