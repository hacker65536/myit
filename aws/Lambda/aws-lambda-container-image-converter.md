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

```console
$ docker build -t lambda-php .
---snip---
 ---> bf7bf1516ce0
Step 8/11 : COPY --from=builder /lambda-php-runtime /opt/
 ---> f324a1b44cf7
Step 9/11 : COPY --from=builder /lambda-php-vendor/vendor /opt/vendor
 ---> db9bbcc3f802
Step 10/11 : FROM runtime as function
 ---> db9bbcc3f802
Step 11/11 : COPY function/src /var/task/src/
 ---> 35471f16bfe9
Successfully built 35471f16bfe9
Successfully tagged lambda-php:latest
```

```console
$ docker images
REPOSITORY          TAG                  IMAGE ID            CREATED              SIZE
lambda-php          latest               35471f16bfe9        About a minute ago   957MB
<none>              <none>               cbb45a861bdc        About a minute ago   1.22GB
lambci/lambda       provided             bf7bf1516ce0        2 weeks ago          921MB
amazonlinux         2017.03.1.20170812   28b6d09fbbe4        15 months ago        162MB
```
```console
$ docker history lambda-php
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
35471f16bfe9        5 minutes ago       /bin/sh -c #(nop) COPY dir:07f3d6016cf144681…   372B             
db9bbcc3f802        5 minutes ago       /bin/sh -c #(nop) COPY dir:b68eef9b9d9055ddc…   644kB            
f324a1b44cf7        5 minutes ago       /bin/sh -c #(nop) COPY dir:28d971eb65e1b9d9e…   35.3MB           
bf7bf1516ce0        2 weeks ago         /bin/sh -c #(nop)  ENTRYPOINT ["/var/runtime…   0B               
<missing>           2 weeks ago         /bin/sh -c #(nop)  USER sbx_user1051            0B               
<missing>           2 weeks ago         /bin/sh -c #(nop) COPY file:c4e4c5d549aac001…   7.85MB           
<missing>           2 weeks ago                                                         913MB               create new from sha256:f4a380f8da0ac3c5255b9136d0e860ea861a1a170112a0299dc95f1bcf80200f
<missing>           2 weeks ago         /bin/sh -c #(nop) WORKDIR /var/task             0B               
<missing>           2 weeks ago         /bin/sh -c yum reinstall -y filesystem;   rm…   0B               
<missing>           2 weeks ago         /bin/sh -c #(nop)  ENV PATH=/usr/local/bin:/…   0B               
<missing>           2 weeks ago         /bin/sh -c #(nop) ADD file:152037be36e098638…   0B               
```

```console
$ docker history --no-trunc lambda-php
IMAGE                                                                     CREATED             CREATED BY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             SIZE                COMMENT
sha256:35471f16bfe9a1c75c2222e40d6ca362126168cdef8bfbd35e5f51524333511b   4 minutes ago       /bin/sh -c #(nop) COPY dir:07f3d6016cf144681aeace3d083bce91cb9be51809d0ecea057b75bc8144da41 in /var/task/src/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          372B
sha256:db9bbcc3f802e27be7c2f0cfa062bd5f17268442fd4fa272bf7c764b334ff272   4 minutes ago       /bin/sh -c #(nop) COPY dir:b68eef9b9d9055ddc4cb045a527564774ba09da7fa01e8fc4e03ca281c24f94b in /opt/vendor                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             644kB
sha256:f324a1b44cf7bbf70a0708ef2ff974bae3856a15c424ca493d5519a115de7cae   4 minutes ago       /bin/sh -c #(nop) COPY dir:28d971eb65e1b9d9ecec1b8320acaac44560816f52539d990c0a91123236f1a7 in /opt/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   35.3MB
sha256:bf7bf1516ce08cd09d423e2d1d113a6360d753add54a46b0852db38d55d5f718   2 weeks ago         /bin/sh -c #(nop)  ENTRYPOINT ["/var/runtime/init"]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0B
<missing>                                                                 2 weeks ago         /bin/sh -c #(nop)  USER sbx_user1051                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   0B
<missing>                                                                 2 weeks ago         /bin/sh -c #(nop) COPY file:c4e4c5d549aac001ecb94302f3d1f69a930e6a9af397008d7d1226b2f7b4decd in /var/runtime/init                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      7.85MB
<missing>                                                                 2 weeks ago                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                913MB               create new from sha256:f4a380f8da0ac3c5255b9136d0e860ea861a1a170112a0299dc95f1bcf80200f
<missing>                                                                 2 weeks ago         /bin/sh -c #(nop) WORKDIR /var/task                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0B
<missing>                                                                 2 weeks ago         /bin/sh -c yum reinstall -y filesystem;   rm -rf /var/cache/yum /var/lib/rpm/__db.* &&   > /var/log/yum.log &&   mkdir /tmp &&   chown sbx_user1051:495 /tmp &&   chmod 700 /tmp                                                                                                                                                                                                                                                                                                                                                                                                                       0B
<missing>                                                                 2 weeks ago         /bin/sh -c #(nop)  ENV PATH=/usr/local/bin:/usr/bin/:/bin:/opt/bin LD_LIBRARY_PATH=/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib LANG=en_US.UTF-8 TZ=:UTC LAMBDA_TASK_ROOT=/var/task LAMBDA_RUNTIME_DIR=/var/runtime _LAMBDA_CONTROL_SOCKET=14 _LAMBDA_SHARED_MEM_FD=11 _LAMBDA_LOG_FD=9 _LAMBDA_SB_ID=7 _LAMBDA_CONSOLE_SOCKET=16 _LAMBDA_RUNTIME_LOAD_TIME=1530232235231 _AWS_XRAY_DAEMON_ADDRESS=169.254.79.2 _AWS_XRAY_DAEMON_PORT=2000 AWS_XRAY_DAEMON_ADDRESS=169.254.79.2:2000 AWS_XRAY_CONTEXT_MISSING=LOG_ERROR _X_AMZN_TRACE_ID=Parent=11560be54abce8ed   0B
<missing>                                                                 2 weeks ago         /bin/sh -c #(nop) ADD file:152037be36e098638cc09979092cb15d7978439c5f29ec58974f24f54664505f in /                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       0B

```

