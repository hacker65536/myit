```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mysql               5.6                 cdfa8cc50c33        3 months ago        298 MB
```

```
$ docker rmi cdfa8cc50c33
Error response from daemon: conflict: unable to delete cdfa8cc50c33 (cannot be forced) - image has dependent child images
```

```
docker images --format '{{.Repository}}:{{.Tag}}'
```

```
docker rmi mysql:5.6
Untagged: mysql:5.6
Untagged: mysql@sha256:2897982d4c086b03586a1423d0cbf33688960ef7534b7bb51b9bcfdb6c3597e7
```
