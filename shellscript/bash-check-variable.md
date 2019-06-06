
```bash
#!/bin/env bash

set -e

read -p 'type something word` param
chk=${param:? no input}

echo "you type $param"
```
