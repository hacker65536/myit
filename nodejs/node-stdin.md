
node stdin 

```node
let main =
    (standardInput) => {
      let n = Number.parseInt(standardInput)

      console.log(n * 2 + "\n");
    }

main(require('fs').readFileSync('/dev/stdin', 'UTF-8'));
```

```console
$ echo 3 | node stdin.js
6
```
