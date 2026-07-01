---
description: Reproduce and fix Flutter analyze, test, build, runtime, GetX, DI, or codegen failures.
---

When the user runs `/flutter-debug <failure or request>`, use the `flutter-bugfix-debug` skill:

1. Capture the exact failure.
2. Reproduce with the narrowest command.
3. Inspect relevant files and similar working code.
4. Fix the root cause with a minimal diff.
5. Add a regression test when feasible.
6. Rerun the failing command first.
7. Report the cause, fix, and verification.
