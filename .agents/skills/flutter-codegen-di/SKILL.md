---
name: flutter-codegen-di
description: Use this skill when changing Freezed models, json_serializable fields, Injectable/GetIt registrations, generated routes, build_runner outputs, or dependency injection wiring in Flutter/Dart projects.
---

# Flutter Codegen and DI

## Goal

Keep generated code and dependency injection in sync without manual edits to generated files.

## When To Use

Use this skill when touching:

- `@freezed`
- `@JsonSerializable`
- `@JsonKey`
- request/response models
- `@injectable`
- `@lazySingleton`
- module registration
- generated DI config
- route generation

## Workflow

1. Read existing generated-code conventions and commands in:
   - `pubspec.yaml`
   - `Makefile`
   - `build.yaml`
   - README files
   - nearby model/repository/controller files
2. Edit source files only.
3. Run the project-preferred generator command. Common fallback:

   ```sh
   dart run build_runner build --delete-conflicting-outputs
   ```

   If the project requires Flutter context, use:

   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Verify that generated files are updated and consistent.
5. Run relevant analyze/tests.

## Model Rules

- Use `const factory`.
- Include `const Model._();` when custom getters or methods are needed.
- Use `@Default` for safe defaults.
- Use `@JsonKey(name: 'api_field')` for API naming.
- Avoid `dynamic`; prefer nested typed Freezed models or typed maps only when unavoidable.
- Keep custom parsing minimal and tested.

## DI Rules

- New services, APIs, repositories, and controllers must be registered according to local conventions.
- Repository implementations should bind to interfaces with `@LazySingleton(as: InterfaceName)` or the local equivalent.
- Tests must unregister existing GetIt registrations before registering mocks.

## Do Not

- Do not manually edit `*.freezed.dart`, `*.g.dart`, or generated DI files.
- Do not leave generated files stale after changing annotations.
- Do not call `getIt<T>()` directly from widgets unless the project already has a very specific pattern requiring it.
