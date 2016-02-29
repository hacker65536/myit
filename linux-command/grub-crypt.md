
#grub-crypt 
Encrypt a password.

##option
- --md5 Use MD5 to encrypt the password  
- --sha-256 Use SHA-256 to encrypt the password
- --sha-512 Use SHA-512 to encrypt the password(default)
##example

```
# grub-crypt --sha-512
Password:
Retype password:
$6$l3JuGYhn1jX6SIA.$RUNbNUi04ts4fBuxSfz6qa0Fm.j.rPdZ8BOdGOzyVB6v8R/3sHZc3KwgAQObp7ER/1O0uZ1jIOkhTlkomAd5J0
```
