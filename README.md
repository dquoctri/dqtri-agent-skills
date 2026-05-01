# dqtri-agent-skills

Reusable SDLC skills, project memory, and verification checks for coding agents.

`dqtri-agent-skills` is a zero-install SDLC skill, memory, and verification system for coding agents. Projects reference shared reusable skills from `~/dqtri-agent-skills/` while keeping durable context in local `./ai-memory/`.

It provides reusable developer workflows, shared rules, project-local memory, and explicit project checks to reduce context loss, save tokens, and keep agent work auditable.

The repo is meant to live at:

```text
~/dqtri-agent-skills/
```

Projects reference that path directly from their own agent instruction files.

## Why Zero-Install

Agent instructions work best when they are easy to inspect and hard to accidentally mutate. The system stays simple:

- No installer.
- No symlinks.
- No package manager.
- No daemon or service.
- No generated global config.
- No hidden state.
- Skills stay reusable and read-only unless explicitly edited.
- Project memory stays with the project.

## Scope

This project focuses on:

- SDLC workflows.
- Coding-agent skills.
- Shared rules.
- Project-local memory.
- Project integration checks.
- Verification and diff discipline.
- Token and context saving.
- Safe skill improvement through reviewed skill suggestions.

This project is not:

- An autonomous agent runtime.
- A chat gateway.
- A daemon or service.
- A package manager.
- A clone or subset of any agent model/runtime.

## Folder Structure

```text
dqtri-agent-skills/
|-- AGENTS.md
|-- core/
|   |-- rules/
|   |   |-- coding.md
|   |   |-- workflow.md
|   |   |-- memory.md
|   |   |-- safety.md
|   |   `-- verification.md
|   `-- templates/
|       |-- AGENTS.md
|       |-- CLAUDE.md
|       `-- project-config.md
|-- skills/
|   |-- spec-design/SKILL.md
|   |-- planning/SKILL.md
|   |-- architecture/SKILL.md
|   |-- api-design/SKILL.md
|   |-- feature-implementation/SKILL.md
|   |-- debugging/SKILL.md
|   |-- refactor/SKILL.md
|   |-- testing/SKILL.md
|   |-- code-review/SKILL.md
|   |-- security-review/SKILL.md
|   |-- performance-review/SKILL.md
|   |-- deployment/SKILL.md
|   `-- release-verification/SKILL.md
|-- memory/
|   `-- projects/
|-- scripts/
|   |-- new-project-memory.sh
|   |-- verify-project-integration.sh
|   |-- check-diff-scope.sh
|   |-- check-memory-hygiene.sh
|   |-- collect-project-lessons.sh
|   |-- propose-skill-update.sh
|   |-- update-upstream.sh
|   `-- doctor.sh
|-- checks/
|   |-- required-files.txt
|   `-- required-agent-instructions.txt
|-- schemas/
|   |-- project-config.schema.md
|   |-- memory.schema.md
|   `-- skill-proposal.schema.md
`-- README.md
```

Project-local memory lives with each software project:

```text
project/
|-- AGENTS.md
`-- ai-memory/
    |-- facts.md
    |-- project-profile.md
    |-- summary.md
    |-- decisions.md
    |-- patterns.md
    |-- mistakes.md
    |-- project-config.md
    |-- project-experience-log.md
    |-- skill-improvement-proposals.md
    `-- skill-improvements.md
```

## Reference From A Project

Add an `AGENTS.md`, `CLAUDE.md`, or equivalent file to the software project. Point it at this shared skill layer:

```text
~/dqtri-agent-skills/
```

Use the provided templates:

```sh
cp ~/dqtri-agent-skills/core/templates/AGENTS.md ./AGENTS.md
cp ~/dqtri-agent-skills/core/templates/CLAUDE.md ./CLAUDE.md
```

This copies only the project instruction file. It does not install packages and does not create symlinks.

## Initialize ai-memory

From the project root:

```sh
~/dqtri-agent-skills/scripts/new-project-memory.sh
```

This creates:

```text
ai-memory/
|-- facts.md
|-- project-profile.md
|-- summary.md
|-- decisions.md
|-- patterns.md
|-- mistakes.md
|-- project-config.md
|-- project-experience-log.md
|-- skill-improvement-proposals.md
`-- skill-improvements.md
```

The script preserves existing files, creates no symlinks, and does not modify global config.

## Verify Project Integration

Check whether a consuming project is wired into this skill layer:

```sh
~/dqtri-agent-skills/scripts/verify-project-integration.sh /path/to/project
```

The script checks for agent instruction files, `ai-memory/`, required memory files, references to `dqtri-agent-skills`, lazy rule loading, 1-2 skill loading, verification instructions, commit rules, and declared commands.

Example output:

```text
PASS: AGENTS.md found
PASS: ai-memory/ found
WARN: no test command declared
FAIL: project does not reference dqtri-agent-skills
```

Use diff and memory checks during work:

```sh
~/dqtri-agent-skills/scripts/check-diff-scope.sh /path/to/project --max-files 5
~/dqtri-agent-skills/scripts/check-memory-hygiene.sh /path/to/project
```

## Lazy Skill Loading

Agents should read shared rules from:

```text
~/dqtri-agent-skills/core/rules/
```

Skills are loaded lazily from:

```text
~/dqtri-agent-skills/skills/
```

