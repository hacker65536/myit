

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


`myprofile=myprofile`
`myses=mysessionname`
```
aws configure --profile $myprof set role_arn arn:aws:iam::000000000000:role/assumegroup
aws configure --profile $myprof set source_profile  default
aws configure --profile $myprof set role_session_name  $myses
```
```
echo "export AWS_DEFAULT_PROFILE=$myprof" >> ~/.bashrc
```
```
source ~/.bashrc
```

check your iam
```
aws sts get-caller-identity
```


completion for fish
```
omf install aws
```
Or attach a IAM role that can operate as a administrator.


