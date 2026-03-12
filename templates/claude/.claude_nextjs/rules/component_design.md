When designing new components always make sure to:

- Keep fetching of data server-side if no interactivity is needed
- Use Promise.all([]) for parallel fetching instead of sequential calls to await ...

- "theme toggle dark mode" returned nothing. "mode toggle" found it immediately. The registry uses exact component names, not semantic descriptions. Lesson: search with the shadcn component name, not a
  description of what you want.
