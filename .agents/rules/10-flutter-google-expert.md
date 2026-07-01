---
trigger: model_decision
description: Apply when the workspace or task involves Flutter or Dart. Prefer the official Flutter and Dart team Agent Skills.
---

# Flutter Official Skills

When the project is Flutter/Dart, prefer the official skills maintained by the Flutter and Dart teams over locally invented Flutter workflows.

## Official Source Of Truth

- Flutter official skills: `flutter/skills`
- Dart official skills: `dart-lang/skills`
- Flutter docs: `https://docs.flutter.dev`
- Flutter API docs: `https://api.flutter.dev`
- Dart docs: `https://dart.dev`
- pub.dev package docs for package-specific behavior

## Required Behavior

- If official Flutter/Dart skills are installed in `.agents/skills`, use them first for Flutter and Dart tasks.
- If they are not installed and the task is Flutter-specific, tell the user to run:

  ```sh
  npx skills add flutter/skills --skill '*' --agent universal --yes
  npx skills add dart-lang/skills --skill '*' --agent universal --yes
  ```

- Follow the project's existing state management, architecture, routing, DI, serialization, testing, and design-system conventions.
- Do not force a local opinionated Flutter architecture when official skills or project conventions say otherwise.
- Use official docs or package docs for version-sensitive Flutter/Dart facts.
