# Skill Proposal Schema

Expected file:

```text
ai-memory/skill-improvement-proposals.md
```

## Entry Format

```text
## Proposal: Add rollback checklist to refactor skill

Observed in project:
- Agent changed too many files during refactor.
- Tests caught regression.

Suggested skill:
- Update skills/refactor/SKILL.md

Suggested rule:
- Require pre-change diff scope.
- Require post-change test command.
- Require rollback note.

Promotion checklist:
- Happened more than once:
- Helps multiple projects:
- Rule is simple:
- Reduces mistakes without too much context:
- Can be verified:

Status:
- proposed
```

## Promotion Rule

Do not automatically mutate shared skills from this file. A human should review proposals before changing shared files.

