
https://docs.aws.amazon.com/cli/latest/reference/kms/get-key-policy.html

https://docs.aws.amazon.com/cli/latest/reference/kms/list-key-policies.html

https://docs.aws.amazon.com/cli/latest/reference/kms/list-keys.html

```console
$ aws kms list-keys --query 'Keys[*].[KeyId]' --output text | xargs -I {} bash -c 'echo {}; aws kms get-key-policy --key-id  {}  --policy-name default| jq ".Policy|fromjson"' > keypolicies
```
