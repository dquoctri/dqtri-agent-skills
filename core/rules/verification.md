# Verification Rules

Use verification as a visible project discipline, not as hidden automation. The agent should prove the current task is complete with the smallest reliable checks before claiming completion or proposing a commit.

## Deterministic Step Boundaries

For each non-trivial task, work in bounded steps with:

- Input: approved request, relevant files, project memory, and selected skills.
- Action: one coherent read, edit, review, or verification activity.
- Output: changed files, findings, command results, or a concrete next step.
- Verification: command, diff review, reproduction check, or explicit reason verification is unavailable.
- Stop point: finish the step before expanding scope.

## Before Editing

- Read relevant project instructions and memory.
- Load only relevant rules and 1-2 skills.
- Identify the smallest safe change and target files.
- State assumptions when they affect scope or verification.

## After Editing

- Inspect the diff before reporting completion.
- Confirm changed files match the requested scope.
- Run the declared project verification commands when relevant.
- Explain skipped checks and environmental blockers plainly.
- Do not update memory unless the new information is durable.

## Before Commit

Do not suggest or create a commit until:

- Declared test command passed, or the reason it could not run is clear.
- Lint, typecheck, build, or smoke commands passed when declared and relevant.
- Diff was reviewed.
- No unrelated files were changed.
- No protected files, secrets, generated files, or lockfiles changed unexpectedly.
- Commit message reflects the actual diff.

## Explicit Tool Use

- Keep powerful actions visible: tests, formatting, memory updates, dependency updates, commits, pushes, and deploys should be explicitly invoked.
- Do not rely on background hooks, hidden retrieval, automatic commits, automatic memory mutation, or automatic skill switching.
- If a validation script reports a failure, explain the failure and ask before broadening scope or making destructive changes.

