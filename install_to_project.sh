#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /absolute/path/to/project" >&2
  exit 64
fi

target="$1"

if [[ ! -d "$target" ]]; then
  echo "Target directory does not exist: $target" >&2
  exit 66
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$target/.agents"
rsync -a "$script_dir/.agents/" "$target/.agents/"
cp "$script_dir/AGENTS.md" "$target/AGENTS.md"

echo "Installed Antigravity Codex-Style Agent Pack into:"
echo "  $target/.agents"
echo "  $target/AGENTS.md"
echo
echo "Restart the Antigravity workspace chat, then ask: What workspace rules and skills are available?"
