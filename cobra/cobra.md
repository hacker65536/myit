

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

`config.go`
```go
type config struct {
	Port int
	Name string
	PathMap string `mapstructure:"path_map"`
}

var C config
```

`root.go`
```go
 if err := viper.Unmarshal(&C); err != nil {
     fmt.Println("config file Unmarshal error")
     fmt.Println(err)
     os.Exit(1)
   }
```