```console
$ ../../bin/local/img2lambda -i lambda-php:latest -r us-east-2
2019/02/20 08:45:51 Parsing the docker image docker-daemon:lambda-php:latest
2019/02/20 08:46:03 Image docker-daemon:lambda-php:latest has 5 layers
2019/02/20 08:46:05 Did not create a Lambda layer file from image layer sha256:a62d74acabdbc7c028d47197aa6d9bb18863f751b9ce04f8dc274d4014ba51c9 (no relevant files found)
2019/02/20 08:46:05 Did not create a Lambda layer file from image layer sha256:82e343805314ad98191a6b75d988fce607f2fdf7c2729c4acf7d68936218a9ea (no relevant files found)
2019/02/20 08:46:06 Created Lambda layer file output/layer-1.zip from image layer sha256:68c37910ee8b14d7ad61b5a7e201ce5d1cf2fca5036a6656b4edc863ac664b33
2019/02/20 08:46:06 Created Lambda layer file output/layer-2.zip from image layer sha256:16ceac3cbd4fa9c17a8175b70e330d985b40a86feed8c787695534c062608b31
2019/02/20 08:46:06 Did not create a Lambda layer file from image layer sha256:7857a3dd36141bbb7cc10c802c0495a71b317d4df9da9f383c7eeb653b1217b0 (no relevant files found)
2019/02/20 08:46:06 Created 2 Lambda layer files for image docker-daemon:lambda-php:latest
2019/02/20 08:46:15 Published Lambda layer file output/layer-1.zip (image layer sha256:68c37910ee8b14d7ad61b5a7e201ce5d1cf2fca5036a6656b4edc863ac664b33) to Lambda: arn:aws:lambda:us-east-2:000000000000:layer:img2lambda-sha256-68c37910ee8b14d7ad61b5a7e201ce5d1cf2fca5036a6656b4edc863ac664b33:1
2019/02/20 08:46:19 Published Lambda layer file output/layer-2.zip (image layer sha256:16ceac3cbd4fa9c17a8175b70e330d985b40a86feed8c787695534c062608b31) to Lambda: arn:aws:lambda:us-east-2:000000000000:layer:img2lambda-sha256-16ceac3cbd4fa9c17a8175b70e330d985b40a86feed8c787695534c062608b31:1
2019/02/20 08:46:19 Lambda layer ARNs (2 total) are written to output/layers.json

```


```console
$ aws lambda create-function \
    --function-name php-example-hello \
    --handler hello \
    --zip-file fileb://./hello.zip \
    --runtime provided \
    --role "arn:aws:iam::000000000000:role/lambda_basic_exec_xray" \
    --region us-east-2 \
    --layers file://./output/layers.json
{
    "Layers": [
        {
            "CodeSize": 10737734,
            "Arn": "arn:aws:lambda:us-east-2:000000000000:layer:img2lambda-sha256-68c37910ee8b14d7ad61b5a7e201ce5d1cf2fca5036a6656b4edc863ac664b33:1"
        },
        {
            "CodeSize": 211888,
            "Arn": "arn:aws:lambda:us-east-2:000000000000:layer:img2lambda-sha256-16ceac3cbd4fa9c17a8175b70e330d985b40a86feed8c787695534c062608b31:1"
        }
    ],
    "FunctionName": "php-example-hello",
    "LastModified": "2019-02-20T09:00:28.565+0000",
    "RevisionId": "2f1defaa-4965-4bc8-9c31-1ebd8d9edbed",
    "MemorySize": 128,
    "Version": "$LATEST",
    "Role": "arn:aws:iam::000000000000:role/lambda_basic_exec_xray",
    "Timeout": 3,
    "Runtime": "provided",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "CodeSha256": "/D0eOmzyVXh80yvhIMyxzzXFTKfqsEw3qN8lGKAASao=",
    "Description": "",
    "CodeSize": 339,
    "FunctionArn": "arn:aws:lambda:us-east-2:000000000000:function:php-example-hello",
    "Handler": "hello"
}
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
