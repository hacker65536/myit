
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
$ gpg --gen-key --batch gen-key-script
gpg: directory `/home/ec2-user/.gnupg' created
gpg: new configuration file `/home/ec2-user/.gnupg/gpg.conf' created
gpg: WARNING: options in `/home/ec2-user/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/home/ec2-user/.gnupg/secring.gpg' created
gpg: keyring `/home/ec2-user/.gnupg/pubring.gpg' created
gpg: /home/ec2-user/.gnupg/trustdb.gpg: trustdb created
gpg: key D189A43A marked as ultimately trusted
```

```console
$ gpg -k
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
/home/ec2-user/.gnupg/pubring.gpg
---------------------------------
pub   4096R/D189A43A 2018-11-26
uid                  hacker65536 <s.hacker65536@gmail.com>
sub   4096R/A9BA06A5 2018-11-26
```
```console
$ gpg -K
/home/ec2-user/.gnupg/secring.gpg
---------------------------------
sec   4096R/D189A43A 2018-11-26
uid                  hacker65536 <s.hacker65536@gmail.com>
ssb   4096R/A9BA06A5 2018-11-26
```
