# Memory Schema

Expected project-local directory:

```text
ai-memory/
```

## Required Files

- `facts.md`: durable facts about stack, commands, architecture, and conventions.
- `decisions.md`: durable technical decisions with reason and consequences.
- `patterns.md`: recurring implementation patterns (write after second occurrence).
- `mistakes.md`: durable mistakes to avoid repeating (write after backtrack or non-obvious failure).
- `project-config.md`: verification commands, important paths, protected paths, and commit rule.
- `project-experience-log.md`: raw session close micro-entries (one per task, mandatory).
- `skill-improvement-proposals.md`: reviewed candidate improvements before shared skill updates.
- `current-task.md`: scratch file for current in-progress task state; cleared on completion.

## Optional Compatibility Files

- `project-profile.md`
- `summary.md`
- `skill-improvements.md`

## Hygiene Rules

- Store durable project knowledge only.
- Do not store secrets, credentials, private keys, personal data, raw logs, chat transcripts, or content inside `<private>...</private>` tags.
- Prefer summaries and file references over copied command output.
- Treat memory as context, not truth.

