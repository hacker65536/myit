
gen key from batch (require expect) 
```console
$ password=$(mkpasswd -s 0 -l 12)
$ cat <<EOF> gen-key-script
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: hacker65536
Name-Email: s.hacker65536@gmail.com
Expire-Date: 0
Passphrase: $password
EOF
```

```console
