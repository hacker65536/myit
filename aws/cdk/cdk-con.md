

OS

amzlinux2


docker environment
--

Independent docker that is new version 


editor environemnt
--


- vim

- for vscode

- syntax


javascript  environment
--
- nvm
- node
- typescript
-

aws environment
--

install and configure awscli

```
sudo yum install -y python3
```
```
pip3 install --user awscli
```
```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

```
aws configure set aws_access_key_id xxxxxx
aws configure set aws_secret_access_key yyyyy
aws configure set cli_follow_urlparam false
```


Or attach a IAM role that can operate as a administrator.


