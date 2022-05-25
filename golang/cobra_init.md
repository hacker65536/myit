https://github.com/spf13/cobra/blob/master/cobra/README.md

go get
```console
$ go get github.com/spf13/cobra/cobra
```


```console
go install github.com/spf13/cobra-cli@latest
```
create dir
```console
$ newrepo=newrepo
$ cobra init github.com/hacker65536/$newrepo
```
cd 
```console
$ cd $HOME/go/src/!$
```

add subcommand

```console
$ cobra add subcmd1
$ cobra add subcmd2
```

add nested subcommand

```console
$ cobra add sub2 -p subCmd
# go run main.go sub sub2
```
