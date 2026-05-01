# CLAUDE.md — dqtri-agent-skills

This project IS the dqtri-agent-skills skill and memory system. The shared rules, skills, and templates in this repo are used by other projects that reference `~/dqtri-agent-skills/`. When working on this project, you are editing the system itself.

## This Repo Is Its Own Skill System

Rules live at `./core/rules/` — load them from here, not from `~/dqtri-agent-skills/core/rules/` (they are the same directory).

Skills live at `./skills/` — same principle.

Memory lives at `./ai-memory/`.

There is no install step, symlink, package manager, daemon, or generated global config.

## Start Here: Harness

Load `./core/rules/harness.md` first on every task. It defines the pre-task gate, during-task guardrails, post-task quality gate, and context auto-optimization trigger.

## Role Profile

For most work on this project, use the **tech-lead** profile when reviewing or planning, and the **developer** profile when implementing.

- Review, planning, spec work: `./skills/profiles/tech-lead.md`
- Implementation, debugging, refactoring: `./skills/profiles/developer.md`

Load the profile instead of selecting skills manually. The profile declares which skills, memory layers, and context budget apply.

## Shared Rules to Load

From `./core/rules/` — load only what the task needs:

- `harness.md` — always load first
- `quality-gates.md` — load at post-task gate
- `coding.md` — implementation tasks
- `workflow.md` — when execution order or memory loading is unclear
- `memory.md` — when updating `ai-memory/`
- `safety.md` — when modifying shared skills or rules
- `verification.md` — before proposing a commit

## Skill Selection

Use `./skills/index.md` for single-skill dispatch.
Use `./skills/chains.md` for multi-step SDLC flows.
Load at most 1-2 skills per task.

## Project Memory

```
./ai-memory/
```

Layer 0 (always): `summary.md`, `project-config.md`
Layer 1 (complex tasks): `decisions.md`, `patterns.md`, `mistakes.md`
Layer 2 (debugging only): `project-experience-log.md`

Check `./ai-memory/current-task.md` at session start — if non-empty, resume from the recorded step.

## Verification Commands

```bash
bash scripts/doctor.sh                        # verify this repo's own structure
bash scripts/verify-project-integration.sh .  # check consuming-project integration
bash scripts/check-memory-hygiene.sh .        # scan ai-memory/ for secrets/logs
bash scripts/compress-memory.sh .             # check experience log entry count
```

Run `scripts/doctor.sh` before reporting any structural change as complete.

## Protected Paths — Do Not Edit Unless Explicitly Asked

The following are the shared skill system. Treat them as read-only during normal work. Edit only when the user explicitly asks to improve or change the skill system itself:

- `core/rules/` — shared rules
- `core/templates/` — project starter templates
- `skills/*/SKILL.md` — all skill files
- `skills/index.md`, `skills/chains.md`, `skills/profiles/`
- `schemas/`
- `checks/`

Safe to edit freely:

- `ai-memory/` — project memory for this repo
- `docs/` — research, changelog, backlog
- `scripts/` — helper scripts (non-destructive inspection tools)
- `README.md`, `AGENTS.md`, `CLAUDE.md` — project-level docs

Confirm with the user before editing any protected path.

## Commit Rules

Do not propose or create a commit until:

- `bash scripts/doctor.sh` passes.
- Diff was reviewed — only files matching the task scope changed.
- No protected paths changed without explicit user instruction.
- No secrets, credentials, or upstream files committed.
- Session close entry written to `./ai-memory/project-experience-log.md`.

## Key Context: What This Project Is Not

- Not an autonomous agent runtime.
- Not a package to install.
- Not a framework with a CLI.
- Skills and rules are plain markdown files — inspectable, editable, version-controlled.
- Consuming projects reference this repo directly from `~/dqtri-agent-skills/`. No symlinks, no codegen, no daemons.
