#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
root_dir=$(CDPATH= cd "$script_dir/.." && pwd)
upstream_dir="$root_dir/upstream"
agent_skills_dir="$upstream_dir/agent-skills"
design_dir="$upstream_dir/design"

mkdir -p "$agent_skills_dir" "$design_dir"

update_git_repo() {
  name=$1
  repo_url=$2
  repo_dir=$3

  if [ ! -d "$repo_dir/.git" ]; then
    parent_dir=$(dirname "$repo_dir")
    mkdir -p "$parent_dir"
    printf 'CLONE %s\n' "$name"
    git clone "$repo_url" "$repo_dir"
    return 0
  fi

  if [ -n "$(git -C "$repo_dir" status --porcelain)" ]; then
    printf 'SKIP  %s has local changes: %s\n' "$name" "$repo_dir"
    return 0
  fi

  printf 'PULL  %s\n' "$name"
  git -C "$repo_dir" pull --ff-only
}

update_getdesign() {
  brand=$1

  printf 'GET   getdesign %s\n' "$brand"
  (
    cd "$design_dir"
    npx getdesign@latest add "$brand"
  )
}

update_git_repo \
  "addyosmani-agent-skills" \
  "https://github.com/addyosmani/agent-skills.git" \
  "$agent_skills_dir/addyosmani"

update_git_repo \
  "andrej-karpathy-skills" \
  "https://github.com/forrestchang/andrej-karpathy-skills.git" \
  "$agent_skills_dir/andrej-karpathy"

update_git_repo \
  "awesome-codex-skills" \
  "https://github.com/ComposioHQ/awesome-codex-skills.git" \
  "$agent_skills_dir/awesome-codex-skills"

update_git_repo \
  "claude-mem" \
  "https://github.com/thedotmack/claude-mem.git" \
  "$agent_skills_dir/claude-mem"

update_git_repo \
  "vercel-labs-agent-skills" \
  "https://github.com/vercel-labs/agent-skills.git" \
  "$agent_skills_dir/vercel-labs"

if [ "$#" -eq 0 ]; then
  set -- airtable
fi

for brand in "$@"; do
  update_getdesign "$brand"
done

printf '\nUpstream update complete. Upstream payloads are ignored by project Git.\n'
