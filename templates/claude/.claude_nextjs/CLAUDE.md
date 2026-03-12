# Claude Rules

Package Manager: pnpm (preferred)

## Memory

After any of the following, update your memory using the `project-memory-checkpoint` skill

- Installing a package
- Adding a new route or page
- Adding or removing a shadcn component
- Making an architectural decision
- Receiving feedback or a correction from the user

At the start of each session, read relevant memory files before doing discovery.

Use the `project-memory-checkpoint` skill whenever a checkpoint is needed.

## Dev Commands

- Dev server: `pnpm dev` (DO NOT RUN YOURSELF, the user will run it himself)
- Build: `pnpm build`
- Start: `pnpm start`
- Lint: `pnpm lint`
- Format: `pnpm format`
- Test: `pnpm test`

## Component Guidelines

- Use shadcn/ui components by default for form elements, cards, dialogs, etc.
- Style components with Tailwind utility classes
- for UI components with multiple valid patterns, ask before building.

## Additional Rules:

### Component design:

see: @rules/component_design.md

### Shadcn mcp:

see: @rules/shadcn_mcp.md

### nextjs mcp:

see: @rules/next-dev_mcp.md
