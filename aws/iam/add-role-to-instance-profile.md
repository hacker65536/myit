
create trust relationship
```console
$ cat <<'EOF' > trust_relationship.json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
```

create role
```console
$ aws iam create-role --role-name roletest \
   --assume-role-policy-document file://trust_relationship.json
{
    "Role": {
        "Path": "/",
        "RoleName": "roletest",
        "RoleId": "AROASOFHUNRFYU7W34SGP",
        "Arn": "arn:aws:iam::012345678901:role/roletest",
        "CreateDate": "2021-01-25T09:13:46+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        }
    }
}
```

create instance profile

```console
$ aws iam create-instance-profile --instance-profile-name roletest1
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "roletest1",
        "InstanceProfileId": "AIPASOFHUNRFVENLBGCHF",
        "Arn": "arn:aws:iam::012345678901:instance-profile/roletest1",
        "CreateDate": "2021-01-25T09:16:00+00:00",
        "Roles": []
    }
}
```
```console
$ aws iam create-instance-profile --instance-profile-name roletest2
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "roletest2",
        "InstanceProfileId": "AIPASOFHUNRF2AFEH7W3W",
        "Arn": "arn:aws:iam::012345678901:instance-profile/roletest2",
        "CreateDate": "2021-01-25T09:16:45+00:00",
        "Roles": []
    }
}
```

add role to instance profile
```console 
$ aws iam add-role-to-instance-profile --instance-profile-name roletest1 --role-name roletest
```

```console
$ aws iam add-role-to-instance-profile --instance-profile-name roletest2 --role-name roletest
```

list instance profiles

```console
$ aws iam list-instance-profiles --query 'InstanceProfiles[?contains(InstanceProfileName,`roletest`)]'
[
    {
        "Path": "/",
        "InstanceProfileName": "roletest1",
        "InstanceProfileId": "AIPASOFHUNRFVENLBGCHF",
        "Arn": "arn:aws:iam::012345678901:instance-profile/roletest1",
        "CreateDate": "2021-01-25T09:16:00+00:00",
        "Roles": [
            {
                "Path": "/",
                "RoleName": "roletest",
                "RoleId": "AROASOFHUNRFYU7W34SGP",
                "Arn": "arn:aws:iam::012345678901:role/roletest",
                "CreateDate": "2021-01-25T09:13:46+00:00",
                "AssumeRolePolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Principal": {
                                "Service": "ec2.amazonaws.com"
                            },
                            "Action": "sts:AssumeRole"
                        }
                    ]
                }
            }
        ]
    },
    {
        "Path": "/",
        "InstanceProfileName": "roletest2",
        "InstanceProfileId": "AIPASOFHUNRF2AFEH7W3W",
        "Arn": "arn:aws:iam::012345678901:instance-profile/roletest2",
        "CreateDate": "2021-01-25T09:16:45+00:00",
        "Roles": [
            {
                "Path": "/",
                "RoleName": "roletest",
                "RoleId": "AROASOFHUNRFYU7W34SGP",
                "Arn": "arn:aws:iam::012345678901:role/roletest",
                "CreateDate": "2021-01-25T09:13:46+00:00",
                "AssumeRolePolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Principal": {
                                "Service": "ec2.amazonaws.com"
                            },
                            "Action": "sts:AssumeRole"
                        }
                    ]
                }
            }
        ]
    }
]
```

same `aws iam list-instance-profiles-for-role --role-name roletest`

attach role policy
```console
$ aws iam attach-role-policy --role-name roletest --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess
```


```console
[ec2-user@ip-172-31-17-76 ~]$  TOKEN=`curl -SsL -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -SsL http://169.254.169.254/latest/meta-data/iam/info;echo
{
  "Code" : "Success",
  "LastUpdated" : "2021-01-25T09:24:46Z",
  "InstanceProfileArn" : "arn:aws:iam::012345678901:instance-profile/roletest2",
  "InstanceProfileId" : "AIPASOFHUNRF2AFEH7W3W"
}
[ec2-user@ip-172-31-17-76 ~]$ aws ec2 describe-vpcs --region us-east-2 >/dev/null
[ec2-user@ip-172-31-17-76 ~]$ echo $?
0
```

```console
[ec2-user@ip-172-31-26-82 ~]$ TOKEN=`curl -SsL -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-meadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -SsL http://169.254.169.254/latest/meta-data/iam/info;echo
{
  "Code" : "Success",
  "LastUpdated" : "2021-01-25T09:24:04Z",
  "InstanceProfileArn" : "arn:aws:iam::012345678901:instance-profile/roletest1",
  "InstanceProfileId" : "AIPASOFHUNRFVENLBGCHF"
}
[ec2-user@ip-172-31-26-82 ~]$ aws ec2 describe-vpcs --region us-east-2 >/dev/null
[ec2-user@ip-172-31-26-82 ~]$ echo $?
0
```

cleanup

terminate ec2 instances

remove role from instance profile
```console
$ aws iam remove-role-from-instance-profile --instance-profile-name roletest1 --role-name roletest
```
```console
$ aws iam remove-role-from-instance-profile --instance-profile-name roletest2 --role-name roletest
```
delete instance profile 
```console
$ aws iam delete-instance-profile --instance-profile-name roletest1
```

```console
$ aws iam delete-instance-profile --instance-profile-name roletest2
```

detach role policy form role
```console
$ aws iam detach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess --role-name roletest
```

delete role
```console
$ aws iam delete-role --role-name roletest
```

ref  
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html
