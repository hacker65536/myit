

```dockerfile
FROM alpine

RUN apk update && apk add --no-cache util-linux-misc bash

ENTRYPOINT ["/usr/bin/column"]
```

```
docker build . -t column
```

```zsh
alias column='docker run --rm -i column:latest'
```
