#!/usr/bin/env sh
set -eu

status=0
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
home_root=$(CDPATH= cd "$script_dir/.." && pwd)
expected_root=$HOME/dqtri-agent-skills

pass() {
  printf 'PASS %s\n' "$1"
}

fail() {
  printf 'FAIL %s\n' "$1"
  status=1
}

check_dir_abs() {
  path=$1
  label=$2

  if [ -d "$path" ]; then
    pass "$label"
  else
    fail "$label missing: $path"
  fi
}

check_file() {
  rel=$1

  if [ -f "$home_root/$rel" ]; then
    pass "$rel"
  else
    fail "$rel missing"
  fi
}

check_dir() {
  rel=$1

  if [ -d "$home_root/$rel" ]; then
    pass "$rel/"
  else
    fail "$rel/ missing"
  fi
}

printf 'dqtri-agent-skills doctor\n'
printf 'Root: %s\n' "$home_root"
printf 'Expected direct-reference path: ~/dqtri-agent-skills\n\n'

if [ -d "$expected_root" ]; then
  pass '~/dqtri-agent-skills exists'
elif [ "$home_root" != "$expected_root" ]; then
  pass 'dqtri-agent-skills root exists at script location'
  printf 'NOTE ~/dqtri-agent-skills was not found at %s\n' "$expected_root"
  printf 'NOTE script is running from %s\n' "$home_root"
  printf '\n'
else
  fail "~/dqtri-agent-skills missing: $expected_root"
fi

if [ -d "$home_root" ]; then
  check_dir core
  check_dir core/rules
  check_dir core/templates
  check_dir skills
  check_dir scripts
  check_dir checks
  check_dir schemas
  check_dir memory
  check_dir memory/projects

  check_file core/rules/coding.md
  check_file core/rules/workflow.md
  check_file core/rules/memory.md
  check_file core/rules/safety.md
  check_file core/rules/verification.md
  check_file core/templates/AGENTS.md
  check_file core/templates/CLAUDE.md
  check_file core/templates/project-config.md

  check_file skills/debugging/SKILL.md
  check_file skills/refactor/SKILL.md
  check_file skills/testing/SKILL.md
  check_file skills/code-review/SKILL.md
  check_file skills/feature-implementation/SKILL.md
  check_file skills/architecture/SKILL.md
  check_file skills/spec-design/SKILL.md
  check_file skills/planning/SKILL.md
  check_file skills/api-design/SKILL.md
  check_file skills/security-review/SKILL.md
  check_file skills/performance-review/SKILL.md
  check_file skills/deployment/SKILL.md
  check_file skills/release-verification/SKILL.md

  check_file scripts/new-project-memory.sh
  check_file scripts/doctor.sh
  check_file scripts/update-upstream.sh
  check_file scripts/verify-project-integration.sh
  check_file scripts/check-diff-scope.sh
  check_file scripts/check-memory-hygiene.sh
  check_file scripts/collect-project-lessons.sh
  check_file scripts/propose-skill-update.sh
  check_file checks/required-files.txt
  check_file checks/required-agent-instructions.txt
  check_file schemas/project-config.schema.md
  check_file schemas/memory.schema.md
  check_file schemas/skill-proposal.schema.md
  check_file upstream/README.md
fi

if [ "$status" -eq 0 ]; then
  printf '\nPASS dqtri-agent-skills is ready. No install or symlink step is required.\n'
else
  printf '\nFAIL dqtri-agent-skills is incomplete. Check the missing paths above.\n' >&2
fi

exit "$status"
