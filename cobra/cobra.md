

https://github.com/spf13/cobra


install
----
```console
$ go get -u github.com/spf13/cobra/cobra
```

setup
---
```console
$ cobra init github.com/hacker65536/myrepo
```

```console
$ cd $GOPATH/src/github.com/hacker65536/myrepo
```

```console
$ cobra add mycommand
```

setup2
---

add path of configfile to current dir

`cmd/root.go`
```go
viper.AddConfigPath(home)
// add path to current
viper.AddConfigPath(".")
```

unmarshaling
--

https://github.com/spf13/viper

```go
type config struct {
	Port int
	Name string
	PathMap string `mapstructure:"path_map"`
}

var C config

err := Unmarshal(&C)
if err != nil {
	t.Fatalf("unable to decode into struct, %v", err)
}

```

