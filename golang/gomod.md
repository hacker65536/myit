
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

```console
$ go mod vendor
$ ls -la vendor
total 4
drwxrwxr-x 4 ec2-user ec2-user  57 Jan 17 09:52 .
drwxrwxr-x 3 ec2-user ec2-user  77 Jan 17 09:52 ..
drwxrwxr-x 3 ec2-user ec2-user  15 Jan 17 09:52 golang.org
-rw-rw-r-- 1 ec2-user ec2-user 187 Jan 17 09:52 modules.txt
drwxrwxr-x 4 ec2-user ec2-user  34 Jan 17 09:52 rsc.io
```
