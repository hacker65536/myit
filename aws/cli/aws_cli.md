#aws command line interface
##install form other linxu


```bash
curl -s "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install awscli
```
```
aws --version
aws-cli/1.10.6 Python/2.6.6 Linux/2.6.32-573.7.1.el6.x86_64 botocore/1.3.28
```

##how to update
http://docs.aws.amazon.com/cli/latest/userguide/installing.html

current version
```bash
aws --version
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

export 
```bash
PATH=/usr/local/bin/:$PATH
export PATH
```

symlink
```bash
aws --version
```
```
aws-cli/1.10.1 Python/2.7.10 Linux/4.1.10-17.31.amzn1.x86_64 botocore/1.3.23
```
```bash
mv /usr/bin/aws /usr/bin/aws.bak.$(date '+%Y%m%d%H%M%Z')
ln -s /usr/local/bin/aws /usr/bin/
```
```bash
aws --version
```
```
aws-cli/1.10.3 Python/2.7.10 Linux/4.1.10-17.31.amzn1.x86_64 botocore/1.3.25
```

find aws_completer
```
find / -name aws_completer
/usr/bin/aws_completer
```


bash
```
echo  "complete -C '/usr/local/bin/aws_completer' aws" > ~/.bashrc
. ~/.bashrc
```

zsh
```
find / -name "aws_zsh_completer.sh"

source /usr/local/bin/aws_zsh_completer.sh
```
