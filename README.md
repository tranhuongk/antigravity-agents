# Antigravity Flutter Expert Pack

This pack gives Google Antigravity persistent project rules, focused skills, and repeatable workflows for a Flutter/GetX/Clean Architecture codebase.

It is designed for this stack:

- Flutter and Dart 3.x
- GetX controllers, `.obs`, `Obx`
- Injectable and GetIt for DI
- Freezed and json_serializable for immutable models
- Dartz `Either<Failure, T>` for repository results
- Dio inside API/repository layers only
- Clean Architecture: `data` -> `domain` -> `presentation/ui`

## Install in a Flutter project

From this pack folder:

```sh
./install_to_project.sh /absolute/path/to/your/flutter/project
```

Or copy these entries into the root of the Flutter project:

```text
.agents/
AGENTS.md
```

Then open or restart the workspace chat in Antigravity.

## Verify

Ask Antigravity:

```text
What workspace rules and skills are available?
```

For skills, you can also try:

```text
/skills
```

## What is included

- `.agents/rules/00-flutter-google-expert.md`: always-on project behavior.
- `.agents/agents.md`: optional role map for larger tasks.
- `.agents/skills/flutter-feature-clean-architecture/SKILL.md`: implementation workflow.
- `.agents/skills/flutter-test-coverage/SKILL.md`: page-first tests and coverage workflow.
- `.agents/skills/flutter-code-review/SKILL.md`: review workflow with findings first.
- `.agents/skills/flutter-bugfix-debug/SKILL.md`: debug and fix workflow.
- `.agents/skills/flutter-codegen-di/SKILL.md`: Freezed/json_serializable/Injectable workflow.
- `.agents/workflows/*.md`: slash-command prompts for common tasks.
- `AGENTS.md`: fallback root instructions for tools that inspect root agent files.

## Notes

Current Antigravity documentation and codelabs use `.agents/` for workspace rules, skills, and workflows. Some older CLI/community examples use `.agent/`. If Antigravity does not load the files in your install, create one rule from the Antigravity UI and mirror whichever folder name it creates.

Official references:

- https://antigravity.google/docs/rules-workflows
- https://antigravity.google/docs/skills
- https://codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity
