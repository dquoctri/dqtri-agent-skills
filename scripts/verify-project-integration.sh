#!/usr/bin/env sh
set -eu

project=${1:-.}
status=0

pass() {
  printf 'PASS: %s\n' "$1"
}

warn() {
  printf 'WARN: %s\n' "$1"
}

fail() {
  printf 'FAIL: %s\n' "$1"
  status=1
}

has_pattern() {
  pattern=$1

  for file in \
    "$project/AGENTS.md" \
    "$project/CLAUDE.md" \
    "$project/ai-memory/project-config.md"
  do
    if [ -f "$file" ] && grep -Eiq "$pattern" "$file"; then
      return 0
    fi
  done

  return 1
}

has_declared_command() {
  label=$1
  config="$project/ai-memory/project-config.md"

  [ -f "$config" ] || return 1
  grep -Eiq "^- ${label}:[[:space:]]*[^[:space:]]" "$config"
}

printf 'dqtri-agent-skills project integration check\n'
printf 'Project: %s\n\n' "$project"

if [ ! -d "$project" ]; then
  fail "project directory does not exist: $project"
  exit "$status"
fi

if [ -f "$project/AGENTS.md" ]; then
  pass 'AGENTS.md found'
else
  fail 'AGENTS.md missing'
fi

if [ -f "$project/CLAUDE.md" ]; then
  pass 'CLAUDE.md found'
else
  warn 'CLAUDE.md not found; ok if Claude is not used for this project'
fi

if [ -d "$project/ai-memory" ]; then
  pass 'ai-memory/ found'
else
  fail 'ai-memory/ missing'
fi

for file in \
  facts.md \
  decisions.md \
  patterns.md \
  mistakes.md \
  project-config.md \
  project-experience-log.md \
  skill-improvement-proposals.md
do
  if [ -f "$project/ai-memory/$file" ]; then
    pass "ai-memory/$file found"
  else
    fail "ai-memory/$file missing"
  fi
done

if has_pattern 'dqtri-agent-skills'; then
  pass 'project references dqtri-agent-skills'
else
  fail 'project does not reference dqtri-agent-skills'
fi

if has_pattern 'ai-memory'; then
  pass 'project tells agent to use ai-memory'
else
  fail 'project does not mention ai-memory'
fi

if has_pattern 'load only relevant rules|relevant shared rules|load relevant shared rules|do not preload every rule'; then
  pass 'project tells agent to lazy-load rules'
else
  fail 'project does not tell agent to lazy-load relevant rules'
fi

if has_pattern 'at most 1-2 skills|no more than 1-2 skills|1-2 relevant skills|never load all skills'; then
  pass 'project limits skill loading'
else
  fail 'project does not limit skill loading to 1-2 relevant skills'
fi

if has_pattern 'unsafe|destructive|unrelated files|protected paths|do not revert'; then
  pass 'project includes unsafe-edit guardrails'
else
  warn 'no explicit unsafe-edit guardrails found'
fi

if has_pattern 'verification|test command|typecheck|lint|build'; then
  pass 'project defines or references verification'
else
  warn 'no verification instructions found'
fi

if has_pattern 'commit'; then
  pass 'project defines commit rules'
else
  warn 'no commit rule found'
fi

if has_declared_command Test; then
  pass 'test command declared'
else
  warn 'no test command declared'
fi

if has_declared_command Typecheck; then
  pass 'typecheck command declared'
else
  warn 'no typecheck command declared'
fi

if has_declared_command Lint; then
  pass 'lint command declared'
else
  warn 'no lint command declared'
fi

if [ "$status" -eq 0 ]; then
  printf '\nPASS: project integration is usable\n'
else
  printf '\nFAIL: project integration is incomplete\n' >&2
fi

exit "$status"

