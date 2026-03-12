# Next.js Dev Tools

1. **Discover before changing** — call `nextjs_index` before implementing any change to the running app. Use it to inspect routes, errors, and build state first.
2. **Diagnose via runtime** — use `nextjs_call` (not grep or file reads) as the first tool for investigating errors, checking routes, or querying build status.
3. **Docs over training knowledge** — for any Next.js API question, use `nextjs_docs`. First read the `nextjs-docs://llms-index` resource to find the correct path, then fetch it. Never rely on training data for Next.js APIs.
4. **Browser testing** — use `browser_eval` to verify pages in a real browser, especially for hydration issues or client-side behavior. Prefer this over `curl` for page verification.
