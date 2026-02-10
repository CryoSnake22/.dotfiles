# Destructuring in TS

**File:** `/Users/charlo/dev/nextjs/seekr-monorepo/frontend/components/ui/button.tsx`

## Notes

Depending on wether `...` is on the rhs or lhs it acts differently:

### Right Hand side (Spread operator)

Right hand side (the spread operator). This spreads out the values of an iterable into something. you can use it as:

```ts
b = [1, 2, 3];

const a = [...b]; // spreads out the values of b (a = [1,2,3])
```

### Left Hand side (Rest operator)

On the left hand side the `...` operator collects leftover values in a destructuring.

```ts
const { a, ...rest } = obj;

const { a, b, ...props } = props;

function Button(props, ref) {
  const { className, variant, ...rest } = props;
}

// Would become

function Button({ className, variant, ...rest }, ref) {
  // ...
}
```

### Notes

You can use destructuring as a replacement for

```ts
const data = await supabase.from("...")...
const name = data.name
const age = data.age

// Bleh, long, boring, not sexy

const {name, age} = await supabase.from("...")

// Nice, short, sexy.
```

But the most insane part is you can do the same in function signatures so something like:

```ts
function Button(props, ref) {
  const { className, variant, ...rest } = props;
}

// Would become

function Button({ className, variant, ...rest }, ref) {
  // ...
}
```

Apparently doing the ...rest can just spread out all the remaining ones.
