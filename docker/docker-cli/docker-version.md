```
$ docker version
Client:
 Version:           19.03.0-dev
 API version:       1.40
 Go version:        go1.12.8
 Git commit:        578ab52e
 Built:             Thu Sep 26 10:47:34 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          dev
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.8
  Git commit:       ed20165a37
  Built:            Thu Sep 26 10:40:02 2019
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.2.6
  GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
 runc:
  Version:          1.0.0-rc8
  GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

```
$ docker version -f '{{.Client.Version}}'
19.03.0-dev
```
