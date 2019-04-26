
```console
$ docker build . -t sampy3
```
```console
$ docker images sampy3
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
sampy3              latest              47eb860b7094        54 seconds ago      1.02GB
```

```console
$ docker run --rm -it sampy3 bash
```

```console
root@d17c89413fd6:/# aws --version
aws-cli/1.16.146 Python/3.7.3 Linux/4.14.109-99.92.amzn2.x86_64 botocore/1.12.136
root@d17c89413fd6:/# sam --version
SAM CLI, version 0.15.0
```
