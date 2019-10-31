# using MFA with IAM 

https://aws.amazon.com/jp/premiumsupport/knowledge-center/authenticate-mfa-cli/

https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/id_credentials_mfa_configure-api-require.html#MFAProtectedAPI-user-mfa

prepare
--

### enable MFA

1. Install a compatible app on your mobile device or computer. Authenticator (Google)
2. IAM -> choose IAM user -> Assigned MFA device (Manage)
3. Scan QR code
4. Input two MFA codes

### set credencials

- Access key ID
- Secrets access key

```
$ keyid=XXXXXXXXXXXXXXX
$ secret=YYYYYYYYYYYYYYY
$ aws configure --profile mfa set aws_access_key_id $keyid
$ aws configure --profile mfa set aws_secret_access_key $secret
```



usage
--

```console 
$ aws --profile mfa sts get-session-token --serial-number arn:aws:iam::000000000:mfa/myuser --token-code 123456
{
    "Credentials": {
        "AccessKeyId": "XXXXXXXXXXXXXX",
        "SecretAccessKey": "------------------",
        "SessionToken": "---------------------",
        "Expiration": "2019-10-28T04:21:18Z"
    }
}
```


```bash
#!/bin/env bash

arn=$(aws --profile mfa sts get-caller-identity | jq -r '.Arn')
sn=${arn/user/mfa}

eval $(aws --profile mfa sts get-session-token --serial-number $sn --token-code $1 | jq -r  '.[] | to_entries[] | "\(.key)=\"\(.value)\""')


echo "export AWS_ACCESS_KEY_ID=$AccessKeyId"
echo "export AWS_SECRET_ACCESS_KEY=$SecretAccessKey"
echo "export AWS_SESSION_TOKEN=$SessionToken"
```

```console
$ eval $(sh mfa.sh)
```


```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": [
      "ec2:describe*"
    ],
    "Resource": ["*"],
    "Condition": {"Bool": {"aws:MultiFactorAuthPresent": "true"}}
  }]
}
```


no mfa token
```
$ aws --profile mfa ec2 describe-vpcs --region us-east-1

An error occurred (UnauthorizedOperation) when calling the DescribeVpcs operation: You are not authorized to perform this operation.
```

with mfa token
```console
$ eval $(sh mfa.sh 123456)
$ aws ec2 describe-vpcs
{
    "Vpcs": [
        {
            "CidrBlock": "172.31.0.0/16",
            "DhcpOptionsId": "dopt-e050519b",
            "State": "available",
            "VpcId": "vpc-5614702c",
            "OwnerId": "0000000000",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-af0475c3",
                    "CidrBlock": "172.31.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": true
        }
    ]
}
```
