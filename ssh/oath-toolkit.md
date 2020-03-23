# oath-toolkit


https://www.nongnu.org/oath-toolkit/


install mac
--

```console
$ brew install oath-toolkit
```


log in to configurated server
```console
$ cat ~/.google_authenticator
B*LZ3*FIL*WES*KP   # <-secret
" WINDOW_SIZE 20
" TOTP_AUTH
46196232
62325057
84961290
52701009
80861432
```


```console
$ oathtool --totp -b B*LZ3*FIL*WES*KP
123456
```
