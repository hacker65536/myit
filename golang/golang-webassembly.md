
current version
```console
$ go version
go version go1.9.4 linux/amd64
```

install go1.11beta1
```console
$ go get golang.org/x/build/version/go1.11beta1
$ go1.11beta1 download
Downloaded 0.0% (15219 / 169317128 bytes) ...
Downloaded 22.5% (38174720 / 169317128 bytes) ...
Downloaded 54.5% (92291072 / 169317128 bytes) ...
Downloaded 85.0% (143884288 / 169317128 bytes) ...
Downloaded 100.0% (169317128 / 169317128 bytes)
Unpacking /home/ec2-user/sdk/go1.11beta1/go1.11beta1.linux-amd64.tar.gz ...
Success. You may now run 'go1.11beta1'
```


`main.go`
```golang
package main

func main() {
	println("Hello, WebAssembly!")
}
```

```console
$ GOARCH=wasm GOOS=js go1.11beta1 build -o test.wasm main.go
```
```console
$ cp $(go1.11beta1 env GOROOT)/misc/wasm/wasm_exec.{html,js} .
```

`server.go`
```go
package main

import (
	"flag"
	"log"
	"net/http"
	"strings"
)

var (
	listen = flag.String("listen", ":8080", "listen address")
	dir    = flag.String("dir", ".", "directory to serve")
)

func main() {
	flag.Parse()
	log.Printf("listening on %q...", *listen)
	log.Fatal(http.ListenAndServe(*listen, http.HandlerFunc(func(resp http.ResponseWriter, req *http.Request) {
		if strings.HasSuffix(req.URL.Path, ".wasm") {
			resp.Header().Set("content-type", "application/wasm")
		}

		http.FileServer(http.Dir(*dir)).ServeHTTP(resp, req)
	})))
}
```

```console
$ go1.11beta1 run server.go
```

http://&lt;HOSTIP&gt;:8080/wasm_exec.html

open Developer tools(shift + ctrl + I) and click `Run` 

```
console.clear() was prevented due to 'Preserve log'
wasm_exec.js:39 Hello, WebAssembly!
```

https://qiita.com/cia_rana/items/bbb4112b480636ab9d87

https://github.com/golang/go/wiki/WebAssembly
