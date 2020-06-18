

using ec2role 
--


```console
$ aws sts assume-role \
--role-arn arn:aws:iam::123456789012:role/myiamrole \
--role-session-name hacker | \
jq '.Credentials|{Version: 1,AccessKeyId: .AccessKeyId,SecretAccessKey: .SecretAccessKey,SessionToken: .SessionToken,Expiration: .Expiration}' \
>/tmp/creds
```

```console
$ sudo mkdir -p /opt/bin/
```

`/opt/bin/awscreds-custom`
```bash
#!/bin/bash

cat /tmp/creds
```

```console
$ sudo chmod +x /opt/bin/awscreds-custom
```
`~/.aws/config`
```ini
[profile dev]
region = us-east-2
credential_process = "/opt/bin/awscreds-custom" parameterWithoutSpaces "parameter with spaces"
```
