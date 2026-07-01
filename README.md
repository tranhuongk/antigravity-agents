# Antigravity Codex-Style Agent Pack

This pack gives Google Antigravity persistent project rules, focused skills, and repeatable workflows for many kinds of work: coding, debugging, review, tests, docs, research, frontend UI, Git, and Flutter/GetX projects.

It is designed to behave like a strong Codex-style workspace agent:

- Read the project before writing code.
- Infer the stack instead of assuming one.
- Follow existing architecture and local conventions.
- Keep diffs minimal and protect user changes.
- Implement end to end, then verify with the right tests or commands.
- Use Flutter-specific expertise only when the project or task is Flutter/Dart.

## Install in the Current Project

Run this from the root of the project currently open in your CLI:

```sh
curl -fsSL https://raw.githubusercontent.com/tranhuongk/antigravity-agents/main/install.sh | bash
```

Or install into a specific project path:

```sh
curl -fsSL https://raw.githubusercontent.com/tranhuongk/antigravity-agents/main/install.sh | bash -s -- /absolute/path/to/project
```

Or copy these entries into the root of the project:

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

- `.agents/rules/00-codex-universal-expert.md`: always-on Codex-style behavior for any project.
- `.agents/rules/10-flutter-google-expert.md`: model-decision Flutter/GetX specialist rules.
- `.agents/agents.md`: optional universal role map for larger tasks.
- `.agents/skills/codex-codebase-implementation/SKILL.md`: general implementation workflow.
- `.agents/skills/codex-debug-fix/SKILL.md`: reproduce, fix, and verify failures.
- `.agents/skills/codex-code-review/SKILL.md`: review workflow with findings first.
- `.agents/skills/codex-test-verification/SKILL.md`: tests, coverage, and quality gates.
- `.agents/skills/codex-docs-research/SKILL.md`: documentation and source-grounded research.
- `.agents/skills/codex-frontend-product-ui/SKILL.md`: frontend/product UI implementation.
- `.agents/skills/codex-git-workflow/SKILL.md`: safe Git commit/push/release workflow.
- `.agents/skills/flutter-feature-clean-architecture/SKILL.md`: implementation workflow.
- `.agents/skills/flutter-test-coverage/SKILL.md`: page-first tests and coverage workflow.
- `.agents/skills/flutter-code-review/SKILL.md`: review workflow with findings first.
- `.agents/skills/flutter-bugfix-debug/SKILL.md`: debug and fix workflow.
- `.agents/skills/flutter-codegen-di/SKILL.md`: Freezed/json_serializable/Injectable workflow.
- `.agents/workflows/*.md`: slash-command prompts for universal and Flutter-specific tasks.
- `AGENTS.md`: fallback root instructions for tools that inspect root agent files.

## Useful Workflows

- `/codex-task <request>`: implement a general task.
- `/codex-debug <failure>`: reproduce and fix a failure.
- `/codex-review <scope>`: review code without editing.
- `/codex-test <request>`: add/run tests and verification.
- `/codex-docs <request>`: write docs or research.
- `/codex-git <request>`: commit, push, or prepare release notes safely.
- `/flutter-feature <request>`: implement a Flutter/GetX feature.
- `/flutter-test-changed <request>`: write Flutter tests and report changed LOC coverage.

## Notes

Current Antigravity documentation and codelabs use `.agents/` for workspace rules, skills, and workflows. Some older CLI/community examples use `.agent/`. If Antigravity does not load the files in your install, create one rule from the Antigravity UI and mirror whichever folder name it creates.

Official references:

- https://antigravity.google/docs/rules-workflows
- https://antigravity.google/docs/skills
- https://codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity
