# apex

https://github.com/apex/apex



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
