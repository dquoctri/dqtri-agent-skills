#!/usr/bin/env sh
set -eu

project=.
max_files=${MAX_CHANGED_FILES:-10}
status=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --max-files)
      shift
      max_files=${1:?missing value for --max-files}
      ;;
    --max-files=*)
      max_files=${1#--max-files=}
      ;;
    *)
      project=$1
      ;;
  esac
  shift
done

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

tmp_files=$(mktemp)
tmp_protected=$(mktemp)
trap 'rm -f "$tmp_files" "$tmp_protected"' EXIT HUP INT TERM

if ! git -C "$project" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  fail "not a git worktree: $project"
  exit "$status"
fi

git -C "$project" status --porcelain | sed 's/^...//' | sed 's/.* -> //' | sort -u > "$tmp_files"

printf 'dqtri-agent-skills diff scope check\n'
printf 'Project: %s\n\n' "$project"

changed_count=$(grep -c . "$tmp_files" || true)

if [ "$changed_count" -eq 0 ]; then
  pass 'no changed files'
  exit 0
fi

printf 'Changed files: %s\n' "$changed_count"

if [ "$changed_count" -le "$max_files" ]; then
  pass "changed file count is within limit ($max_files)"
else
  warn "changed file count is high: $changed_count files; expected max was $max_files"
fi

cat > "$tmp_protected" <<'EOF'
.env
.env.*
secrets/
private/
*.pem
*.key
EOF

config="$project/ai-memory/project-config.md"
if [ -f "$config" ]; then
  sed -n '/^## Protected Paths/,/^## /p' "$config" |
    grep '^- ' |
    sed 's/^- //' >> "$tmp_protected" || true
fi

while IFS= read -r file; do
  [ -n "$file" ] || continue

  case "$file" in
    .env|.env.*|*/.env|*/.env.*|secrets/*|private/*|*.pem|*.key)
      fail "protected or secret-like file changed: $file"
      ;;
    package-lock.json|pnpm-lock.yaml|yarn.lock|poetry.lock|Cargo.lock|Gemfile.lock|composer.lock)
      warn "lockfile changed: $file"
      ;;
    dist/*|build/*|coverage/*|.next/*|node_modules/*)
      warn "generated or build output changed: $file"
      ;;
  esac

  while IFS= read -r protected; do
    [ -n "$protected" ] || continue
    protected=${protected%/}
    case "$file" in
      $protected|$protected/*)
        fail "project protected path changed: $file"
        ;;
    esac
  done < "$tmp_protected"
done < "$tmp_files"

large_rewrites=$(git -C "$project" diff --ignore-cr-at-eol --numstat 2>/dev/null |
  awk '{ total=$1+$2; if ($1 != "-" && $2 != "-" && total > 400) print $3 " (" total " changed lines)" }' || true)

if [ -n "$large_rewrites" ]; then
  printf '%s\n' "$large_rewrites" | while IFS= read -r line; do
    warn "large rewrite candidate: $line"
  done
fi

if git -C "$project" diff --ignore-cr-at-eol -U0 2>/dev/null |
  grep -E '^\+.*(SECRET|TOKEN|PASSWORD|PRIVATE KEY|BEGIN RSA|api[_-]?key|apikey)' >/dev/null
then
  fail 'diff appears to add secret-like text'
fi

if [ "$status" -eq 0 ]; then
  printf '\nPASS: diff scope check completed\n'
else
  printf '\nFAIL: diff scope check found blocking issues\n' >&2
fi

exit "$status"
