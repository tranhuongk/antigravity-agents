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

rm -rf \
  "$target/.agents/skills/flutter-bugfix-debug" \
  "$target/.agents/skills/flutter-code-review" \
  "$target/.agents/skills/flutter-codegen-di" \
  "$target/.agents/skills/flutter-feature-clean-architecture" \
  "$target/.agents/skills/flutter-test-coverage" \
  "$target/.agents/workflows/flutter-debug.md" \
  "$target/.agents/workflows/flutter-feature.md" \
  "$target/.agents/workflows/flutter-review.md" \
  "$target/.agents/workflows/flutter-test-changed.md"

echo "Installed Antigravity Codex-Style Agent Pack into:"
echo "  $target/.agents"
echo "  $target/AGENTS.md"
echo

if [[ -f "$target/pubspec.yaml" && "${ANTIGRAVITY_AGENTS_SKIP_OFFICIAL_FLUTTER_SKILLS:-0}" != "1" ]]; then
  echo "Flutter project detected. Installing official Flutter and Dart Agent Skills..."
  if command -v npx >/dev/null 2>&1; then
    (
      cd "$target"
      npx --yes skills add flutter/skills --skill '*' --agent universal --yes
      npx --yes skills add dart-lang/skills --skill '*' --agent universal --yes
    ) || {
      echo "Warning: official Flutter/Dart skills install failed." >&2
      echo "Run manually from the project root:" >&2
      echo "  npx skills add flutter/skills --skill '*' --agent universal --yes" >&2
      echo "  npx skills add dart-lang/skills --skill '*' --agent universal --yes" >&2
    }
  else
    echo "npx was not found. Install Node.js, then run from the project root:"
    echo "  npx skills add flutter/skills --skill '*' --agent universal --yes"
    echo "  npx skills add dart-lang/skills --skill '*' --agent universal --yes"
    echo
  fi
fi

echo "Restart the Antigravity workspace chat, then ask: What workspace rules and skills are available?"
