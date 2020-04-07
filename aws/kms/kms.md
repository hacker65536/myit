# AWS Key Management Service

https://docs.aws.amazon.com/kms/latest/developerguide/overview.html


tutorial
--


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



### describe

```console
$ aws kms list-keys --query "Keys[?contains(KeyId,`94ce209a`)]"
[
    {
        "KeyId": "94ce209a-e923-4512-9c2f-142d2dbce3a1",
        "KeyArn": "arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1"
    }
]
```

```console
$ aws kms list-aliases --query 'Aliases[?contains(AliasName,`devtest`)]'
[
    {
        "AliasName": "alias/devtestkey",
        "AliasArn": "arn:aws:kms:us-east-2:000000000000:alias/devtestkey",
        "TargetKeyId": "94ce209a-e923-4512-9c2f-142d2dbce3a1"
    }
]
```


### generate data key

```console
$ aws kms generate-data-key --key-id alias/devtestkey --key-spec AES_256
{
    "CiphertextBlob": "AQIDAHg8Y4NT24qEpzZ/rV2kw/GfcHnNoOGR9FEhoPK4FCtWrAFEaZHdqR0GhM9HUCRKxMTrAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMFiTL1mfJlpO9YKrtAgEQgDvRxEZFjU89aiL3Rsr6/4GUcGj01NB37JF5/UAk+yVeOB33waDnZ1PG2paQIsj3WH9ywDEKDhhqwrnj5w==",
    "Plaintext": "xJemIeGhs4aaq0UNftTxn0t5lz/k3yGzelp0DQCUbN0=",
    "KeyId": "arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1"
}
```
saved CiphertextBlob
```console 
$ echo "AQIDAHg8Y4NT24qEpzZ/rV2kw/GfcHnNoOGR9FEhoPK4FCtWrAFEaZHdqR0GhM9HUCRKxMTrAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMFiTL1mfJlpO9YKrtAgEQgDvRxEZFjU89aiL3Rsr6/4GUcGj01NB37JF5/UAk+yVeOB33waDnZ1PG2paQIsj3WH9ywDEKDhhqwrnj5w==" | base64 -d > ciphertextblob
```
### encrypt data

```console
$ echo "wareware ha alien" > plaintext
```

 
```console
$ echo "xJemIeGhs4aaq0UNftTxn0t5lz/k3yGzelp0DQCUbN0=" | \
openssl enc -aes-256-cbc -in plaintext -out encrypttext -pass stdin -
```

```console
$ hexdump -C  plaintext
00000000  77 61 72 65 77 61 72 65  20 68 61 20 61 6c 69 65  |wareware ha alie|
00000010  6e 0a                                             |n.|
00000012
```

```console
$ hexdump -C  encrypttext
00000000  53 61 6c 74 65 64 5f 5f  13 92 25 9c 5c 86 20 7f  |Salted__..%.\. .|
00000010  ca 4f a7 12 17 68 28 50  3a 88 67 92 cf 1d 67 3e  |.O...h(P:.g...g>|
00000020  c9 88                                             |..|
00000022
```


### decrypt data

```console
$ aws kms decrypt --ciphertext-blob fileb://ciphertextblob
{
    "KeyId": "arn:aws:kms:us-east-2:000000000000:key/94ce209a-e923-4512-9c2f-142d2dbce3a1",
    "Plaintext": "xJemIeGhs4aaq0UNftTxn0t5lz/k3yGzelp0DQCUbN0=",
    "EncryptionAlgorithm": "SYMMETRIC_DEFAULT"
}
```

oneliner
```console
$ aws kms decrypt --ciphertext-blob fileb://ciphertextblob --query Plaintext --output text | \
openssl enc -d -aes-256-cbc -in encrypttext -out decrypttext -pass stdin -
```

```console
$ diff decrypttext plaintext >/dev/null && echo same || echo diff
same
```

```console
$ hexdump -C decrypttext
00000000  77 61 72 65 77 61 72 65  20 68 61 20 61 6c 69 65  |wareware ha alie|
00000010  6e 0a                                             |n.|
00000012
```


problem
--

aes-256-gcm -> `bad decrypt`


but decrypts successfully. (no cipher commands in macOS?)
```
$ openssl enc -d -aes-256-gcm -in encrypttext -out decrypttext
enter aes-256-gcm decryption password:
bad decrypt
```
