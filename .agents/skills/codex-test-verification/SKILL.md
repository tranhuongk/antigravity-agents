---
name: codex-test-verification
description: Use this skill when adding tests, fixing tests, measuring coverage, running quality gates, validating behavior, or proving a change works in any project.
---

# Codex Test Verification

## Goal

Verify behavior with the smallest useful tests and commands, then broaden verification based on risk.

## Discovery

1. Read existing tests, fixtures, helpers, mocks, and CI scripts.
2. Identify test framework, naming conventions, and commands from project files.
3. Prefer the project command over generic commands.

## Test Strategy

- Prefer user-facing or contract-level tests for behavior.
- Use unit tests for isolated logic and edge cases.
- Use integration or end-to-end tests for critical flows.
- Cover success and failure paths.
- Add regression tests for fixed bugs when feasible.
- Avoid brittle implementation-detail tests.

## Verification Workflow

1. Run targeted tests for the changed area.
2. Run formatter/linter/static analysis if the project expects it.
3. Run broader suites when shared behavior changed.
4. If coverage is requested, measure and report the exact number.
5. If a command cannot run, explain why and what remains unverified.

## Do Not

- Do not claim tests pass without running them.
- Do not ignore failing tests.
- Do not rely only on snapshots/goldens for behavior unless the project already does.
- Do not use excessive sleeps or broad timeouts when a deterministic wait exists.
