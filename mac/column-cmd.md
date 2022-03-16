

```dockerfile
FROM alpine

RUN apk update && apk add --no-cache util-linux-misc bash

ENTRYPOINT ["/usr/bin/column"]
```

```zsh
alias column='docker run --rm -i column:latest'
```
