
priority list

```
aws elbv2 describe-rules --listener-arn $(pbpaste) --query 'Rules[].[Conditions[0].HostHeaderConfig.Values[0],Priority]' | jq -rc '.[]|@tsv'
```
