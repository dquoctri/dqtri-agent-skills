# SDLC Skill Learning Notes

Review date: 2026-04-30

Primary sources reviewed:

- `upstream/agent-skills/addyosmani/skills/`
- `upstream/agent-skills/awesome-codex-skills/`

## Scope

Focus on software development lifecycle skills only. Ignore broad productivity, writing, document generation, and vendor automation skills unless they directly support SDLC execution.

## Most Useful Upstream SDLC Skills

### Spec and Planning

- `spec-driven-development`: Strongest idea is the gated flow: specify, plan, task, implement. Do not advance until the current phase is validated.
- `planning-and-task-breakdown` / `create-plan`: Useful for turning broad work into thin, ordered, verifiable actions.
- dqtri-agent-skills mapping: `spec-design`, `planning`.

What to learn:

- Require explicit assumptions when requirements are unclear.
- Turn vague requests into testable success criteria.
- Include commands, boundaries, test strategy, and open questions in specs.
- Make every task include acceptance criteria and verification.

### Implementation

- `incremental-implementation`: Best pattern is thin slices that leave the project buildable after each step.
- `source-driven-development`: Useful reminder to read existing code and tests before inventing patterns.
- dqtri-agent-skills mapping: `feature-implementation`, `refactor`, `architecture`.

What to learn:

- Prefer vertical slices for features.
- Split risky work first when uncertainty is high.
- Keep refactors separate from behavior changes.
- Use feature flags when incomplete work must merge.
- Make each increment rollback-friendly.

### Testing and Debugging

- `test-driven-development`: Strong patterns are red/green/refactor and the bug-fix "prove it" loop.
- `debugging-and-error-recovery`: Strongest pattern is stop-the-line: reproduce, localize, reduce, fix root cause, guard, verify.
- `webapp-testing`: Useful practical pattern for browser checks with helper scripts and Playwright.
- dqtri-agent-skills mapping: `testing`, `debugging`, `release-verification`.

What to learn:

- For bugs, write or identify a reproduction before fixing when practical.
- Debug root causes, not symptoms.
- Add regression tests for fixed failures.
- Keep browser/runtime verification separate from unit coverage.
- Helper scripts should expose `--help` and be treated as black boxes before reading their source.

### Review and Quality

- `code-review-and-quality`: Useful five-axis review model: correctness, readability, architecture, security, performance.
- `security-and-hardening` and `performance-optimization`: Useful as specialized deeper checks, not default context.
- dqtri-agent-skills mapping: `code-review`, `security-review`, `performance-review`.

What to learn:

- Review tests first because they reveal intended behavior.
- Categorize findings by severity.
- Check verification evidence, not just code shape.
- Keep change sizes reviewable; split large changes.

### Migration, CI, Release

- `deprecation-and-migration`: Useful because SDLC should include removal and migration, not only building.
- `ci-cd-and-automation`: Useful quality gate model: lint, type check, unit tests, build, integration, e2e, security audit where relevant.
- `shipping-and-launch`, `deploy-pipeline`, `gh-fix-ci`: Useful for release and CI feedback loops.
- dqtri-agent-skills mapping: `deployment`, `release-verification`, possibly a future `migration` skill.

What to learn:

- Deprecate only when a replacement and migration path exist.
- Verify zero usage before removal.
- CI failures should feed back into debugging, not be bypassed.
- Release checks should map directly to acceptance criteria and risk.

## Recommended dqtri-agent-skills Changes

1. Add a dedicated `migration` or `deprecation-migration` skill if migrations/removals become frequent.
2. Strengthen `spec-design` with assumptions, boundaries, commands, success criteria, and approval gates.
3. Strengthen `feature-implementation` with explicit vertical/risk-first slicing and rollback-friendly increments.
4. Strengthen `testing` with the bug-fix prove-it loop and test-size decision guide.
5. Strengthen `debugging` with the stop-the-line sequence and reduce-to-minimal-repro step.
6. Strengthen `code-review` with the five-axis review model and severity labels.
7. Strengthen `deployment` and `release-verification` with CI quality gates and post-release evidence.

## Do Not Import Blindly

- Do not copy verbose upstream prose into dqtri-agent-skills skills.
- Do not install all upstream skills.
- Do not merge vendor-specific Composio/Notion/GitHub workflows into core lifecycle skills.
- Keep dqtri-agent-skills skills concise; move examples, references, and helper scripts into optional resource folders only when needed.
