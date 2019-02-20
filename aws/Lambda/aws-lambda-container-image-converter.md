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
```console
$ ./bin/local/img2lambda --help
NAME:
   img2lambda - Repackages a container image into AWS Lambda layers and publishes them to Lambda

USAGE:
   img2lambda [global options] [arguments...]

VERSION:
   0.1.0 (3c88cd3)

GLOBAL OPTIONS:
   --image value, -i value                 Name of the source container image. For example, 'my-docker-image:latest'. The Docker image must be pulled locally already.
   --region value, -r value                AWS region (default: "us-east-1")
   --output-directory value, -o value      Destination directory for command output (default: "./output")
   --layer-namespace value, -n value       Prefix for the layers published to Lambda (default: "img2lambda")
   --dry-run, -d                           Conduct a dry-run: Repackage the image, but only write the Lambda layers to local disk (do not publish to Lambda)
   --description value, --desc value       The description of this layer version (default: "created by img2lambda from image <name of the image>")
   --license-info value, -l value          The layer's software license. It can be an SPDX license identifier, the URL of the license hosted on the internet, or the full text of the license (default: no license)
   --compatible-runtime value, --cr value  An AWS Lambda function runtime compatible with the image layers. To specify multiple runtimes, repeat the option: --cr provided --cr python2.7 (default: "provided")
   --help, -h                              show help
   --version, -v                           print the version
```

### sample

```console
$ cd $GOPATH/src/github.com/awslabs/aws-lambda-container-image-converter/example/
```
```Dockerfile
# Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

####### PHP custom runtime #######

####### Install and compile everything #######

# Same AL version as Lambda execution environment AMI
FROM amazonlinux:2017.03.1.20170812 as builder

# Lock to 2017.03 release (same as Lambda) and install compilation dependencies
RUN sed -i 's;^releasever.*;releasever=2017.03;;' /etc/yum.conf && \
    yum clean all && \
    yum install -y autoconf \
                bison \
                gcc \
                gcc-c++ \
                make \
                libcurl-devel \
                libxml2-devel \
                openssl-devel \
                tar \
                gzip \
                zip \
                unzip \
                git

# Download the PHP 7.3.0 source, compile, and install both PHP and Composer
RUN curl -sL https://github.com/php/php-src/archive/php-7.3.0.tar.gz | tar -xvz && \
    cd php-src-php-7.3.0 && \
    ./buildconf --force && \
    ./configure --prefix=/opt/php-7-bin/ --with-openssl --with-curl --with-zlib --without-pear && \
    make install && \
    /opt/php-7-bin/bin/php -v && \
    curl -sS https://getcomposer.org/installer | /opt/php-7-bin/bin/php -- --install-dir=/opt/php-7-bin/bin/ --filename=composer

# Prepare runtime files
RUN mkdir -p /lambda-php-runtime/bin && \
    cp /opt/php-7-bin/bin/php /lambda-php-runtime/bin/php

COPY runtime/bootstrap /lambda-php-runtime/

# Install Guzzle, prepare vendor files
RUN mkdir /lambda-php-vendor && \
    cd /lambda-php-vendor && \
    /opt/php-7-bin/bin/php /opt/php-7-bin/bin/composer require guzzlehttp/guzzle

###### Create runtime image ######

FROM lambci/lambda:provided as runtime

# Layer 1
COPY --from=builder /lambda-php-runtime /opt/

# Layer 2
COPY --from=builder /lambda-php-vendor/vendor /opt/vendor

###### Create function image ######

FROM runtime as function

COPY function/src /var/task/src/
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
