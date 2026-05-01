# Memory Rules

dqtri-agent-skills memory is for durable project knowledge. It is optional and must stay local to a project or under the shared `memory/projects/<project-name>/` directory.

## Memory Hygiene

- Store only information that is likely to remain useful across future sessions.
- Keep entries concise, factual, and easy to validate.
- Date entries when timing matters.
- Prefer links or file references over copied logs.
- Remove or update stale memory when it becomes misleading.

## Store

- Project-specific architecture decisions that still apply.
- Non-obvious coding, testing, deployment, or review conventions.
- Important setup and verification commands.
- Durable constraints from integrations, environments, data models, or product behavior.
- Known risks or follow-up items that remain relevant after the current task.
- Raw but useful project experience in `project-experience-log.md`.
- Reusable skill improvement candidates in `skill-improvement-proposals.md`.

## Do Not Store

- Temporary debugging logs.
- Raw command output that is only useful for the current session.
- Stack traces, build logs, or test output unless summarized as a durable known issue.
- Secrets, tokens, credentials, private keys, or personal data.
- Content inside `<private>...</private>` tags.
- General programming advice that belongs in rules or skills.
- Chat transcripts or transient reasoning.

## Project-Specific vs Reusable Knowledge

- Project-specific knowledge belongs in project memory.
- Reusable coding guidance belongs in shared rules or skills, but must not be promoted automatically.
- Do not turn one project's context into a shared rule.
- If a reusable skill improvement seems useful, record it in `skill-improvement-proposals.md` first for later review.
- `skill-improvements.md` is a compatibility name for older projects.
- Only modify shared skills or rules when the user explicitly asks to change this skill system itself.
- For durable technical decisions, record the decision, reason, consequences, and alternatives considered when useful.

## Learning Loop

- One mistake becomes a memory note.
- Repeated mistakes become skill improvement proposals.
- Repeated skill gaps become shared skill updates after review.
- Repeated rule enforcement issues become explicit scripts or checks.
- Do not turn one project's unusual case into a global rule without evidence.

## Reading And Writing

- Read project-local memory before shared project memory when both exist.
- Treat memory as context, not truth. Current code, tests, and user instructions take precedence.
- Update memory only when useful and allowed by project instructions or explicit user request.
