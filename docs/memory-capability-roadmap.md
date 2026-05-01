# Memory Capability Roadmap

Review date: 2026-04-30

These are candidate memory-system capabilities for dqtri-agent-skills. They should not be described as shipped behavior until implemented and verified.

## Candidate Capabilities

### Persistent Memory

Context should survive across sessions through project-local memory files such as `./ai-memory/summary.md`, `decisions.md`, `patterns.md`, `mistakes.md`, and `skill-improvements.md`.

Current status: partially supported through explicit memory files and memory rules.

### Progressive Disclosure

Memory retrieval should be layered so agents load only the smallest useful context first, then expand when needed.

Candidate layers:

1. Project summary and profile.
2. Relevant decisions, patterns, and mistakes.
3. Task-specific file references or prior notes.
4. Full memory search results when direct files are insufficient.

Future enhancement: expose approximate token cost or file size before loading larger memory sections.

### Skill-Based Search

Add a `mem-search` skill for querying project history and local memory.

Candidate workflow:

- Search `./ai-memory/` first.
- Search shared `memory/projects/<project-name>/` if configured.
- Search docs and decision records only when memory files do not answer the question.
- Return concise results with source file references.

Current status: not implemented.

### Claude Desktop Skill

Consider a companion Claude Desktop skill for searching project memory from Claude Desktop conversations.

Current status: not implemented. Keep it optional and separate from core SDLC skills.

### Privacy Control

Support `<private>...</private>` tags as an explicit signal that content must not be stored in memory, skill suggestions, examples, or generated docs.

Current status: basic rule added to memory rules and templates; future `mem-search` should also suppress tagged content.

### Context Configuration

Allow projects to define what memory context is injected or read by default.

Candidate config:

```text
ai-memory/context.md
ai-memory/config.md
```

Possible controls:

- Which memory files are read at session start.
- Maximum memory lines or approximate token budget.
- Whether shared project memory is allowed.
- Whether `skill-improvements.md` is read automatically or only on skill-maintenance tasks.

Current status: not implemented.

### Automatic Operation

Agents should naturally read and update memory as part of the workflow when durable context exists.

Boundary: this should stay instruction-driven and explicit. Do not add a daemon, background service, hidden hook, or generated global config.

Current status: partially supported through templates and workflow rules.

## Design Constraints

- Keep project memory local by default.
- Do not store secrets, credentials, private keys, personal data, raw logs, or chat transcripts.
- Treat memory as context, not truth.
- Make any automatic behavior inspectable through project files.
- Prefer skill suggestions before changing shared skills.
- Do not turn this into an autonomous runtime or background memory service.

## Suggested Next Steps

1. Add `ai-memory/context.md` or `ai-memory/config.md` to the memory scaffold if the format is agreed.
2. Create a `mem-search` skill that uses `rg` to search project-local memory and returns cited results.
3. Add token/file-size visibility to the `mem-search` workflow before loading large results.
4. Ensure future memory tools suppress content inside `<private>...</private>` tags.
