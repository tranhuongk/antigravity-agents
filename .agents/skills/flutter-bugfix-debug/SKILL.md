---
name: flutter-bugfix-debug
description: Use this skill when debugging Flutter analyze failures, failing tests, build failures, runtime exceptions, GetX state bugs, Dio/repository failures, navigation/binding issues, or UI regressions.
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
- Controller not registered in binding.
- GetIt registration missing or duplicated in tests.
- `Rx` list mutated directly instead of `assignAll`, `add`, `remove`, or `refresh` as appropriate.
- `Obx` reading no reactive values or too many reactive values.
- Navigation argument type mismatch.
- Repository returning wrong `Left`/`Right` mapping.
- Widget test stuck because of `pumpAndSettle()`.
- Theme or localization dependency missing from test wrapper.

## Do Not

- Do not mask failures with skipped tests.
- Do not add broad try/catch blocks that hide the real error.
- Do not change architecture to fix one symptom.
- Do not rewrite unrelated code.
