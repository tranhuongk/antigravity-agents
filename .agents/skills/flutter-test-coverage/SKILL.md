---
name: flutter-test-coverage
description: Use this skill when the user asks to write Flutter tests, update tests, run changed tests, prove coverage, improve coverage, or satisfy the project rule requiring make test_changed BASE=<target-branch>.
---

# Flutter Test Coverage

## Goal

Write high-value Flutter tests and report changed LOC coverage. Prioritize realistic page/widget behavior over testing implementation details.

## Required Workflow

1. Read existing test helpers, mocks, fixtures, DI setup, state-management setup, and similar tests.
2. Prefer full page/widget tests for user-facing behavior.
3. Add controller/business logic tests when state transitions, mapping, or error handling are significant.
4. Add repository tests when API mapping or error translation changed.
5. Cover both success and failure paths.
6. Run:

   ```sh
   make test_changed BASE=<target-branch>
   ```

7. Measure changed LOC coverage.
8. If changed LOC coverage is below 75 percent, inspect missing lines, add tests, and rerun.
9. Report the final LOC coverage percentage in the final answer.

## Test Conventions

- Use `pump()` instead of `pumpAndSettle()` unless there is a proven reason.
- For dialogs and bottom sheets, pump several short frames.
- Initialize and reset state-management containers using project conventions.
- Reset global state in teardown.
- Unregister GetIt dependencies before registering mocks.
- Use project mock libraries and fixture patterns.
- Use `tester.runAsync()` for real async operations in widget tests.
- Avoid testing private implementation details.

## Coverage Measurement Hints

Prefer the project-provided coverage command when present. If the project has no helper, common options are:

```sh
flutter test --coverage
lcov --summary coverage/lcov.info
```

If `lcov` is unavailable, parse `coverage/lcov.info` directly and compute line coverage from `LF` and `LH` records. For changed LOC coverage, compare changed Dart lines against covered lines in `coverage/lcov.info`.

## Do Not

- Do not stop after writing tests without running them unless the environment prevents execution.
- Do not ignore failing tests.
- Do not report "covered" without a number.
- Do not use broad golden tests unless the project already uses them and they are needed.
