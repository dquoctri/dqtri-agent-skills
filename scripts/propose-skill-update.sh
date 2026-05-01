#!/usr/bin/env sh
set -eu

project=.
append=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --append)
      append=1
      ;;
    *)
      project=$1
      ;;
  esac
  shift
done

log="$project/ai-memory/project-experience-log.md"
proposals="$project/ai-memory/skill-improvement-proposals.md"
today=$(date +%Y-%m-%d)

proposal=$(cat <<EOF
## Proposal: Review repeated agent workflow issue

Date:
- $today

Observed in project:
- Summarize repeated evidence from ai-memory/project-experience-log.md.

Suggested skill:
- Identify the smallest affected skill, such as skills/refactor/SKILL.md or skills/testing/SKILL.md.

Suggested rule:
- Add only a reusable rule that would help multiple projects.

Promotion checklist:
- Happened more than once:
- Helps multiple projects:
- Rule is simple:
- Reduces mistakes without too much context:
- Can be verified:

Status:
- proposed
EOF
)

printf 'dqtri-agent-skills skill update proposal helper\n'
printf 'Project: %s\n\n' "$project"

if [ ! -f "$log" ]; then
  printf 'WARN: project experience log not found: %s\n\n' "$log"
fi

if [ "$append" -eq 1 ]; then
  mkdir -p "$(dirname "$proposals")"
  {
    printf '\n'
    printf '%s\n' "$proposal"
  } >> "$proposals"
  printf 'PASS: appended proposal template to %s\n' "$proposals"
else
  printf '%s\n' "$proposal"
  printf '\nRun with --append to add this template to %s\n' "$proposals"
fi

