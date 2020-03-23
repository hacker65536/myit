# oath-toolkit


https://www.nongnu.org/oath-toolkit/


install mac
--

```console
$ brew install oath-toolkit
```

check secret
--

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

usage
--
```console
$ oathtool --totp -b B*LZ3*FIL*WES*KP
123456
```


```bash
alias  HOSTmfa='oathtool --totp -b B*LZ3*FIL*WES*KP | pbcopy ; ssh HOST'
```

```console
$ mfaHOST
Warning: Permanently added 'XXX.XXX.XXX.XXX' (ECDSA) to the list of known hosts.
Verification code:
```
`cmd/ctrl + v`


ref
--

https://gihyo.jp/admin/serial/01/ubuntu-recipe/0508

https://qiita.com/ChaseSan/items/b1f63984e4eb5667154b

