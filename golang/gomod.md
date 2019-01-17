
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

Don't need `go get`

```console
$ go list -m all
github.com/you/hello
golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
rsc.io/quote v1.5.2
rsc.io/sampler v1.3.0
```

```console
$ go list -m -u all
github.com/you/hello
golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c [v0.3.0]
rsc.io/quote v1.5.2
rsc.io/sampler v1.3.0 [v1.99.99]
```
