https://github.com/peco/peco

```console
$ go get github.com/peco/peco
$ cd $GOPATH/src/!$
$ make build 
```
```
[INFO]	--> Exporting github.com/pmezard/go-difflib
[INFO]	--> Exporting github.com/davecgh/go-spew
[INFO]	Replacing existing vendor dependencies
go build -o releases/peco_linux_amd64/peco cmd/peco/peco.go
```
```console
$ ls -la releases/peco_linux_amd64/peco
$ mv releases/peco_linux_amd64/peco $GOPATH/bin
```

```console
$ ls -la $GOPATH/bin/ | peco
```
```
QUERY> peco                                                               IgnoreCase [1 (1/1)]
-rwxrwxr-x 1 ec2-user ec2-user  4535364 Nov 11 07:51 peco
```
