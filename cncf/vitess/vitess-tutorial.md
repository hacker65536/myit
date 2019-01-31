https://vitess.io/


https://github.com/vitessio/vitess

with GKE


cloud chell

```console
$ go version
$ go version go1.11 linux/amd64
```

```console
$ kubectl version
Client Version: version.Info{Major:"1", Minor:"10", GitVersion:"v1.10.7", GitCommit:"0c38c362511b20a098d7cd855f1314dad92c2780", GitTreeState:"clean", BuildDate:"2018-08-20T10:09:03Z", GoVersion:"go1.9.3", Compiler:"gc", Platform:"linux/amd64"}
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

```console
$ go get vitess.io/vitess/go/cmd/vtctlclient
```
