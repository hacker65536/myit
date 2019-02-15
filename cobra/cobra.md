

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

```go
viper.AddConfigPath(home)
// add path to current
viper.AddConfigPath(".")
```
