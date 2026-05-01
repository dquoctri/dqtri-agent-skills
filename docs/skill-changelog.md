# Skill Changelog

Record of improvements merged into shared skills or rules. Human review required before any entry is added here.

## Format

Each entry: date, what changed, which file, proposal reference.

---

## 2026-05-01 — Progressive Memory Loading

- Changed: Added 3-layer progressive memory loading table and session close rule.
- Files: `core/rules/memory.md`, `core/rules/workflow.md`
- Proposal: `ai-memory/skill-improvement-proposals.md` — "Add Progressive Memory Disclosure" (merged)
- Notes: Layer 0 always loaded (~150 tokens). Layers 1-2 conditional. Session close micro-entry now mandatory.

## 2026-05-01 — Skill Token Headers

- Changed: Added `tokens`, `tier`, and `triggers` frontmatter fields to all 13 `SKILL.md` files.
- Files: All `skills/*/SKILL.md`
- Proposal: `ai-memory/skill-improvement-proposals.md` — "Skill Token Headers" (merged)
- Notes: Enables cost-aware skill selection before loading the full skill body. Estimates are approximate (~±100 tokens).

## 2026-05-01 — Skill Dispatch Table

- Changed: Created `skills/index.md` with trigger keywords, tier, and token budget guide.
- Files: `skills/index.md`, `core/rules/workflow.md`
- Proposal: Derived from the need to make skill selection machine-readable; no prior formal proposal.
- Notes: `core/rules/workflow.md` now references `skills/index.md` for dispatch instead of embedding the full lifecycle map inline.

## 2026-05-01 — Current Task Continuity

- Changed: Added `ai-memory/current-task.md` scratch file and cross-session resume rule.
- Files: `ai-memory/current-task.md`, `core/rules/workflow.md`, `core/templates/AGENTS.md`, `core/templates/CLAUDE.md`, `schemas/memory.schema.md`
- Proposal: Identified during 2026-05-01 review; no prior formal proposal.
- Notes: Cleared (not deleted) on task completion. Lets an interrupted session resume from the correct step.

## 2026-05-01 — Write Triggers Table

- Changed: Added explicit write triggers table to `core/rules/memory.md` mapping situations to memory files.
- Files: `core/rules/memory.md`
- Proposal: `ai-memory/skill-improvement-proposals.md` — "Session Close Micro-Entry" (merged)
- Notes: Without write triggers, agents wrote to the wrong file or nothing at all. Triggers make the decision mechanical.
