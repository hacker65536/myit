
https://github.com/golang/go/wiki/Modules

```console
$ mkdir -p hello
$ cd !$
```
```console
$ go mod init github.com/you/hello
```
```console
$ cat <<EOF > hello.go
package main

import (
    "fmt"
    "rsc.io/quote"
)

func main() {
    fmt.Println(quote.Hello())
}
EOF
```

```console
$ go build
```

```console
$ cat go.mod
module github.com/you/hello

require rsc.io/quote v1.5.2
```
