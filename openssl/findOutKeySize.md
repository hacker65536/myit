

how many bits is key sizes from public key
```bash
 ssh-keygen -l -f $HOME/.ssh/id_rsa.pub
 2048 e5:a0:eb:81:51:5a:2e:82:72:5f:00:40:e1:f6:cc:8f  user@ip-10-0-0-180 (RSA)
 ```

private key
```bash
openssl rsa -in secret.key -text -noout | grep "Private-Key"
Private-Key: (2048 bit)


openssl rsa -in secret.key -text -noout | head -1
Private-Key: (2048 bit)
```
