---
description: Implement a general codebase task with discovery, minimal diff, tests, and verification.
---

When the user runs `/codex-task <request>`, use the `codex-codebase-implementation` skill:

1. Inspect the repo stack, commands, and nearby patterns.
2. Identify the smallest set of files and layers affected.
3. Make project-consistent edits.
4. Add or update tests when behavior changes.
5. Run the narrowest useful verification, then broader checks when risk justifies it.
6. Report changed files, verification, and remaining risks.
