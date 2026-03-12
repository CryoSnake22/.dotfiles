# Concurrent promises in JS

In order to fire a bunch of requests at once you can simply do:

```js
const [jobs, people, pets] = await Promise.all([
  getJobs(),
  getPeople(),
  getPets(),
]);
```
