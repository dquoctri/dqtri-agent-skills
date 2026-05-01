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
- `verification.md`

## Skills

Load skills lazily from:

```text
~/dqtri-agent-skills/skills/
```

Load at most 1-2 skills per task. Never load all skills.

Never edit shared skills unless explicitly instructed by the user to improve this skill system itself.

## Project Memory

Read project memory from:

```text
./ai-memory/
```

Read project verification commands and boundaries from:

```text
./ai-memory/project-config.md
```

Update `./ai-memory/` only when information is durable and likely to help future sessions. Do not store temporary debugging logs, raw command output, secrets, chat transcripts, or content inside `<private>...</private>` tags.

## Execution Loop

1. Read this project `AGENTS.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Read project memory from `./ai-memory/` when it exists.
4. Read `./ai-memory/project-config.md` when it exists.
5. Select at most 1-2 relevant skills from `~/dqtri-agent-skills/skills/`.
6. Plan the next coherent change with clear input, action, output, verification, and stop point.
7. Implement one bounded step.
8. Review the diff and run relevant verification commands.
9. Update `./ai-memory/` only when the new information is durable.

## Verification And Commit Rules

- Before reporting completion, inspect the diff and confirm changed files match the requested scope.
- Before proposing or creating a commit, run declared tests and relevant lint/typecheck/build commands when available.
- Do not commit if verification fails, unrelated files changed, or protected paths changed unexpectedly.
- Keep powerful actions explicit: formatting, dependency updates, memory updates, commits, pushes, and deploys should be user-visible commands.

