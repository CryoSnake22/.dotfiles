# useEffect Quirks

**File:** `/Users/charlo/dev/nextjs/seekr2/lib/auth/AuthContext.tsx`

## Notes

When using useEffect() inJS, one can use something like

```ts
useEffect(() => {
  console.log("Cool log"); // Happens on mount and during

  return () => {
    // some function which acts as callback for when component is unmounted
  };
}, [refresh]);
```
