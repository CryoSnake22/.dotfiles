# Params in Pages (nextjs)

When you want your route to be parameter dependent you would create a dir with the parameter name e.g:

```bash
mkdir users/[slug]
```

Where `slug` is the name of the parameter

```js
export default async function Page({
params,
}: {
params: Promise<{ slug: string }>
}) {
const { slug } = await params
}
```

Or written more intuitively with a proper type:

```js
type Props = {
  params: Promise<{slug: string}>
}

export default async function Page({ params }: Props) {
  const { slug } = await params
}
```
