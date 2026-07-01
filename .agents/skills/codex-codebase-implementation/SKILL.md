---
name: codex-codebase-implementation
description: Use this skill when implementing or modifying features, scripts, APIs, backend code, frontend code, CLIs, configs, data pipelines, or project behavior in any language or framework.
---

# Codex Codebase Implementation

## Goal

Implement the user's request end to end while following the existing codebase patterns.

## Discovery

1. Read root instructions, README files, manifests, scripts, and nearby code.
2. Identify the stack, architecture, runtime commands, generators, tests, and local style.
3. Search for similar existing implementations with `rg`.
4. Decide the smallest safe change across the relevant layers.

## Implementation Workflow

1. Make a short plan for substantial work.
2. Edit only the files required by the request.
3. Preserve public APIs and data contracts unless the request requires a change.
4. Prefer typed, structured APIs and project helpers.
5. Keep functions small enough to understand.
6. Update docs or examples when the user-facing behavior or command usage changes.
7. Add or update tests when logic or behavior changes and tests exist.
8. Run generators, formatters, linters, or migrations only when the project expects them.

## Quality Bar

- Correct behavior for success, failure, and edge cases.
- Minimal diff.
- No unrelated refactors.
- No secrets or local paths.
- No generated files edited by hand unless project docs say they are source.

## Verification

- Run the most focused command first.
- Run broader checks when shared code, public APIs, or user-facing flows changed.
- If verification cannot run, explain the blocker and the residual risk.

## Do Not

- Do not assume a framework before inspecting the repo.
- Do not introduce a new architecture or dependency for convenience.
- Do not stop at a proposal when the user asked for implementation.
