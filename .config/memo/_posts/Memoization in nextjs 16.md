# Memoization in nextjs 16

Beforehand you had to use `useMemo` and `useCallback` to memoize stuff but now you can simply:

```bash
pnpm install babel-plugin-react-compiler@latest
```

Then in `next.config.ts` you set:

```js
const nextConfig: NextConfig = {
  reactCompiler = True,
  ... // Rest of config
}
```
