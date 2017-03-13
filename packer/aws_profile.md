

cliでassume_roleを使用する際に、AWS_ACCESS_KEY_ID、AWS_SECRET_ACCESS_KEY、AWS_PROFILE、AWS_SHARED_CREDENTIALS_FILE、AWS_REGION、AWS_TOKENの組み合わせがいまいちわかりにくいし、また順番もどうやらおかしい。

ec2にiam_roleを当てていると特に意識しなくても動かせるが、awsの認証に対してちゃんと理解しておく必要がある。


```json
{
  "variables": {
    "aws_access_key": "{{env `AWS_ACCESS_KEY_ID`}}",
    "aws_secret_key": "{{env `AWS_SECRET_ACCESS_KEY`}}",
    "aws_security_token": "{{env `AWS_SESSION_TOKEN`}}"
  },
  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "{{user `aws_access_key`}}",
      "secret_key": "{{user `aws_secret_key`}}",
      "token": "{{user `aws_security_token`}}",
      "region": "us-east-2",
      "source_ami_filter": {
        "filters": {
          "virtualization-type": "hvm",
          "name": "amzn-ami-hvm-2016*",
          "owner-alias": "amazon",
          "block-device-mapping.volume-type": "gp2",
          "root-device-type": "ebs"
        },
        "most_recent": true
      },
      "instance_type": "t2.micro",
      "ssh_username": "ec2-user",
      "ami_name": "packer-quick-start {{timestamp}}"
    }
  ],
  "provisioners": [
    {
      "type": "ansible",
      "playbook_file": "site.yml"
    }
  ]
}
```

この場合は

```
asu=$(aws sts assume-role --role-arn $(aws configure --profile $profile get role_arn) --role-session-name iam_user )

$(paste -d"=" <(echo -e "AWS_SECRET_ACCESS_KEY\nAWS_SESSION_TOKEN\nAWS_ACCESS_KEY_ID") <(echo $asu | jq -r  '.Credentials| .SecretAccessKey , .SessionToken ,.AccessKeyId'  ) | paste <(echo -e "export\nexport\nexport") -)
```
`aws sts assume-role` で必要なデータを取得して環境変数に突っ込むことでpackerに渡している






```json
{
  "variables": {
    "aws_profile": "{{env `AWS_ROFILE`}}",
    "aws_region": "{{env `AWS_REGION`}}"
  },
  "builders": [
    {
      "type": "amazon-ebs",
      "profile": "{{user `aws_profile`}}",
      "region": "{{user `aws_region`}}",
      "source_ami_filter": {
        "filters": {
          "virtualization-type": "hvm",
          "name": "amzn-ami-hvm-2016*",
          "owner-alias": "amazon",
          "block-device-mapping.volume-type": "gp2",
          "root-device-type": "ebs"
        },
        "most_recent": true
      },
      "instance_type": "t2.micro",
      "ssh_username": "ec2-user",
      "ami_name": "packer-quick-start {{timestamp}}"
    }
  ],
  "provisioners": [
    {
      "type": "ansible",
      "playbook_file": "site.yml"
    }
  ]
}
```


profileのみを指定すれば良くなる

https://github.com/mitchellh/packer/issues/4553
