# jest

https://github.com/facebook/jest


```
$ yarn add --dev jest
```

`sum.js`
```js
function sum(a, b) {
  return a + b;
}
module.exports = sum;
```

`sum.test.js`
```js
const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});
```

`package.json`

```json
{
  "scripts": {
    "test": "jest"
  },
  "devDependencies": {
    "jest": "^24.9.0"
  }
}
```

```console
$ yarn test
yarn run v1.19.1
warning package.json: No license field
$ jest
 PASS  ./sum.test.js
  ✓ adds 1 + 2 to equal 3 (2ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.745s
Ran all test suites.
Done in 1.18s.
```
