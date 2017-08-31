
install agent

```
sudo yum install -y awslogs
```


```
cat /etc/awslogs/awscli.conf
[plugins]
cwlogs = cwlogs
[default]
region = us-east-2

# if not have instance profile with role
# aws_access_key_id = <YOUR ACCESS KEY>
# aws_secret_access_key = <YOUR SECRET KEY>
```
