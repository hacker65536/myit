create key (no passphrase no comment)
```
ssh-keygen -t rsa -b 4096 -N "" -f keyfile -C ""
```

generate publickey from private key
```
ssh-keygent -y -f <private_key> | tee publickey
```


show fingerprint
```
ssh-keygen -lf publickey -E md5/sha256
```
