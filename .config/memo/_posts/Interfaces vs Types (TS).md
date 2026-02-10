# Interfaces vs Types (TS)

**File:** `/Users/charlo/dev/nextjs/seekr-monorepo/frontend/components/ui/button.tsx`

## Notes

Syntax (Spoiler alert SAME SHIT)

```ts
type Props = {
  variant: string
  size: string
}

interface Props = {
  variant: string
  size: string
}
```

But their implementations and consequences differ massively:

```ts
interface Props extends A,B {
  C: boolean
}
// Means Take everything in interface A plus everything in interface B plus the fields in the interface
// So you end up with something like
interface Props {
  ...A properties
  ...B properties
  C: boolean
}

```

If you wanted the same thing with types you would have to use:

```ts
type Props = A &
  B & {
    C: boolean;
  };
```

Where `&` is the intersection symbol
