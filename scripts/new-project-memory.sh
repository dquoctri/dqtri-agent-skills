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

create_file "$memory_dir/project-profile.md" '# Project Profile

Durable project facts for agents. Keep this current when setup or conventions change.

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

create_file "$memory_dir/skill-improvements.md" '# Skill Improvements

Proposed reusable improvements for shared coding-agent skills.

These are proposals only. They are not automatically promoted to shared skills.

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
