---
description: Implement a Flutter Clean Architecture feature with project discovery, minimal diff, and verification.
---

When the user runs `/flutter-feature <request>`, implement the request using these steps:

1. Apply `.agents/rules/10-flutter-google-expert.md`.
2. Use the `flutter-feature-clean-architecture` skill.
3. Inspect the existing project structure and similar feature patterns before editing.
4. Identify affected layers: data, domain, ui/presentation, DI, routes, tests.
5. Make the smallest project-consistent changes.
6. Run code generation if Freezed/json/injectable annotations changed.
7. Add or update focused tests when logic or user-facing behavior changed.
8. Run the narrowest relevant verification first, then broader checks when feasible.
9. Summarize changed files, verification results, and any remaining risks.
