
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

both packages
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



## v2
https://aws.amazon.com/jp/blogs/developer/aws-cli-v2-development/


```console
$ pip install --user -e git://github.com/aws/aws-cli.git@v2#egg=awscli
Obtaining awscli from git+git://github.com/aws/aws-cli.git@v2#egg=awscli
  Updating ./src/awscli clone (to v2)
Collecting botocore==1.12.48 (from awscli)
  Using cached https://files.pythonhosted.org/packages/b0/ff/eae3b8e2c6ee63ea8451af78ff31d3fe0749fbc01bc498334a4893e58b80/botocore-1.12.48-py2.py3-none-any.whl
Requirement already satisfied: colorama<=0.3.9,>=0.2.5 in ./.local/lib/python2.7/site-packages (from awscli)
Requirement already satisfied: docutils>=0.10 in ./.local/lib/python2.7/site-packages (from awscli)
Requirement already satisfied: rsa<=3.5.0,>=3.1.2 in ./.local/lib/python2.7/site-packages (from awscli)
Requirement already satisfied: s3transfer<0.2.0,>=0.1.12 in ./.local/lib/python2.7/site-packages (from awscli)
Collecting ruamel.yaml<0.16.0,>=0.15.0 (from awscli)
  Using cached https://files.pythonhosted.org/packages/52/b0/b6cb408206e544c173cf588cb74d30e169deb75453df5545ea22c9e61123/ruamel.yaml-0.15.80-cp27-cp27mu-manylinux1_x86_64.whl
Collecting prompt-toolkit<3.0.0,>=2.0.0 (from awscli)
  Using cached https://files.pythonhosted.org/packages/c7/f8/04aec108fe1d76b59d93c98438bce32bc633e99e7e1453e22b8d82722b14/prompt_toolkit-2.0.7-py2-none-any.whl
Requirement already satisfied: urllib3<1.25,>=1.20; python_version == "2.7" in ./.local/lib/python2.7/site-packages (from botocore==1.12.48->awscli)
Requirement already satisfied: python-dateutil<3.0.0,>=2.1; python_version >= "2.7" in ./.local/lib/python2.7/site-packages (from botocore==1.12.48->awscli)
Requirement already satisfied: jmespath<1.0.0,>=0.7.1 in /usr/lib/python2.7/site-packages (from botocore==1.12.48->awscli)
Requirement already satisfied: pyasn1>=0.1.3 in ./.local/lib/python2.7/site-packages (from rsa<=3.5.0,>=3.1.2->awscli)
Requirement already satisfied: futures<4.0.0,>=2.2.0; python_version == "2.6" or python_version == "2.7" in ./.local/lib/python2.7/site-packages (from s3transfer<0.2.0,>=0.1.12->awscli)
Collecting ruamel.ordereddict; platform_python_implementation == "CPython" and python_version <= "2.7" (from ruamel.yaml<0.16.0,>=0.15.0->awscli)
  Using cached https://files.pythonhosted.org/packages/f3/2c/fa6d75dc459b371ed3b88fdbf8042785ce1655073c884fd97bdbb9f48e01/ruamel.ordereddict-0.4.13-cp27-cp27mu-manylinux1_x86_64.whl
Collecting wcwidth (from prompt-toolkit<3.0.0,>=2.0.0->awscli)
  Using cached https://files.pythonhosted.org/packages/7e/9f/526a6947247599b084ee5232e4f9190a38f398d7300d866af3ab571a5bfe/wcwidth-0.1.7-py2.py3-none-any.whl
Requirement already satisfied: six>=1.9.0 in ./.local/lib/python2.7/site-packages (from prompt-toolkit<3.0.0,>=2.0.0->awscli)
Installing collected packages: botocore, ruamel.ordereddict, ruamel.yaml, wcwidth, prompt-toolkit, awscli
  Found existing installation: botocore 1.12.50
    Uninstalling botocore-1.12.50:
      Successfully uninstalled botocore-1.12.50
  Found existing installation: awscli 1.16.60
    Uninstalling awscli-1.16.60:
      Successfully uninstalled awscli-1.16.60
  Running setup.py develop for awscli
Successfully installed awscli botocore-1.12.48 prompt-toolkit-2.0.7 ruamel.ordereddict-0.4.13 ruamel.yaml-0.15.80 wcwidth-0.1.7
```
```console
$ aws --version
aws-cli/2.0.0dev0 Python/2.7.14 Linux/4.14.77-81.59.amzn2.x86_64 botocore/1.12.48
```
