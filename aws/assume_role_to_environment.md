
```
$(paste -d"=" <(echo -e "AWS_SECRET_ACCESS_KEY\nAWS_SESSION_TOKEN\nAWS_ACCESS_KEY_ID") <(cat asu | jq -r  '.Credentials| .SecretAccessKey , .SessionToken ,.AccessKeyId'  ) | paste <(echo -e "export\nexport\nexport") -)
```
