# Spread Operator (JavaScript)

The spread operator creates a shallow copy of the elements of an array.

you can use them as such

```tsx
const a = [1, 2, 3];

const b = [...a];
```

b is a shallow copy of a, You must be sure that the `...a` is an iterable otherwise the spred operator doesnt work. you can also spread into arguments.
