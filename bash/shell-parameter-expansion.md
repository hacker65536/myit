https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html


${parameter:-word}
--


```bash
#!/bin/env bash

echo ${parameter:-word}
```
```console
$ sh param.sh
word
```
