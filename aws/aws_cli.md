#aws command line interface

##how to update
http://docs.aws.amazon.com/cli/latest/userguide/installing.html

current version
```bash
aws version
```
```
aws-cli/1.9.1 Python/2.7.10 Linux/4.1.10-17.31.amzn1.x86_64 botocore/1.3.1
```

```bash
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

use other version of python
```bash
sudo /usr/local/bin/python2.7 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

path or symlink
```bash
PATH=/usr/local/bin/:$PATH
export PATH
```

```bash
mv /usr/bin/aws /usr/bin/aws.bak$(date '+%Y%m%d%H%M')
```
