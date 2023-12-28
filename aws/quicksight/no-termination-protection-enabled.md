
https://docs.aws.amazon.com/ja_jp/quicksight/latest/user/closing-account.html

https://awscli.amazonaws.com/v2/documentation/api/latest/reference/quicksight/update-account-settings.html

```
aws quicksight describe-account-settings --aws-account-id xxxxxxxxxx --region ap-northeast-1
{
    "Status": 200,
    "AccountSettings": {
        "AccountName": "examplequicksight",
        "Edition": "ENTERPRISE",
        "DefaultNamespace": "default",
        "NotificationEmail": "xxxxxx@email.com",
        "PublicSharingEnabled": false,
        "TerminationProtectionEnabled": true
    },
    "RequestId": "xxxxxxxx-xxxxx-xxxxxxxxxxxxx"
}
```


```
aws quicksight update-account-settings --no-termination-protection-enabled --aws-account-id xxxxxxxxxx --default-namespace default --region ap-northeast-1
{
    "Status": 200,
    "RequestId": "xxxxxxxx-xxxxx-xxxxxxxxxxxxx"
}
```
