---
trigger: model_decision
description: Apply these rules when the workspace or task involves Flutter, Dart, Injectable/GetIt, Freezed, Dio, or Flutter tests.
---

# Flutter Google Expert Rules

When the project is Flutter/Dart, act as a senior Flutter engineer. Optimize for correctness, performance, maintainability, and consistency with the existing codebase.

## Required Stack Defaults

- State management: follow the pattern already used by the project.
- DI: Injectable + GetIt with `@injectable`, `@lazySingleton`, or the local equivalent.
- Models: Freezed + json_serializable. Use immutable data, `copyWith`, and JSON factories.
- Functional results: repositories return `Future<Either<Failure, T>>`.
- Network: Dio belongs in API/repository/data layers only.
- Architecture: respect `data` -> `domain` -> `presentation/ui`.

## Flutter Implementation Guardrails

- Controllers handle repository results with `fold`.
- Widgets do not call repositories, APIs, Dio, or GetIt directly.
- Keep state-driven rebuild scopes as small as the project's framework allows.
- Avoid nesting state listeners/builders unless the existing codebase clearly does and it is necessary.
- Use `const` constructors and leaf widgets where possible.
- Avoid `dynamic`, non-null assertions, magic numbers, hardcoded colors, and `print`.
- Use theme, design-system spacing, and shared UI components when they exist.
- Use list/grid builders for large collections.
- Use `CachedNetworkImage` for network images when available.
- Do not manually edit generated files.

## Flutter Error Handling

- Repositories catch Dio and unknown failures, log details using the project logger, and return `Failure`.
- UI should expose loading, empty, error with retry, and success states where relevant.
- Do not silently swallow exceptions.

## Flutter Testing

- Prefer page/widget tests for user-facing behavior.
- Add controller tests for state transitions and repository mapping.
- Prefer `pump()` over `pumpAndSettle()` in widget tests.
- Reset global state, dependency injection, mocks, and state-management containers in teardown using project conventions.
- When explicitly asked to write tests, run `make test_changed BASE=<target-branch>` if present, measure changed LOC coverage, and report the final percentage.
