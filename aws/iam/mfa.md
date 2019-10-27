# using MFA with IAM 

https://aws.amazon.com/jp/premiumsupport/knowledge-center/authenticate-mfa-cli/

https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/id_credentials_mfa_configure-api-require.html#MFAProtectedAPI-user-mfa
prepare
--

1. Install a compatible app on your mobile device or computer. 

Authenticator (Google)

2. IAM -> choose IAM user -> Assigned MFA device (Manage)

3. Scan QR code

4. Input two MFA codes


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

sn="arn:aws:iam::123456789012:mfa/myuser"

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
