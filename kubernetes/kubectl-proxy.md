

locally access

```console
$ kubectl proxy
```
```console
$ netstat -plunt
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.1:8001          0.0.0.0:*               LISTEN      18445/kubectl
```

global access

```console
$ kubectl proxy --address='0.0.0.0' --accept-hosts='^*$'
```

```console
$ netstat -plunt
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0       :::8001                 :::*              LISTEN      18823/kubectl
```
