# apex

https://github.com/apex/apex

http://apex.run/#getting-started

install
--
```console
$ curl -Ss https://raw.githubusercontent.com/apex/apex/master/install.sh | sudo sh
apex/apex: checking GitHub for latest version
apex/apex: found version 1.0.0-rc3 for linux/amd64
apex/apex: downloading https://github.com/apex/apex/releases/download/v1.0.0-rc3/apex_1.0.0-rc3_linux_amd64.tar.gz
apex/apex: verifying checksums
apex/apex: installed as /usr/local/bin/apex
```

configure aws credential
--
```console
$ aws configure 
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-east-2
Default output format [None]:
```
```console
$ export AWS_PROFILE=default
```

## example

### init
```console
$ apex init


             _    ____  _______  __
            / \  |  _ \| ____\ \/ /
           / _ \ | |_) |  _|  \  /
          / ___ \|  __/| |___ /  \
         /_/   \_\_|   |_____/_/\_\



  Enter the name of your project. It should be machine-friendly, as this
  is used to prefix your functions in Lambda.

    Project name: atest

  Enter an optional description of your project.

    Project description: atest

  [+] creating IAM atest_lambda_function role
  [+] creating IAM atest_lambda_logs policy
  [+] attaching policy to lambda_function role.
  [+] creating ./project.json
  [+] creating ./functions

  Setup complete, deploy those functions!

    $ apex deploy

```
### inspect
```console
$ tree .
.
├── functions
│   └── hello
│       └── index.js
└── project.json

2 directories, 2 files
```
```console
$ cat functions/hello/index.js
console.log('starting function')
exports.handle = function(e, ctx, cb) {
  console.log('processing event: %j', e)
  cb(null, { hello: 'world' })
}
```
```console
$ cat project.json
{
  "name": "atest",
  "description": "atest",
  "memory": 128,
  "timeout": 5,
  "role": "arn:aws:iam::000000000000:role/atest_lambda_function",
  "environment": {}
}
```

### deploy
```console
$ apex deploy
   • creating function         env= function=hello
   • created alias current     env= function=hello version=1
   • function created          env= function=hello name=atest_hello version=1
```
### invoke
```console
$ echo '{"name": "tobi" }' | apex invoke hello
{"hello":"world"}
```


### list
```console
$ apex list

  hello
    runtime: nodejs6.10
    memory: 128mb
    timeout: 5s
    role: arn:aws:iam::000000000000:role/atest_lambda_function
    handler: index.handle
    arn: arn:aws:lambda:us-east-2:000000000000:function:atest_hello:current
    aliases: current@v1

```
### metrics
```console
$ apex metrics

  hello
    total cost: $0.00
    invocations: 2 ($0.00)
    duration: 122ms ($0.00)
    throttles: 0
    errors: 0
    memory: 128

```
### delete

```console 
$ apex delete
Are you sure? (yes/no) yes
   • deleting                  env= function=hello
   • function deleted          env= function=hello
```

but does not delete IAM roles created by `apex init`
```console
$ aws iam get-role --role-name atest_lambda_function | jq -r '.[]|.Arn'
arn:aws:iam::000000000000:role/atest_lambda_function
```
