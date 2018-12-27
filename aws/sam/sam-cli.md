https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-using-pip.html

```
$ pip install --user --upgrade aws-sam-cli
```

```
$ sam --version
SAM CLI, version 0.10.0
```

```
$ whereis sam
sam: /home/ec2-user/.local/bin/sam
```

set path if don't adjust
```
$ python -m site --user-base
/home/ec2-user/.local
```
```
$ USER_BASE_PATH=$(python -m site --user-base)
```
```
$ export PATH=$PATH:$USER_BASE_PATH/bin
```
