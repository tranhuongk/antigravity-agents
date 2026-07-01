---
name: codex-code-review
description: Use this skill when the user asks for a code review, PR review, architecture review, security review, regression scan, test gap review, or asks whether a change is safe.
---

# Codex Code Review

## Goal

Find real bugs, regressions, security risks, missing tests, and maintainability problems. Review behavior, not personal style.

## Review Process

1. Inspect the diff and relevant surrounding code.
2. Read tests, contracts, docs, and similar code paths when needed.
3. Check for:
   - behavior regressions
   - broken error handling
   - data loss or migration risk
   - security or privacy problems
   - concurrency, async, lifecycle, or resource leaks
   - public API or schema incompatibility
   - accessibility and responsive UI regressions
   - missing success and failure tests
   - generated files or lockfiles out of sync
   - unrelated user changes included accidentally
4. Run focused checks only if useful and safe.

## Response Format

Lead with findings ordered by severity.

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

- Do not edit files in review mode unless explicitly asked.
- Do not list preferences as findings unless they create real risk.
- Do not bury serious findings under praise.
