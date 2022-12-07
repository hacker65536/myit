### Cantnot find module
```
❯ node js
node:internal/modules/cjs/loader:936
  throw err;
  ^

Error: Cannot find module 'cronstrue'
Require stack:
```

solution
```
export NODE_PATH=`npm root -g`
```
