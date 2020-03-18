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

### create log group and stream

https://docs.aws.amazon.com/cli/latest/reference/logs/create-log-group.html

https://docs.aws.amazon.com/cli/latest/reference/logs/create-log-stream.html

```console
$ loggroup=testloggroup
```

```console 
$ aws logs create-log-group --log-group-name testloggroup
```
```
$ aws logs describe-log-groups --output yaml
logGroups:
- arn: arn:aws:logs:us-east-2:123456789012:log-group:testloggroup:*
  creationTime: 1584508344901
  logGroupName: testloggroup
  metricFilterCount: 0
  storedBytes: 0
```

```console
$ for i in $(seq 0 1); do aws logs create-log-stream --log-stream-name testlogstream${i} --log-group-name $loggroup; done
```

```console
$ aws logs describe-log-streams --log-group-name $loggroup --output yaml
logStreams:
- arn: arn:aws:logs:us-east-2:123456789012:log-group:testloggroup:log-stream:testlogstream0
  creationTime: 1584508810734
  logStreamName: testlogstream0
  storedBytes: 0
- arn: arn:aws:logs:us-east-2:123456789012:log-group:testloggroup:log-stream:testlogstream1
  creationTime: 1584508813345
  logStreamName: testlogstream1
  storedBytes: 0
```


### put event to log stream

https://docs.aws.amazon.com/cli/latest/reference/logs/put-log-events.html


> timestamp=long,message=string ...


```console 
$ aws logs put-log-events \
--log-group-name $loggroup \
--log-stream-name testlogstream1 \
--log-events timestamp=$(date +%s%3N),message="test mes3"
{
    "nextSequenceToken": "49601986952501524961423223600015250923942560088713144578"
}
```

```console
$ aws logs get-log-events --log-group-name $loggroup --log-stream-name testlogstream1 --output yaml
events:
- ingestionTime: 1584511691398
  message: test mes3
  timestamp: 1584511689743
nextBackwardToken: b/35335791457051851676641057103395682906646276005392678912
nextForwardToken: f/35335791457051851676641057103395682906646276005392678912
```


### limited

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "logs:StartQuery",
                "logs:GetLogEvents",
                "logs:FilterLogEvents",
                "logs:GetLogGroupFields",
                "logs:Desc*"
            ],
            "Resource": [
                "arn:aws:logs:us-east-2:123456789012:log-group:testloggroup",
                "arn:aws:logs:us-east-2:123456789012:log-group:testloggroup:log-stream:*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogGroups",
                "logs:DescribeSubscriptionFilters"
            ],
            "Resource": [
                "arn:aws:logs:us-east-2:123456789012:log-group:*"
            ]
        }
    ]
}
```
