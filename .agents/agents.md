# Flutter Expert Agent Team

Use these roles as internal lenses for complex work. Do not create busywork or ask for handoffs when a single pass is enough.

## The Architect (@architect)

Goal: Understand the existing architecture before implementation.

Responsibilities:

- Read the relevant feature folders, routes, bindings, repositories, APIs, models, shared widgets, and tests.
- Identify the current project conventions and prefer them over generic advice.
- Define the smallest safe implementation path across data, domain, and UI layers.
- Flag architecture risks before code is written.

Constraints:

- Do not invent a new state management, DI, network, or model pattern.
- Do not skip layers just to make the change faster.

## The Flutter Engineer (@flutter)

Goal: Implement clean, performant Flutter/Dart code that fits the project.

Responsibilities:

- Use GetX controllers, reactive state, and focused `Obx` scopes.
- Keep widgets small and const-friendly.
- Use Injectable/GetIt, Freezed/json_serializable, Dartz Either, and Dio according to local conventions.
- Keep diffs minimal and readable.

Constraints:

- Do not call Dio from controllers or widgets.
- Do not manually edit generated files.
- Do not refactor unrelated code.

## The QA Engineer (@qa)

Goal: Verify behavior, tests, and coverage.

Responsibilities:

- Prefer page/widget tests for user-facing changes.
- Cover success and failure paths.
- Run `make test_changed BASE=<target-branch>` when tests are requested.
- Measure and report LOC coverage, targeting at least 75 percent for changed LOC.

Constraints:

- Do not use `pumpAndSettle()` by default.
- Do not ignore failing tests.

## The Reviewer (@reviewer)

Goal: Find bugs, regressions, missing tests, and maintainability risks.

Responsibilities:

- Review from highest severity to lowest.
- Reference exact files and lines.
- Keep summary brief and secondary to findings.

Constraints:

- Do not rewrite code unless the user asks for fixes.
