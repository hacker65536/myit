# aws lambda container image converter

https://github.com/awslabs/aws-lambda-container-image-converter/


prepare
---------

- amazonlinux 2 ( higher than t2.micro　)
- attatch role as below


### install docker go git

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
```console
$ echo 'export GOPATH=$HOME/go' >> ~/.bashrc
$ source ~/.bashrc
```
### download source and make

```console
$ mkdir -p $GOPATH/src/github.com/awslabs
$ cd !$
$ git clone https://github.com/awslabs/aws-lambda-container-image-converter.git
$ cd !$:t:r
$ make
git rev-parse --short=7 HEAD > GITCOMMIT_SHA
./scripts/build_binary.sh ./bin/local img2lambda 0.1.0 3c88cd3
?       github.com/awslabs/aws-lambda-container-image-converter/img2lambda/cli  [no test files]
?       github.com/awslabs/aws-lambda-container-image-converter/img2lambda/clients      [no test files]
=== RUN   TestRepack
2019/02/20 07:42:00 Image test-image has 4 layers
2019/02/20 07:42:00 Created Lambda layer file /tmp/871615071/layer-1.zip from image layer digest1
2019/02/20 07:42:00 Created Lambda layer file /tmp/871615071/layer-2.zip from image layer digest2
2019/02/20 07:42:00 Did not create a Lambda layer file from image layer digest3 (no relevant files found)
2019/02/20 07:42:00 Created Lambda layer file /tmp/871615071/layer-3.zip from image layer digest4
2019/02/20 07:42:00 Created 3 Lambda layer files for image test-image
--- PASS: TestRepack (0.00s)
PASS
coverage: 59.6% of statements
ok      github.com/awslabs/aws-lambda-container-image-converter/img2lambda/extract      0.014s  coverage: 59.6% of statements
=== RUN   TestNoLayers
2019/02/20 07:41:59 Lambda layer ARNs (0 total) are written to /tmp/630313259/layers.json
--- PASS: TestNoLayers (0.00s)
=== RUN   TestPublishSuccess
2019/02/20 07:41:59 Published Lambda layer file /tmp/438743701 (image layer sha256:1) to Lambda: arn:aws:lambda:us-east-2:123456789012:layer:example-layer-1:1
2019/02/20 07:41:59 Published Lambda layer file /tmp/813668592 (image layer sha256:2) to Lambda: arn:aws:lambda:us-east-2:123456789012:layer:example-layer-2:1
2019/02/20 07:41:59 Matched Lambda layer file /tmp/869350287 (image layer sha256:3) to existing Lambda layer: arn:aws:lambda:us-east-2:123456789012:layer:example-layer-3:1
2019/02/20 07:41:59 Lambda layer ARNs (3 total) are written to /tmp/875241614/layers.json
--- PASS: TestPublishSuccess (0.00s)
=== RUN   TestPublishError
--- PASS: TestPublishError (0.00s)
PASS
coverage: 83.9% of statements
ok      github.com/awslabs/aws-lambda-container-image-converter/img2lambda/publish      0.009s  coverage: 83.9% of statements
?       github.com/awslabs/aws-lambda-container-image-converter/img2lambda/types        [no test files]
?       github.com/awslabs/aws-lambda-container-image-converter/img2lambda/version      [no test files]
Built img2lambda
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
