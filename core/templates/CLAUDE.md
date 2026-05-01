# CLAUDE.md

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

Skill selection:

- `spec-design`: requirements, acceptance criteria, non-goals, implementation-ready specs.
- `planning`: thin, verifiable steps for multi-step work.
- `architecture`: system boundaries, dependency direction, migrations, structural decisions.
- `api-design`: APIs, schemas, commands, events, integration contracts.
- `feature-implementation`: new behavior, workflows, APIs, commands, UI changes.
- `debugging`: failing tests, runtime errors, regressions, crashes, incorrect behavior.
- `refactor`: behavior-preserving restructuring and cleanup.
- `testing`: adding, repairing, or improving tests.
- `code-review`: review, audit, or risk assessment.
- `security-review`: vulnerabilities, auth, input handling, secrets, threat analysis.
- `performance-review`: latency, throughput, memory, bundle, rendering, query performance.
- `deployment`: release prep, environment changes, migrations, rollout, rollback.
- `release-verification`: post-change, post-review, or post-deploy verification.

Never edit shared skills unless explicitly instructed by the user.

## Project Memory

Read project memory from:

```text
./ai-memory/
```

Update `./ai-memory/` only when information is durable and likely to help future sessions. Do not store temporary debugging logs, raw command output, secrets, chat transcripts, or content inside `<private>...</private>` tags.

## Execution Loop

1. Read this project `CLAUDE.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Read project memory from `./ai-memory/` when it exists.
4. Select at most 1-2 relevant skills from `~/dqtri-agent-skills/skills/`.
5. Define success criteria and plan the next coherent step.
6. Execute one step.
7. Review the result and run relevant verification.
8. Update `./ai-memory/` only when the new information is durable.
