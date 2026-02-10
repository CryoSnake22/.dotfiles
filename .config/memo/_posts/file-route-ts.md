# file-route-ts

**File:** `/Users/charlo/Home/School/season_5/DataBases1/Project/frontend/app/api/test/route.ts`

## Notes

Interestingly the row is returned as

```javascript
result.rows = [
  {
    current_time: "the time",
  },
];

// Which is why you have to use

results.rows[0].current_time;
```
