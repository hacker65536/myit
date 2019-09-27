
```
$ aws secretsmanager create-secret --name sectest
{
    "ARN": "arn:aws:secretsmanager:us-east-1:123456789012:secret:sectest-HO3ZnM",
    "Name": "sectest"
}
```

```
$ aws secretsmanager put-secret-value \
--secret-id arn:aws:secretsmanager:us-east-1:123456789012:secret:sectest-HO3ZnM \
--secret-string '[{"username":"bob"},{"password":"abc123xyz456"}]'
{
    "ARN": "arn:aws:secretsmanager:us-east-1:123456789012:secret:sectest-HO3ZnM",
    "Name": "sectest",
    "VersionId": "bcdf8400-7e13-41bf-9a52-beb8adcf2371",
    "VersionStages": [
        "AWSCURRENT"
    ]
}
```
