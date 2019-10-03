```console
$ aws ec2 create-key-pair --key-name KeyPair | jq -r  '.KeyMaterial' > keypair
```
