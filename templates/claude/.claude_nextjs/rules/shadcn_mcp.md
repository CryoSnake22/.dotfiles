# shadcn/ui

Before building or modifying any UI component:

1. **Check the registry** — call `get_project_registries` to confirm available registries.
2. **Search first** — use `search_items_in_registries` to find the right component before assuming it exists.
3. **Fetch the demo** — always call `get_item_examples_from_registries` to get real usage examples before writing any component code. Do not rely solely on training knowledge for component structure or props.
4. **View source if needed** — use `view_items_in_registries` to inspect actual file contents when the demo isn't enough.
5. **Use the CLI command** — get the install command via `get_add_command_for_items` rather than manually copying files.
6. **Audit after creation** — run `get_audit_checklist` after generating new components to verify correct setup.
