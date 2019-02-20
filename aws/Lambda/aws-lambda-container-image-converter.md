

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
$ sudo usermod -a -G docker $(whoami)
$ newgrp docker
```
```console
$ docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a215d7133c34aa18e3b72b4a21fd0c6136
 Built:             Mon Jan 28 21:03:38 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a/18.06.1-ce
  Built:            Mon Jan 28 21:05:04 2019
  OS/Arch:          linux/amd64
  Experimental:     false
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
