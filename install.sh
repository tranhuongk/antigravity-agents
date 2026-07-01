#!/usr/bin/env bash
set -euo pipefail

repo_url="${ANTIGRAVITY_AGENTS_REPO:-https://github.com/tranhuongk/antigravity-agents.git}"
target="${1:-$PWD}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install antigravity-agents." >&2
  exit 69
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

git clone --quiet --depth 1 "$repo_url" "$tmp_dir"
"$tmp_dir/install_to_project.sh" "$target"