Load at most 1-2 skills for a task. Never load all skills.

Lifecycle skill guide:

- `spec-design`: requirements, acceptance criteria, non-goals, implementation-ready specs.
- `planning`: thin, verifiable steps for multi-step work.
- `architecture`: boundaries, dependency direction, system design, migrations.
- `api-design`: APIs, schemas, commands, events, integration contracts.
- `feature-implementation`: new behavior, workflows, APIs, commands, UI changes.
- `debugging`: failing tests, runtime errors, regressions, crashes, incorrect behavior.
- `refactor`: behavior-preserving restructuring, simplification, renaming, cleanup.
- `testing`: adding, repairing, or improving tests.
- `code-review`: review, audit, or risk assessment.
- `security-review`: vulnerability review, threat analysis, auth, input handling, secrets.
- `performance-review`: latency, throughput, memory, bundle, rendering, query performance.
- `deployment`: release prep, environment changes, migrations, rollout, rollback.
- `release-verification`: post-change, post-review, or post-deploy verification.

Each skill ends with a `Done When` section so task completion includes verification, diff review, durable learning only when useful, and skill proposals rather than automatic skill mutation.

## Memory Rules

Project memory lives in:

```text
./ai-memory/
```

Store durable project knowledge only:

- Stack, commands, and conventions.
- Durable decisions.
- Recurring implementation patterns.
- Mistakes worth avoiding again.
- Long-lived constraints.
- Project verification commands and protected paths.
- Raw project experience when useful for later review.
- Reusable skill improvement proposals.

Do not store:

- Temporary debugging logs.
- Raw command output.
- Secrets or credentials.
- Chat transcripts.
- Content inside `<private>...</private>` tags.
- Project-specific context in shared skills.

## Skill Improvement Rules

Reusable skill ideas go in:

```text
./ai-memory/skill-improvement-proposals.md
```

This file is a proposal queue. Entries are not automatically promoted to shared skills. Older projects may still have `skill-improvements.md`; prefer `skill-improvement-proposals.md` for new entries.

Never edit shared skills from normal project work. Change files under `~/dqtri-agent-skills/skills/` only when explicitly asked to improve this skill system itself.

Promotion checklist:

- Did this happen more than once?
- Would this help multiple projects?
- Is the rule simple?
- Does it reduce mistakes without adding too much context?
- Can it be verified?

## Execution Loop

1. Read the project `AGENTS.md` or `CLAUDE.md`.
2. Read relevant shared rules from `~/dqtri-agent-skills/core/rules/`.
3. Read project memory from `./ai-memory/` when it exists.
4. Read `./ai-memory/project-config.md` when it exists.
5. Select at most 1-2 relevant skills.
6. Plan the next coherent change with input, action, output, verification, and stop point.
7. Implement one bounded step.
8. Review the diff and run relevant verification.
9. Update `./ai-memory/` only when the information is durable.
10. Propose skill improvements only as proposals.

## Test Before Commit

Before proposing or creating a commit:

1. Run the declared test command when relevant.
2. Run lint, typecheck, build, or smoke commands when declared and relevant.
3. Inspect the git diff.
4. Confirm no unrelated files changed.
5. Confirm protected paths, generated files, lockfiles, and secrets were not changed unexpectedly.
6. Only then propose a commit message.

## Codex Example

In a project's `AGENTS.md`:

```md
# AGENTS.md

This project uses dqtri-agent-skills for SDLC workflows and project-local memory.

Read relevant rules from `~/dqtri-agent-skills/core/rules/`.
Read project memory from `./ai-memory/`.
Load at most 1-2 relevant skills from `~/dqtri-agent-skills/skills/`.
Never load all skills.
Never edit shared skills unless explicitly instructed.
Update `./ai-memory/` only for durable project knowledge.
```

For a design task, Codex should read the project instructions, relevant rules, `./ai-memory/`, then `~/dqtri-agent-skills/skills/spec-design/SKILL.md`.

For a debugging task, Codex should load only `debugging` plus optionally `testing` if a regression test is needed.

## Claude Code Example

In a project's `CLAUDE.md`:

```md
# CLAUDE.md

This project uses dqtri-agent-skills for SDLC workflows and project-local memory.

Shared rules: `~/dqtri-agent-skills/core/rules/`
Lazy skills: `~/dqtri-agent-skills/skills/`
Project memory: `./ai-memory/`

Load at most 1-2 skills per task. Do not preload all skills.
Treat shared skills and rules as read-only unless explicitly instructed.
Write memory only when it is durable.
```

For a feature task, Claude Code should use the shared rules, project memory, and `feature-implementation`; add `api-design`, `testing`, or `release-verification` only when that specific step is active.

## Doctor

Check the `dqtri-agent-skills` tree:

```sh
~/dqtri-agent-skills/scripts/doctor.sh
```

The doctor prints clear `PASS` and `FAIL` lines for required folders, rules, skills, and scripts.

## Upstream Sources

External skill repositories and UI design references live under `upstream/`. They are ignored by this repository and are used only as source material for improving the shared rules and skills.

Read the maintenance guide:

```text
upstream/README.md
```

Update references explicitly:

```sh
./scripts/update-upstream.sh
```

Refresh a specific `getdesign` UI reference:

```sh
./scripts/update-upstream.sh airtable
```
