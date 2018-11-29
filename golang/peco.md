https://github.com/peco/peco

```console
$ mkdir -p $GOPATH/src/github.com/peco
$ cd !$
$ git clone https://github.com/peco/peco
$ cd !$:t
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
-rwxrwxr-x 1 ec2-user ec2-user 4531350 Nov 29 02:28 releases/peco_linux_amd64/peco
```


```
$ mv releases/peco_linux_amd64/peco $GOPATH/bin
```

```console
$ ls -la $GOPATH/bin/ | peco
```
```
QUERY> peco                                                               IgnoreCase [1 (1/1)]
-rwxrwxr-x 1 ec2-user ec2-user  4535364 Nov 11 07:51 peco
```
