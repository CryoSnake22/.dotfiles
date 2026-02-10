# React Hooks

**File:** `/Users/charlo/dev/nextjs/seekr-monorepo/frontend/components/profile/EducationSection.tsx`

## Notes

You can use the functional forms of react hooks as such:

```tsx
const [items, setItems] = useState<EducationRow[]>(
  sortEducation(initialEducation),
);

setItems((prev) => {}); // prev is the previous state, so you can do stuff to it.
```
