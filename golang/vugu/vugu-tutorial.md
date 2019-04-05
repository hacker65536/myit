# vugu

https://www.vugu.org/doc/start


require Go 1.12
--
```console
$ go version
go version go1.12.1 linux/amd64
```


```console
$ sudo yum list installed "go*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
562 packages excluded due to repository priority protections
Installed Packages
golang.x86_64                               1.12.1-0.el7                           @go-repo
golang-bin.x86_64                           1.12.1-0.el7                           @go-repo
golang-misc.noarch                          1.12.1-0.el7                           @go-repo
golang-src.noarch                           1.12.1-0.el7                           @go-repo
```


mkdir 
--
```console
$ mkdir vugu
$ cd !$
```

create go.mod
--

```console
$ cat <<'EOF' > go.mod
module example.org/someone/testapp
EOF
```

create vugu component file(root.vugu)
--
```html
<div class="my-first-vugu-comp">
    <button @click="data.Toggle()">Test</button>
    <div vg-if="data.Show">I am here!</div>
</div>

<style>
.my-first-vugu-comp { background: #eee; }
</style>

<script type="application/x-go">
type RootData struct { Show bool }
func (data *RootData) Toggle() { data.Show = !data.Show }
</script>
```

create a dev server file(devserver.go)
--

```go
// +build ignore

package main

import (
	"log"
	"net/http"
	"os"

	"github.com/vugu/vugu/simplehttp"
)

func main() {
	wd, _ := os.Getwd()
	//  to replace ip by below command to allow access from public , if using ec2.
	// $ ip -4 a show dev eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
	l := "127.0.0.1:8844"
	log.Printf("Starting HTTP Server at %q", l)
	h := simplehttp.New(wd, true)
	// include a CSS file
	// simplehttp.DefaultStaticData["CSSFiles"] = []string{ "/my/file.css" }
	log.Fatal(http.ListenAndServe(l, h))
}
```
