# aws cli logs operation
https://docs.aws.amazon.com/cli/latest/reference/logs/index.html


first
--
add permission (e.g. fullaccess)

```
arn:aws:iam::aws:policy/CloudWatchLogsFullAccess
```


**Actions, Resource, and Condition Keys**

https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatchlogs.html


Tutorial
--
```console 
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                   myname           manual    --profile
access_key     ******************** shared-credentials-file
secret_key     ******************** shared-credentials-file
    region                us-east-2              env    ['AWS_REGION', 'AWS_DEFAULT_REGION']
```

create log group

https://docs.aws.amazon.com/cli/latest/reference/logs/create-log-group.html

