---
name: flutter-feature-clean-architecture
description: Use this skill when implementing or modifying Flutter features, pages, state holders, widgets, repositories, APIs, request params, Freezed models, or user-facing flows in a Flutter/Clean Architecture app.
---

# Flutter Feature Clean Architecture

## Goal

Implement Flutter features in the existing project style while preserving Clean Architecture boundaries and the project's state management conventions.

## Discovery

1. Read `AGENTS.md`, `.agents/rules`, `pubspec.yaml`, and nearby feature files if they exist.
2. Inspect the target feature folder and similar completed features.
3. Identify local conventions for:
   - controller state shape
   - state management, DI, and route registration
   - repository/API naming
   - request params
   - Freezed model style
   - shared UI widgets, theme, spacing, and error/loading states
   - test helpers and mock patterns
4. Prefer existing project conventions over the defaults in this skill.

## Layering Rules

- UI/page/widgets depend on state holders, view models, controllers, or notifiers only through the project pattern.
- State holders depend on repositories/use cases, never on Dio/API clients directly.
- Repositories return `Future<Either<Failure, T>>`.
- API classes wrap Dio or project network clients.
- Data models are immutable Freezed models with JSON serialization.
- Injectable/GetIt registration belongs at the same layer and style used by the project.

## Implementation Steps

1. Start with the smallest end-to-end path:
   - request params/model if needed
   - API/repository if network/data is needed
   - state holder actions
   - DI/route wiring
   - page/widgets
   - tests
2. Keep state explicit and easy to observe:
   - use the project's existing async/data/error state shape
   - update collections through the state management pattern already used by the project
   - `fold` for Either results
3. Keep widgets focused:
   - `StatelessWidget` unless local ephemeral state is required
   - split widgets when `build` becomes hard to scan
   - rebuild only the smallest widget subtree that depends on changing state
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

- Do not introduce or replace the state management library unless the user explicitly asks.
- Do not call Dio from controllers or widgets.
- Do not return raw exceptions from repositories.
- Do not skip DI registration for new services/repositories/controllers.
- Do not hardcode colors/fonts when theme values exist.
- Do not refactor unrelated files.
