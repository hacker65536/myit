# sam Quick Start

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-quick-start.html

```console
$ sam --version
SAM CLI, version 0.14.2
```
```console
$ cat /etc/system-release
Amazon Linux release 2 (Karoo)
```

init
--

```console
$ mkdir sam
$ cd !$
```

```console
$ sam init --runtime go
[+] Initializing project structure...

Project generated: ./sam-app

Steps you can take next within the project folder
===================================================
[*] Install dependencies
[*] Invoke Function: sam local invoke HelloWorldFunction --event event.json
[*] Start API Gateway locally: sam local start-api

Read sam-app/README.md for further instructions

[*] Project initialization is now complete
```

build
--
need building if using go. because `sam build` is unsupported go1.x
```console
$ cd sam-app
$ make build
GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world
```

test locally
--
the first calling it'll pull docker image of lambda:go1.x
```console
$ sam local start-api
2019-04-08 06:29:10 Mounting HelloWorldFunction at http://127.0.0.1:3000/hello [GET]
2019-04-08 06:29:10 You can now browse to the above endpoints to invoke your functions. You do not need to restart/reload SAM CLI while working on your functions, changes will be reflected instantly/automatically. You only need to restart SAM CLI if you update your AWS SAM template
2019-04-08 06:29:10  * Running on http://127.0.0.1:3000/ (Press CTRL+C to quit)
2019-04-08 06:29:17 Invoking hello-world (go1.x)

Fetching lambci/lambda:go1.x Docker container image...............................................................................................................................................................
2019-04-08 06:29:35 Mounting /home/ec2-user/sam/sam-app/hello-world as /var/task:ro inside runtime container
START RequestId: 6825c606-7bf2-1d97-de49-8f318df1fec9 Version: $LATEST
END RequestId: 6825c606-7bf2-1d97-de49-8f318df1fec9
REPORT RequestId: 6825c606-7bf2-1d97-de49-8f318df1fec9  Duration: 111.19 ms     Billed Duration: 200 ms Memory Size: 128 MB     Max Memory Used: 12 MB
2019-04-08 06:29:36 No Content-Type given. Defaulting to 'application/json'.
2019-04-08 06:29:36 127.0.0.1 - - [08/Apr/2019 06:29:36] "GET /hello HTTP/1.1" 200 -
```

```console
$ curl  http://127.0.0.1:3000/hello
Hello, 1.2.3.4
```



tips
--

```
go get: no install location for directory /home/ec2-user/PATHTO/hello-world outside GOPATH
        For more details see: 'go help gopath'
```

~/.bashrc
```
# GOPATH
export GOPATH=$(go env GOPATH)    # "$HOME/go"
export PATH="$PATH:${GOPATH//://bin:}/bin"
```
