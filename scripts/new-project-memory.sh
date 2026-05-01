#!/usr/bin/env sh
set -eu

memory_dir="./ai-memory"

create_file() {
  path=$1
  content=$2

  if [ -e "$path" ]; then
    printf 'keep %s\n' "$path"
    return 0
  fi

  printf '%s\n' "$content" > "$path"
  printf 'new  %s\n' "$path"
}

mkdir -p "$memory_dir"

create_file "$memory_dir/facts.md" '# Project Facts

Durable project facts for agents. Keep this current when setup, commands, architecture, or conventions change. Do not store content marked with <private> tags.

## Stack

- Languages:
- Frameworks:
- Runtime:
- Database:
- External services:

## Package Manager

- Package manager:
- Install command:

## Commands

- Test command:
- Build command:
- Lint command:
- Format command:
- Deploy command:
- Smoke/verify command:

## Architecture

- Application shape:
- Main entry points:
- Important modules:
- Data flow:
- Deployment/runtime notes:

## Important Conventions

- Code style:
- Naming:
- Error handling:
- Testing:
- Configuration:
- Generated files:'

create_file "$memory_dir/project-profile.md" '# Project Profile

Durable project facts for agents. Keep this current when setup or conventions change. Do not store content marked with <private> tags.

## Stack

- Languages:
- Frameworks:
- Runtime:
- Database:
- External services:

## Package Manager

- Package manager:
- Install command:

## Commands

- Test command:
- Build command:
- Lint command:
- Format command:
- Deploy command:
- Smoke/verify command:

## Architecture

- Application shape:
- Main entry points:
- Important modules:
- Data flow:
- Deployment/runtime notes:

## Important Conventions

- Code style:
- Naming:
- Error handling:
- Testing:
- Configuration:
- Generated files:'

create_file "$memory_dir/summary.md" '# Project Summary

Concise project overview for future agents.

## Overview

- Purpose:
- Primary users:
- Main workflows:
- Important constraints:

## Current State

- Active area of work:
- Known limitations:
- Useful context:'

create_file "$memory_dir/decisions.md" '# Technical Decisions

Durable technical decisions that still apply. Prefer short entries with date, decision, reason, and consequences.

## Decisions

### YYYY-MM-DD - Decision Title

- Decision:
- Reason:
- Consequences:
- Related files:'

create_file "$memory_dir/patterns.md" '# Implementation Patterns

Recurring implementation patterns agents should follow in this project.

## Patterns

### Pattern Title

- Use when:
- Approach:
- Example files:
- Avoid:

## Notes

- Add only patterns that recur across the project.
- Prefer references to existing files over long copied examples.'

create_file "$memory_dir/mistakes.md" '# Mistakes To Avoid

Durable lessons from previous work. Do not store temporary debugging logs or raw command output.

## Mistakes

### YYYY-MM-DD - Mistake Title

- What happened:
- Why it mattered:
- How to avoid repeating it:
- Related files or commands:

## Notes

- Keep entries factual and actionable.
- Remove stale entries when they no longer apply.'

create_file "$memory_dir/project-config.md" '# Project Config

Project-local commands and boundaries for coding agents. Keep this file current when commands, protected paths, or workflow rules change.

## Verification Commands

- Test:
- Typecheck:
- Lint:
- Build:
- Format:
- Smoke/verify:

## Important Paths

- Source:
- Tests:
- Docs:
- Config:
- Generated:

## Protected Paths

- .env
- .env.*
- production.yml
- secrets/

## Commit Rule

Do not commit unless relevant verification commands pass, the diff was reviewed, and unrelated files were not changed.'

create_file "$memory_dir/project-experience-log.md" '# Project Experience Log

Raw observations from real agent work. Use this to capture experience before turning it into reusable skill proposals.

## YYYY-MM-DD - Task Title

Task:
- TODO

What worked:
- TODO

What failed:
- TODO

Suggested improvement:
- TODO

## Rules

- Keep observations concise and factual.
- Do not store secrets, raw logs, chat transcripts, or content inside <private> tags.
- Promote repeated lessons to skill-improvement-proposals.md only after review.'

create_file "$memory_dir/skill-improvement-proposals.md" '# Skill Improvement Proposals

Reviewed candidate improvements for shared coding-agent skills.

These are proposals only. They are not automatically promoted to shared skills.

## Proposal: Improvement Title

Date:
- YYYY-MM-DD

Observed in project:
- TODO

Suggested skill:
- TODO

Suggested rule:
- TODO

Promotion checklist:
- Happened more than once:
- Helps multiple projects:
- Rule is simple:
- Reduces mistakes without too much context:
- Can be verified:

Status:
- proposed

## Rules

- Add only reusable improvements, not project-specific context.
- Do not edit shared skills from here automatically.
- Promote changes to shared skills only when explicitly requested.'

create_file "$memory_dir/skill-improvements.md" '# Skill Improvements

Proposed reusable improvements for shared coding-agent skills.

Compatibility file for older projects. Prefer skill-improvement-proposals.md for new entries.

## Proposed Improvements

### YYYY-MM-DD - Improvement Title

- Applies to skill:
- Proposal:
- Why it may be reusable:
- Evidence from this project:
- Review notes:

## Rules

- Add only reusable improvements, not project-specific context.
- Do not edit shared skills from here automatically.
- Promote changes to shared skills only when explicitly requested.'

printf '\nCreated or verified project memory at %s\n' "$memory_dir"
printf 'No symlinks were created. No global config was modified.\n'
