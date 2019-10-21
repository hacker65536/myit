
aws managed keys (list)
```
$ aws kms list-aliases | jq '.[][]| select(.AliasName|contains("aws"))|.AliasName'
"alias/aws/acm"
"alias/aws/cloud9"
"alias/aws/codecommit"
"alias/aws/connect"
"alias/aws/dynamodb"
"alias/aws/ebs"
"alias/aws/elasticfilesystem"
"alias/aws/es"
"alias/aws/glue"
"alias/aws/kafka"
"alias/aws/kinesisvideo"
"alias/aws/lambda"
"alias/aws/lex"
"alias/aws/lightsail"
"alias/aws/rds"
"alias/aws/redshift"
"alias/aws/s3"
"alias/aws/secretsmanager"
"alias/aws/sns"
"alias/aws/ssm"
"alias/aws/xray"
```
