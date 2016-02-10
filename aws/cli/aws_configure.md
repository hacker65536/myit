#aws configure


##Quick configuration
```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```

##no interactive
```bash
aws configure set region us-east-1
```
~/.aws/config
```
[default]
region=us-east-1
```
##named profile
```bash
aws configure set region us-east-1 --profile test
```

~/.aws/config
```bash
[default]
region=us-east-1
[profile test]
region = us-west-1
```



