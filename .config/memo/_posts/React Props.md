# React Props

**File:** `/Users/charlo/dev/nextjs/seekr-monorepo/frontend/components/dashboard/MatchScoreCard.tsx`

## Notes

When passing props to a react functional component a good way to do it (and the canonical way) is to first define the type for the props which defines the shape contract and then declare a functional component of that type.

```tsx
type PropType = {
  name: string;
  score: number;
};

export const FunctionalComponent: React.FC<PropType> = ({ name, score }) => {
  // Do something with the prope
};
```

If you want to pass in more complicated props you can do :

```tsx
export default function EducationSection({
  initialEducation,
}: {
  initialEducation: EducationRow[];
});
```

Where the first one is destructuring and the second one tells ts what form the props take.

This is then equivalent to:

```tsx
type EducationSectionProps = {
  initialEducation: EducationRow[];
};

export default function EducationSection({
  initialEducation,
}: EducationSectionProps);
```
