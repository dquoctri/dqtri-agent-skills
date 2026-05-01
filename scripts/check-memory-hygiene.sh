#!/usr/bin/env sh
set -eu

project=${1:-.}
memory_dir="$project/ai-memory"
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

printf 'dqtri-agent-skills memory hygiene check\n'
printf 'Project: %s\n\n' "$project"

if [ ! -d "$memory_dir" ]; then
  fail 'ai-memory/ missing'
  exit "$status"
fi

pass 'ai-memory/ found'

for file in facts.md decisions.md patterns.md mistakes.md project-config.md project-experience-log.md skill-improvement-proposals.md
do
  if [ -f "$memory_dir/$file" ]; then
    pass "$file found"
  else
    warn "$file missing"
  fi
done

if grep -RInE '<private>.+</private>' "$memory_dir" 2>/dev/null |
  grep -v '<private>\.\.\.</private>' >/dev/null
then
  fail 'memory contains inline <private> tagged content'
fi

if grep -RInE '(BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|SECRET=|TOKEN=|PASSWORD=|api[_-]?key[=:])' "$memory_dir" >/dev/null 2>&1; then
  fail 'memory contains secret-like text'
fi

if grep -RInE '^(Traceback|Exception in thread|npm ERR!|[[:space:]]*at [A-Za-z0-9_.<>]+\(.*:[0-9]+)' "$memory_dir" >/dev/null 2>&1; then
  warn 'memory may contain raw stack traces or logs'
fi

if grep -RInE '^(User:|Assistant:|Human:|AI:)' "$memory_dir" >/dev/null 2>&1; then
  warn 'memory may contain chat transcript text'
fi

if [ "$status" -eq 0 ]; then
  printf '\nPASS: memory hygiene check completed\n'
else
  printf '\nFAIL: memory hygiene check found blocking issues\n' >&2
fi

exit "$status"
