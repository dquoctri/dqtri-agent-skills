# Awesome Codex Skills Review

Review date: 2026-04-30

Source: `upstream/agent-skills/awesome-codex-skills`

## Install Steps

Do not install the whole repository. It contains 880 `SKILL.md` files, including 833 generated Composio app automation skills. Install only skills you expect to use.

### Option A: Install From GitHub

Use the built-in Codex skill installer:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" --repo ComposioHQ/awesome-codex-skills --path webapp-testing
```

Install multiple selected skills by adding more `--path` values:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" --repo ComposioHQ/awesome-codex-skills --path gh-fix-ci --path webapp-testing --path paperjsx
```

Restart Codex after installing or updating skills.

### Option B: Install From The Local Clone

For a local review copy, copy a specific skill folder into `$CODEX_HOME/skills`:

```powershell
$dest = if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME "skills" } else { Join-Path $env:USERPROFILE ".codex\skills" }
New-Item -ItemType Directory -Force -Path $dest
Copy-Item -Recurse -Path "upstream\agent-skills\awesome-codex-skills\webapp-testing" -Destination $dest
```

If the destination folder already exists, inspect it before replacing it. Restart Codex so metadata is reloaded.

## What Is Worth Installing

- `webapp-testing`: Good practical Playwright workflow with helper scripts and examples.
- `gh-fix-ci`: Useful if the team regularly debugs GitHub Actions through `gh`.
- `gh-address-comments`: Useful if the team wants Codex to handle PR review comments.
- `paperjsx`: Useful only if document generation is a recurring task.
- `mcp-builder`: Valuable reference material for MCP server design, but large; load only when actively building MCP servers.
- `notion-*`: Useful only when Notion MCP is part of the workflow.
- `connect` and generated `composio-skills/*`: Useful only if adopting Composio. Keep these separate from core SDLC lifecycle skills.

Avoid installing `create-plan`, `skill-creator`, and `skill-installer` unless needed for comparison; this environment already has overlapping planning and system skill tooling.

## Lessons For dqtri-agent-skills

1. Keep trigger metadata precise. Upstream skills rely heavily on `name`, `description`, and optional `metadata.short-description`; the description clearly states when the skill should trigger.
2. Use progressive disclosure. Larger skills keep `SKILL.md` focused and put detailed guides in `reference/`, examples in `examples/`, executable helpers in `scripts/`, and reusable files in asset-like folders.
3. Treat scripts as black boxes first. `webapp-testing` explicitly tells agents to run helper scripts with `--help` before reading source, which saves context and avoids needless code ingestion.
4. Integration skills need setup and failure paths. Strong examples include prerequisites, auth checks, discovery commands, dry-run/schema inspection, troubleshooting, and safe stopping points.
5. Separate lifecycle skills from tool/vendor skills. The current lifecycle set is clean; app-specific automation should be optional add-ons, not part of the default core.
6. Add examples/evaluations for complex skills. The Notion and MCP skills use `examples/`, `reference/`, and `evaluations/` to make workflows testable and easier to improve.
7. Keep generated catalogs out of default context. The Composio folder is broad but mostly generated; useful for optional integrations, not for the base skill loop.

## Follow-up Candidates

- Add a dqtri-agent-skills convention for optional `scripts/`, `references/`, `examples/`, and `assets/` inside skills.
- Add a rule that helper scripts should expose `--help` and be invoked before their source is read.
- Create optional integration skills separately from lifecycle skills, starting with GitHub CI triage or web app testing.
- Add a lightweight skill quality checklist covering trigger clarity, setup, verification, troubleshooting, and memory guidance.
