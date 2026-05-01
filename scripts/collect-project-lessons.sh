#!/usr/bin/env sh
set -eu

project=${1:-.}
log="$project/ai-memory/project-experience-log.md"
proposals="$project/ai-memory/skill-improvement-proposals.md"

count_pattern() {
  pattern=$1
  file=$2

  if [ -f "$file" ]; then
    grep -Eic "$pattern" "$file" || true
  else
    printf '0\n'
  fi
}

printf 'dqtri-agent-skills project lesson scan\n'
printf 'Project: %s\n\n' "$project"

if [ ! -f "$log" ]; then
  printf 'WARN: project experience log not found: %s\n' "$log"
  exit 0
fi

typecheck_count=$(count_pattern 'typecheck|type check' "$log")
unrelated_count=$(count_pattern 'unrelated|too many files|scope' "$log")
memory_count=$(count_pattern 'memory|temporary notes|raw logs|chat transcript' "$log")
verification_count=$(count_pattern 'test|verification|lint|build|smoke' "$log")

found=0

printf 'Repeated issue candidates:\n'

if [ "$typecheck_count" -gt 1 ]; then
  printf '%s\n' "- Agent skipped or needed typecheck $typecheck_count times."
  found=1
fi

if [ "$unrelated_count" -gt 1 ]; then
  printf '%s\n' "- Scope or unrelated-file risk appeared $unrelated_count times."
  found=1
fi

if [ "$memory_count" -gt 1 ]; then
  printf '%s\n' "- Memory hygiene concerns appeared $memory_count times."
  found=1
fi

if [ "$verification_count" -gt 1 ]; then
  printf '%s\n' "- Verification process was mentioned $verification_count times."
  found=1
fi

if [ "$found" -eq 0 ]; then
  printf '%s\n' '- No repeated issue candidates found yet.'
fi

printf '\nSuggested next review targets:\n'
printf '%s\n' "- $proposals"
printf '%s\n' '- core/rules/verification.md'
printf '%s\n' '- skills/refactor/SKILL.md, skills/testing/SKILL.md, or the active task skill when repeated evidence supports it'
