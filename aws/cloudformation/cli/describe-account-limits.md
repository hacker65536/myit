


https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/APIReference/API_DescribeAccountLimits.html



```console
$ aws cloudformation describe-account-limits
{
    "AccountLimits": [
        {
            "Name": "StackLimit",
            "Value": 200
        },
        {
            "Name": "StackOutputsLimit",
            "Value": 60
        },
        {
            "Name": "ConcurrentResourcesLimit",
            "Value": 3000
        }
    ]
}
```

