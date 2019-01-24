

https://github.com/awslabs/aws-lambda-container-image-converter/


prepare
---------

### launch ec2

- amazonlinux 2 ( higher than t2.micro　)
- attatch role as below
- install docker go git


```console
$ sudo yum install -y git 
$ sudo amazon-linux-extras install -y docker
$ sudo amazon-linux-extras install -y golang1.11
$ sudo systemctl enable docker
$ sudo systemctl start docker
$ sudo usermod -a -G docker ec2-user
$ sudo newgrp docker
```



```
$ git clone https://github.com/awslabs/aws-lambda-container-image-converter.git
$ cd !$:t:r/example
```
```
$ docker build -t lambda-php:latest .
---snip---
Successfully built c90803eda009
Successfully tagged lambda-php:latest
```

```
$ docker run lambda-php hello '{"name": "Myself"}'
START RequestId: 52fdfc07-2182-154f-163f-5f0f9a621d72 Version: $LATEST
END RequestId: 52fdfc07-2182-154f-163f-5f0f9a621d72
REPORT RequestId: 52fdfc07-2182-154f-163f-5f0f9a621d72  Init Duration: 25.71 ms Duration: 5.18 ms Billed Duration: 100 ms  Memory Size: 1536 MB    Max Memory Used: 22 MB
Hello, Myself!
```


img2lambda -i lambda-php:latest


cat output/laysers.json
cd function/
zip hello.zip src/hello.php



```
$ export GOPATH=$HOME/go
$ mkdir -p $GOPATH/src/github.com/awslabs
$ git clone https://github.com/awslabs/aws-lambda-container-image-converter $GOPATH/src/github.com/awslabs/aws-lambda-container-image-converter
$ cd !$
$ make
git rev-parse --short=7 HEAD > GITCOMMIT_SHA
./scripts/build_binary.sh ./bin/local img2lambda 0.0.1 7ef0b72
Built img2lambda
```
$ ./bin/local/img2lambda --help
