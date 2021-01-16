```console
$ cat <<'EOF' > SSMService-Trust.json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ssm.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
```

```console
$ aws iam create-role \
    --role-name SSMServiceRole \
    --assume-role-policy-document file://SSMService-Trust.json

{
    "Role": {
        "Path": "/",
        "RoleName": "SSMServiceRole",
        "RoleId": "AROAVXCHNOVZLAT4YMA7W",
        "Arn": "arn:aws:iam::012345678900:role/SSMServiceRole",
        "CreateDate": "2021-01-16T15:51:29+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ssm.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        }
    }
}
```

```console
$ aws iam attach-role-policy \
    --role-name SSMServiceRole \
    --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore  
```


```console
$ $(aws ssm create-activation \
  --default-instance-name raspberrypi4 \
  --description "Activation for raspberrypi4" \
  --iam-role service-role/AmazonEC2RunCommandRoleForManagedInstances \
  --registration-limit 10 \
  --region us-east-2 \
  --tags "Key=mnginstances,Value=raspberrypi4-1" | \
  jq -r 'to_entries[]|  "export \(.key)=\(.value)"' )
```
```console
$ echo $ActivationId
$ echo $ActivationCode
```

```console
$ mkdir /tmp/ssm
$ sudo curl  -SsL https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_arm/amazon-ssm-agent.deb -o /tmp/ssm/amazon-ssm-agent.deb
$ sudo dpkg -i /tmp/ssm/amazon-ssm-agent.deb
$ sudo service amazon-ssm-agent stop
$ sudo amazon-ssm-agent -register -code "$ActivationCode" -id "$ActivationId" -region "us-east-2" 
$ sudo service amazon-ssm-agent start
```
