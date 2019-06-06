
```bash
#!/bin/env bash

set -e

read -p 'type something word: ' param
chk=${param:? no input}

echo "you type $param"
```

```console
$ sh param.sh
type something word: abc
you type abc
$ sh param.sh
type something word:  # Enter key <empty>
param.sh: line 6: param:  no input
```
