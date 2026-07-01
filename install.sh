#!/usr/bin/env bash
set -euo pipefail

repo_url="${ANTIGRAVITY_AGENTS_REPO:-https://github.com/tranhuongk/antigravity-agents.git}"
target="${1:-$PWD}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install antigravity-agents." >&2
  exit 69
fi

if [[ ! -d "$target" ]]; then
  echo "Target directory does not exist: $target" >&2
  exit 66
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

git clone --quiet --depth 1 "$repo_url" "$tmp_dir"

mkdir -p "$target/.agents"
cp -R "$tmp_dir/.agents/." "$target/.agents/"
cp "$tmp_dir/AGENTS.md" "$target/AGENTS.md"

echo "Installed Antigravity Codex-Style Agent Pack into:"
echo "  $target/.agents"
echo "  $target/AGENTS.md"
echo
echo "Restart the Antigravity workspace chat, then ask: What workspace rules and skills are available?"
