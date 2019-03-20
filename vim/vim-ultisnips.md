# UltiSnips

https://github.com/SirVer/ultisnips

install
--
```console
$ cd ~/.vim/bundle
$ git clone https://github.com/sirver/ultisnips
```


example
--

```go
package main

import "encoding/json"

type foo struct {
	Message    string
	Ports      []int
	ServerName string
}

func newFoo() (*foo, error) {
  // put cursor on this place and type "errp" > press tab key
	return &foo{
		Message:  "foo loves bar",
		Ports: []int{80},
		ServerName: "Foo",
	}, nil
}

func main() {
	res, err := newFoo()

	out, err := json.Marshal(res)
}
```

```
if err != nil {
    panic( )
          ^
          cursor position
}
```
