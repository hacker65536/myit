# AWS Key Management Service

https://docs.aws.amazon.com/kms/latest/developerguide/overview.html


tutorial
--
000000000000
000000000000

### create key
```
$ aws kms create-key --tags TagKey=Puprose,TagValue=Test --description "development testkey"
{
    "KeyMetadata": {
        "AWSAccountId": "000000000000",
        "KeyId": "94ce209a-e923-4512-9c2f-142d2dbce3a1",
        "Arn": "arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1",
        "CreationDate": "2020-04-07T19:22:17.171000+09:00",
        "Enabled": true,
        "Description": "development testkey",
        "KeyUsage": "ENCRYPT_DECRYPT",
        "KeyState": "Enabled",
        "Origin": "AWS_KMS",
        "KeyManager": "CUSTOMER",
        "CustomerMasterKeySpec": "SYMMETRIC_DEFAULT",
        "EncryptionAlgorithms": [
            "SYMMETRIC_DEFAULT"
        ]
    }
}
```

### create alias

```
$ aws kms create-alias \
--alias-name alias/devtestkey \
--target-key-id arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1
```

```console
$ aws kms list-keys --query "Keys[?contains(KeyId,`94ce209a`)]"
[
    {
        "KeyId": "94ce209a-e923-4512-9c2f-142d2dbce3a1",
        "KeyArn": "arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1"
    }
]
```
