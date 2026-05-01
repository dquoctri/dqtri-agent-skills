# Memory Schema

Expected project-local directory:

```text
ai-memory/
```

## Required Files

- `facts.md`: durable facts about stack, commands, architecture, and conventions.
- `decisions.md`: durable technical decisions with reason and consequences.
- `patterns.md`: recurring implementation patterns.
- `mistakes.md`: durable mistakes to avoid repeating.
- `project-config.md`: verification commands, important paths, protected paths, and commit rule.
- `project-experience-log.md`: raw observations from real agent work.
- `skill-improvement-proposals.md`: reviewed candidate improvements before shared skill updates.

## Optional Compatibility Files

- `project-profile.md`
- `summary.md`
- `skill-improvements.md`

## Hygiene Rules

- Store durable project knowledge only.
- Do not store secrets, credentials, private keys, personal data, raw logs, chat transcripts, or content inside `<private>...</private>` tags.
- Prefer summaries and file references over copied command output.
- Treat memory as context, not truth.

