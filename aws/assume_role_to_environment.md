

```
aws sts assume-role --role-arn arn:aws:iam::000000000000:role/CrossRole --role-session-name iam_user > asu
```

```
asu=$(aws sts assume-role --role-arn arn:aws:iam::000000000000:role/CrossRole --role-session-name iam_user )
```

```
$(paste -d"=" <(echo -e "AWS_SECRET_ACCESS_KEY\nAWS_SESSION_TOKEN\nAWS_ACCESS_KEY_ID") <(cat asu | jq -r  '.Credentials| .SecretAccessKey , .SessionToken ,.AccessKeyId'  ) | paste <(echo -e "export\nexport\nexport") -)
```
