---
name: codex-debug-fix
description: Use this skill when debugging failing tests, build errors, runtime exceptions, regressions, flaky behavior, CI failures, performance issues, or broken commands in any project.
---

# Codex Debug Fix

## Goal

Reproduce, isolate, fix, and verify the root cause with the smallest safe change.

## Workflow

1. Capture the exact failure:
   - command
   - error text
   - stack trace
   - environment assumptions
2. Reproduce with the narrowest command available.
3. Search for the failing symbol, file, route, test name, or error message.
4. Read surrounding code and a similar working path.
5. Form a concrete hypothesis before editing.
6. Fix the root cause, not only the symptom.
7. Add or update a regression test when feasible.
8. Rerun the failing command.
9. Run broader checks if the fix touches shared behavior.

## Debug Heuristics

- Check recent diffs, generated files, dependency versions, environment variables, config files, and test setup.
- For async failures, verify lifecycle, cancellation, timing, and awaited operations.
- For data failures, verify schema, serialization, nullability, migrations, and boundary validation.
- For UI failures, verify state ownership, rendering scope, layout constraints, and accessibility states.

## Do Not

- Do not skip or weaken tests to hide failures.
- Do not add broad catch-all logic that hides the real error.
- Do not rewrite unrelated code while debugging.
- Do not leave the failing command untried unless the environment prevents it.
