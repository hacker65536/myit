
https://docs.aws.amazon.com/cli/latest/userguide/installing.html

require pip
```console
$ sudo yum install python-pip
```

install in user dir
```console
$ pip install --upgrade --user awscli 
```


```console
$ whereis aws
aws: /usr/bin/aws /home/ec2-user/.local/bin/aws /home/ec2-user/.local/bin/aws.cmd
```

packages of both
```
$ sudo yum info awscli
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
269 packages excluded due to repository priority protections
Installed Packages
Name        : awscli
Arch        : noarch
Version     : 1.15.80
Release     : 1.amzn2.0.1
Size        : 3.8 M
Repo        : installed
Summary     : Universal Command Line Environment for AWS
URL         : http://aws.amazon.com/cli
License     : ASL 2.0 and MIT
Description : This package provides a unified
            : command line interface to Amazon Web Services.
            
$ pip show awscli
Name: awscli
Version: 1.16.60
Summary: Universal Command Line Environment for AWS.
Home-page: http://aws.amazon.com/cli/
Author: Amazon Web Services
Author-email: UNKNOWN
License: Apache License 2.0
Location: /home/ec2-user/.local/lib/python2.7/site-packages
Requires: docutils, colorama, rsa, PyYAML, botocore, s3transfer            
```

set path
```console
$ echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
$ source ~/.bashrc
$ aws --version
aws-cli/1.16.60 Python/2.7.14 Linux/4.14.77-81.59.amzn2.x86_64 botocore/1.12.50
```
