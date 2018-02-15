
https://eslint.org/docs/user-guide/getting-started

```
npm install eslint
./node_modules/.bin/eslint --init

```

```
$ cat .eslintrc.yml 
env:
  es6: true
  node: true
extends: 'eslint:recommended'
rules:
  indent:
    - error
    - 4
  linebreak-style:
    - error
    - unix
  quotes:
    - error
    - double
  semi:
    - error
    - always
```
