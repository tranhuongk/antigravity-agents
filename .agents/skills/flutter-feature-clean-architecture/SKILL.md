---
name: flutter-feature-clean-architecture
description: Use this skill when implementing or modifying Flutter features, pages, controllers, bindings, widgets, repositories, APIs, request params, Freezed models, or user-facing flows in a Flutter/GetX/Clean Architecture app.
---

# Flutter Feature Clean Architecture

## Goal

Implement Flutter features in the existing project style while preserving Clean Architecture boundaries and GetX conventions.

## Discovery

1. Read `AGENTS.md`, `.agents/rules`, `pubspec.yaml`, and nearby feature files if they exist.
2. Inspect the target feature folder and similar completed features.
3. Identify local conventions for:
   - controller state shape
   - bindings and route registration
   - repository/API naming
   - request params
   - Freezed model style
   - shared UI widgets, theme, spacing, and error/loading states
   - test helpers and mock patterns
4. Prefer existing project conventions over the defaults in this skill.

## Layering Rules

- UI/page/widgets depend on controller state only.
- Controllers depend on repositories/use cases, never on Dio/API clients directly.
- Repositories return `Future<Either<Failure, T>>`.
- API classes wrap Dio or project network clients.
- Data models are immutable Freezed models with JSON serialization.
- Injectable/GetIt registration belongs at the same layer and style used by the project.

## Implementation Steps

1. Start with the smallest end-to-end path:
   - request params/model if needed
   - API/repository if network/data is needed
   - controller state and actions
   - binding/route wiring
   - page/widgets
   - tests
2. Keep controller state explicit and easy to observe:
   - `Rx<AsyncState<T>>`, `RxBool`, `Rxn<T>`, or local project equivalent
   - `assignAll` for Rx lists
   - `fold` for Either results
3. Keep widgets focused:
   - `StatelessWidget` unless local ephemeral state is required
   - split widgets when `build` becomes hard to scan
   - wrap only changing leaves in `Obx`
   - use const leaf widgets
4. Add user states:
   - loading
   - empty
   - error with retry
   - success
5. Use theme and shared UI:
   - `Theme.of(context).textTheme`
   - `colorScheme`
   - project spacing/constants
   - existing buttons, inputs, skeletons, cards, and app bars
6. For generated code:
   - edit only source files
   - run build_runner when Freezed/json/injectable changes require it
   - do not manually edit generated files

## Verification

- Run formatter if the project expects it.
- Run the narrowest relevant tests first.
- Run `flutter analyze` when feasible.
- If tests were explicitly requested, follow the `flutter-test-coverage` skill.

## Do Not

- Do not introduce Bloc, Riverpod, Provider, or another state manager.
- Do not call Dio from controllers or widgets.
- Do not return raw exceptions from repositories.
- Do not skip DI registration for new services/repositories/controllers.
- Do not hardcode colors/fonts when theme values exist.
- Do not refactor unrelated files.
