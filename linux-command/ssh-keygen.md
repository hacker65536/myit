

generate publickey from private key
```
ssh-keygent -y -f <private_key> | tee publickey
```


show fingerprint
```
ssh-keygen -lf publickey -E md5/sha256
```
