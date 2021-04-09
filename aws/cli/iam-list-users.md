
list user and accesskeyid

```console
$ aws iam list-users --query 'Users[*].UserName' --output text | xargs -n 1| gxargs -I{} -n 1 -P 5  bash -c "aws iam list-access-keys --user-name {} --query 'AccessKeyMetadata[*].{name: UserName,keyid: AccessKeyId,status: Status}' | jq -rc '.[]|if .status == \"Active\" then .status|=.+\"  \" else  .status|=. end|[.keyid,.status,.name]|@tsv'"
```
