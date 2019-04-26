https://stackoverflow.com/questions/45701396/run-docker-container-as-ec2-user-on-aws-ec2


```console
$ docker build -t amz2 .
```

```console
$ docker run --rm -it --user ec2-user amz2 bash
```
