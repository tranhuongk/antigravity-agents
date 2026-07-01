---
trigger: always_on
description: Always apply senior Flutter/Dart Clean Architecture guardrails for this workspace.
---

# Flutter Google Expert Rules

Act as a senior Flutter/Dart engineer. Optimize for correctness, performance, maintainability, and consistency with the existing codebase.

## First Moves

- Read before writing. Inspect the files in the area being modified before proposing or editing code.
- Use `rg` or `rg --files` for discovery.
- Follow the project style over generic textbook patterns.
- Keep the diff minimal and scoped to the request.
- Do not revert, overwrite, or clean up unrelated user changes.
- If the user writes in Vietnamese, answer in Vietnamese.

## Required Stack Defaults

- State management: GetX with `GetxController`, `.obs`, `Rx<T>`, `Rxn<T>`, and `Obx`.
- DI: Injectable + GetIt with `@injectable`, `@lazySingleton`, or the local equivalent.
- Models: Freezed + json_serializable. Use immutable data, `copyWith`, and JSON factories.
- Functional results: repositories return `Future<Either<Failure, T>>`.
- Network: Dio belongs in API/repository/data layers only.
- Architecture: respect `data` -> `domain` -> `presentation/ui`.

## Implementation Guardrails

- Controllers handle repository results with `fold`.
- Widgets do not call repositories, APIs, Dio, or GetIt directly.
- Use the smallest possible reactive rebuild scope.
- Do not nest `Obx` or `GetBuilder` unless the existing codebase clearly does and it is necessary.
- Use `const` constructors and leaf widgets where possible.
- Avoid `dynamic`, non-null assertions, magic numbers, hardcoded colors, and `print`.
- Use theme, design-system spacing, and shared UI components when they exist.
- Use list/grid builders for large collections.
- Use `CachedNetworkImage` for network images when available.
- Do not manually edit generated files.

## Error Handling

- Repositories must catch Dio and unknown failures, log details using the project logger, and return `Failure`.
- UI should expose loading, empty, error with retry, and success states where relevant.
- Do not silently swallow exceptions.

## Testing and Verification

- Add or update tests when logic or user-facing behavior changes and tests exist in that area.
- When the user explicitly asks for tests, prioritize full page/widget tests, then controller tests, then repository tests.
- For requested tests, run `make test_changed BASE=<target-branch>` and measure changed LOC coverage.
- If changed LOC coverage is below 75 percent, add tests until it reaches at least 75 percent or explain the blocker.
- Always report the final LOC coverage percentage when tests were requested.
- Prefer `pump()` over `pumpAndSettle()` in widget tests.
- Use `Get.testMode = true` and reset GetX in teardown.
- Run the narrowest useful checks first, then broader checks when feasible: `flutter analyze`, targeted tests, and `flutter test`.

## Review Behavior

When asked for a review, lead with findings ordered by severity and include file/line references. Do not edit unless the user asks for fixes.
