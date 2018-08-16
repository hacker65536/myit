https://mackerel.io/ja/docs/entry/integrations/aws

1. mackerelのaws integration用のiamを作成する
2. 各種readonlyのaws policyをattach
3. optionでiam:GetUserがいる？

```hcl
data "aws_iam_policy_document" "iam" {
   statement {
     sid = "1"

     actions = [
       "iam:GetUser",
       "sqs:ListQueueTags",
       "elasticache:Lis  tTagsForResource",
     ]

     resources = [
       "*",
     ]
   }
 }
```
がないとうまくいかない
