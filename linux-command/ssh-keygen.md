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

aws fingerprint
```
openssl pkey -in key_pair -pubout -outform DER | openssl md5 -c
```


```console
find ./ -name key_pair -type f | xargs -I{} bash -c 'openssl pkey -in {} -pubout -outform DER | openssl md5 -c'
```
