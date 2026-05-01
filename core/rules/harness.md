# Harness Rules

The harness is the execution wrapper for every task. It enforces quality gates, manages context budget, and ensures the learning loop closes. Follow it on every task — it is invisible when things go well and catches failures when they don't.

## Pre-Task Gate

Before writing any code or making any change:

1. Load memory layer 0: `summary.md` + `project-config.md`.
2. Check `ai-memory/current-task.md` — if non-empty, resume from the recorded step instead of starting fresh.
3. Load `ai-memory/config.md` if present for the project's context budget and role profile.
4. Select skill via `skills/index.md`. Read the skill's `tokens` and `tier` before loading the body.
5. For complex or unfamiliar tasks, load memory layer 1: `decisions.md`, `patterns.md`, `mistakes.md`.
6. State success criteria explicitly: what does done look like? What verification proves it?
7. Declare context budget: how many tokens is this task allowed to consume?

Do not proceed past this gate if success criteria are unclear.

## During-Task Guardrails

While implementing:

- Work in one bounded step at a time (input → action → output → verify → stop).
- Every 5 steps, re-check: is the change still within the original scope?
- Write progress to `ai-memory/current-task.md` after each step.
- Stop on unexpected test, build, or lint failure — diagnose before continuing.
- Do not expand scope mid-task without re-stating the success criteria.
- Do not touch files outside the task's declared scope.

## Post-Task Quality Gate

Before reporting completion:

1. Review the diff — changed files must match requested scope.
2. Apply the relevant dimensions from `core/rules/quality-gates.md` for this task type.
3. Run declared verification commands (test, lint, typecheck, build, smoke).
4. If verification cannot run, state what was skipped and why.
5. Write session close entry to `ai-memory/project-experience-log.md`.
6. Apply memory write triggers from `core/rules/memory.md`.
7. Clear `ai-memory/current-task.md` (empty it, do not delete).

Do not report completion until steps 1–4 are satisfied or blockers are stated.

## Context Auto-Optimization

When estimated context exceeds the project budget (default: 8 000 tokens):

1. Write a task snapshot to `ai-memory/current-task.md`:
   - Goal, current step number, key decisions made so far, blockers.
2. Drop layers 1–3 memory from context.
3. Reload from: memory layer 0 → `current-task.md` → active skill only.
4. Continue from the snapshot step.

Priority order for what to keep when trimming:
- Keep: goal, current step, decisions made, active diff.
- Drop: exploratory reasoning, already-closed steps, full experience log, raw tool output.

Anthropic prompt cache note: load stable content first (rules, skill body), dynamic content last (diff, user message). Stable content stays cached across the 5-minute TTL window, reducing re-tokenization cost on long sessions.

## Skill Chain Awareness

Before starting a multi-skill task, check `skills/chains.md` for the recommended skill sequence. Do not skip a predecessor skill without stating why. Do not add successor skills speculatively.

## Role Profile

If a project `ai-memory/config.md` declares a `role_profile`, load the corresponding `skills/profiles/<role>.md` instead of manually selecting skills. The profile pre-selects skills, memory layers, and context budget for that role.

## Recovery

If the session was interrupted:
1. Read `ai-memory/current-task.md` first.
2. Do not re-do completed steps.
3. Resume from the recorded step number.
4. If `current-task.md` is empty or unclear, re-read `project-config.md` and re-state success criteria before acting.
