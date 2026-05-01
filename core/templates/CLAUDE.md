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
- `verification.md`

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

Read project verification commands and boundaries from:

```text
./ai-memory/project-config.md
```

Update `./ai-memory/` only when information is durable and likely to help future sessions. Do not store temporary debugging logs, raw command output, secrets, chat transcripts, or content inside `<private>...</private>` tags. Record raw observations in `project-experience-log.md` and reusable skill ideas in `skill-improvement-proposals.md`.

## Execution Loop

1. Read this project `CLAUDE.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Load memory layer 0: `./ai-memory/summary.md` and `./ai-memory/project-config.md` (~150 tokens).
4. For complex tasks, load memory layer 1: `decisions.md`, `patterns.md`, `mistakes.md` (~400 tokens).
5. Check `./ai-memory/current-task.md` — if non-empty, resume from the recorded step.
6. Select at most 1-2 relevant skills using `~/dqtri-agent-skills/skills/index.md`.
7. Define success criteria and plan the next coherent step with input, action, output, verification, and stop point.
8. Execute one bounded step. Update `current-task.md` with the current step progress.
9. Review the diff and run relevant verification commands.
10. Update `./ai-memory/` only when the new information is durable (use write triggers in `memory.md`).
11. Append a session close entry to `./ai-memory/project-experience-log.md`.
12. Clear `./ai-memory/current-task.md` on task completion.

## Verification And Commit Rules

- Before reporting completion, inspect the diff and confirm changed files match the requested scope.
- Before proposing or creating a commit, run declared tests and relevant lint/typecheck/build commands when available.
- Do not commit if verification fails, unrelated files changed, or protected paths changed unexpectedly.
- Keep powerful actions explicit: formatting, dependency updates, memory updates, commits, pushes, and deploys should be user-visible commands.
