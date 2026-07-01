---
name: codex-git-workflow
description: Use this skill when the user asks to inspect status, commit, push, create branches, write commit messages, prepare changelogs, tag releases, or manage Git safely.
---

# Codex Git Workflow

## Goal

Keep Git operations safe, clean, and intentional.

## Workflow

1. Inspect `git status --short`.
2. Inspect relevant diffs before staging.
3. Separate your changes from unrelated user changes.
4. Stage only files that belong to the requested change.
5. Use the project's commit convention. If none exists, use Conventional Commits:
   - `feat:`
   - `fix:`
   - `docs:`
   - `test:`
   - `refactor:`
   - `chore:`
6. Run requested or relevant verification before committing when feasible.
7. Push only when the user asked for it or the workflow clearly requires it.

## Safety Rules

- Never run destructive commands such as `git reset --hard`, `git clean`, or checkout-overwrite unless explicitly requested.
- Never commit secrets, tokens, credentials, private keys, or local machine paths.
- Never rewrite history unless explicitly requested and understood.
- Do not include unrelated modified files.

## Final Report

Report:

- branch
- commit hash
- files included
- verification run
- remote URL when pushed
