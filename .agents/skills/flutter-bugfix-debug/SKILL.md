---
name: flutter-bugfix-debug
description: Use this skill when debugging Flutter analyze failures, failing tests, build failures, runtime exceptions, state-management bugs, Dio/repository failures, navigation/DI issues, or UI regressions.
---

# Flutter Bugfix Debug

## Goal

Reproduce, isolate, and fix Flutter/Dart failures with minimal, project-consistent changes.

## Workflow

1. Capture the exact failure:
   - command
   - error text
   - stack trace
   - affected test or screen
2. Search for the relevant code with `rg`.
3. Read surrounding implementation and similar working patterns.
4. Form a concrete hypothesis before editing.
5. Fix the root cause with the smallest diff.
6. Add or update a regression test when feasible.
7. Rerun the failing command first.
8. Run broader checks if the fix touched shared behavior.

## Common Flutter Checks

- Missing or stale generated files after Freezed/json/injectable changes.
- State holder, notifier, controller, or service not registered in DI/routing.
- GetIt registration missing or duplicated in tests.
- Collection state mutated in a way the state-management layer cannot observe.
- State listener/builder is too broad, too narrow, or not subscribed to the expected state.
- Navigation argument type mismatch.
- Repository returning wrong `Left`/`Right` mapping.
- Widget test stuck because of `pumpAndSettle()`.
- Theme or localization dependency missing from test wrapper.

## Do Not

- Do not mask failures with skipped tests.
- Do not add broad try/catch blocks that hide the real error.
- Do not change architecture to fix one symptom.
- Do not rewrite unrelated code.
