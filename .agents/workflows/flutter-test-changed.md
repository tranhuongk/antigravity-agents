---
description: Write or update Flutter tests, run make test_changed, and report changed LOC coverage.
---

When the user runs `/flutter-test-changed <request>`, use the `flutter-test-coverage` skill:

1. Read existing test patterns and helpers.
2. Prefer full page/widget tests.
3. Cover success and failure paths.
4. Run `make test_changed BASE=<target-branch>`.
5. Measure changed LOC coverage.
6. If changed LOC coverage is below 75 percent, add tests and rerun.
7. Final response must include:
   - test files changed
   - command results
   - final changed LOC coverage percentage
   - any lines or cases that remain uncovered
