---
name: codex-frontend-product-ui
description: Use this skill when building or improving web, mobile, desktop, dashboard, admin, landing, game, or design-system user interfaces.
---

# Codex Frontend Product UI

## Goal

Build interfaces that are useful, polished, responsive, accessible, and consistent with the product's existing design system.

## Discovery

1. Identify the frontend stack and routing.
2. Read existing pages, shared components, theme tokens, icons, state management, and test helpers.
3. Understand the target user and primary workflow.
4. Check existing responsive and accessibility patterns.

## Implementation Standards

- Build the actual usable experience first, not a marketing shell, unless the user asks for a landing page.
- Match the existing design system and component library.
- Use semantic controls and labels.
- Handle loading, empty, error, disabled, and success states.
- Keep layout stable across viewport sizes.
- Avoid text overflow and incoherent overlap.
- Use icons from the existing icon library when available.
- Keep interactive state local only when it is truly ephemeral; otherwise use the project pattern.

## Verification

- Run the relevant frontend tests or type checks.
- Manually inspect or screenshot key viewports when tooling is available.
- Verify keyboard and focus behavior for important controls.
- Check that network/image/font assets render as expected.

## Do Not

- Do not create generic template-looking UI when the domain calls for a specific product workflow.
- Do not hardcode design tokens when the project has theme values.
- Do not put cards inside cards or use decorative clutter that hurts scanning.
- Do not ship inaccessible icon-only controls without labels/tooltips.
