# Project Config Schema

Expected file:

```text
ai-memory/project-config.md
```

## Required Sections

- `# Project Config`
- `## Verification Commands`
- `## Important Paths`
- `## Protected Paths`
- `## Commit Rule`

## Verification Commands

Use one command per line:

```text
- Test: npm test
- Typecheck: npm run typecheck
- Lint: npm run lint
- Build: npm run build
- Format: npm run format:check
- Smoke/verify: npm run smoke
```

Leave unknown commands blank until the project has a real command. Integration checks should warn on blank test commands, not invent them.

## Protected Paths

List paths that agents should not change without explicit user instruction:

```text
- .env
- .env.*
- production.yml
- migrations/
```

## Commit Rule

State the project's minimum standard before commit. The default is:

```text
Do not commit unless relevant verification commands pass, the diff was reviewed, and unrelated files were not changed.
```

