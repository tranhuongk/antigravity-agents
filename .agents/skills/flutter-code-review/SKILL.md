---
name: flutter-code-review
description: Use this skill when the user asks for a review, PR review, risk assessment, bug hunt, architecture review, test gap review, or asks whether Flutter/Dart changes are safe.
---

# Flutter Code Review

## Goal

Review Flutter/Dart changes for bugs, regressions, architecture violations, missing tests, performance issues, and maintainability risks.

## Review Process

1. Inspect the diff and relevant surrounding code.
2. Understand existing project conventions before judging the change.
3. Look for:
   - controllers calling Dio/API directly
   - repositories throwing instead of returning `Either<Failure, T>`
   - missing Injectable/GetIt registration
   - Freezed/json fields that do not match API payloads
   - unsafe `!`, `dynamic`, or unchecked casts
   - stale generated files
   - overly broad `Obx` scopes or nested reactive builders
   - computation inside `build`
   - missing loading/error/empty states
   - missing success and failure tests
   - user changes accidentally reverted
4. If possible, run focused tests or static checks only after understanding the diff.

## Response Format

Lead with findings. Order by severity.

For each finding include:

- Severity: P0, P1, P2, or P3
- File and line reference
- Why it matters
- Minimal fix direction

After findings, include:

- Open questions or assumptions
- Test gaps or residual risk
- Brief summary only if useful

## Do Not

- Do not edit files in review mode unless the user asks for fixes.
- Do not praise before listing findings.
- Do not list style preferences as findings unless they can cause real maintenance or behavior risk.
