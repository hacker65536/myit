
https://eslint.org/docs/user-guide/getting-started

https://qiita.com/howdy39/items/6e2c75861bc5a14b2acf

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
  no-console:
    - off
  indent:
    - error
    - 4
  linebreak-style:
    - error
    - unix
  quotes:
    - warn
    - single
  semi:
    - error
    - always
```
