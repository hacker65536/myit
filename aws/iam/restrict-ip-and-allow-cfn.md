```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*",
            "Condition": {
                "IpAddress": {
                    "aws:SourceIp": [
                        "xxx.xxx.xxx.xxx/32"
                    ]
                }
            }
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "s3:Createbucket",
            "Resource": "*",
            "Condition": {
                "Bool": {
                    "aws:ViaAWSService": [
                        "true"
                    ]
                }
            }
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::cf-templates*",
            "Condition": {
                "Bool": {
                    "aws:ViaAWSService": [
                        "true"
                    ]
                }
            }
        }
    ]
}
```
