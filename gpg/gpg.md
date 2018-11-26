
## info

```console
$ ls -la /usr/bin/gpg
lrwxrwxrwx 1 root root 4 Nov 14 07:25 /usr/bin/gpg -> gpg2
```
```console
$ rpm -qf /usr/bin/gpg
gnupg2-2.0.22-5.amzn2.0.2.x86_64
```
```console
$ ps aux|grep [g]pg-agent
```



## gen-key
```
$ gpg --gen-key
gpg (GnuPG) 2.0.22; Copyright (C) 2013 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: directory `/home/ec2-user/.gnupg' created
gpg: new configuration file `/home/ec2-user/.gnupg/gpg.conf' created
gpg: WARNING: options in `/home/ec2-user/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/home/ec2-user/.gnupg/secring.gpg' created
gpg: keyring `/home/ec2-user/.gnupg/pubring.gpg' created
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection? 1
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0)
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: hacker65536
Email address: s.hacker65536@gmail.com
Comment: I'll be the SUPER HACKER
You selected this USER-ID:
    "hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
You need a Passphrase to protect your secret key.
```

```

                      ┌─────────────────────────────────────────────────────┐
                      │ Enter passphrase                                    │
                      │                                                     │
                      │                                                     │
                      │ Passphrase ________________________________________ │
                      │                                                     │
                      │       <OK>                             <Cancel>     │
                      └─────────────────────────────────────────────────────┘
```
```

                      ┌─────────────────────────────────────────────────────┐
                      │ Please re-enter this passphrase                     │
                      │                                                     │
                      │ Passphrase *********_______________________________ │
                      │                                                     │
                      │       <OK>                             <Cancel>     │
                      └─────────────────────────────────────────────────────┘
```
```
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/ec2-user/.gnupg/trustdb.gpg: trustdb created
gpg: key 8B8884B7 marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   4096R/8B8884B7 2018-11-26
      Key fingerprint = C159 943E 840B 72A6 75BB  9E52 5B9D B570 8B88 84B7
uid                  hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/98463E46 2018-11-26
```
```console
$ ps aux|grep [g]pg-agent
ec2-user  2856  0.3  0.2 128196  2388 ?        Ss   06:28   0:00 gpg-agent --daemon --use-standard-socket
```

show  public key
```console
$ gpg -k
/home/ec2-user/.gnupg/pubring.gpg
---------------------------------
pub   4096R/8B8884B7 2018-11-26
uid                  hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/98463E46 2018-11-26
```
show  private key
```console
$ gpg -K
/home/ec2-user/.gnupg/secring.gpg
---------------------------------
sec   4096R/8B8884B7 2018-11-26
uid                  hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>
ssb   4096R/98463E46 2018-11-26
```

export public key
```console
$ gpg -a -o pub --export hacker65536
```
```console
$ head pub ;tail pub
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.22 (GNU/Linux)

mQINBFv7kn0BEADD+gLTcJ4++SWSf3Kpp5fWy5HEt1SZCBnPcz63Hc04LUgFsgk3
4WbjDJr8m4kRdAgp0H62ef/UwFiOP8kbtgY6fAEccFxz8Hd33B3jA2aW6u/vXoUM
Ib/HnTEcXYGWHhMkcWlrP3qja4LOyUvlBVWMQ6ZlPjzHf7pU473TFoaDWAMME1VA
KpF5lkffl61OgjAhSE2Q8XLqYMih4FchO13FKvE5SkFb6tCS36TRhBViQnPDqGip
QJe2hB2qA+LBO0fQSFcOwyKFk4ow8+CO9BgmuxJx1brCaB5nmYOdtg4qq0URIxmx
aiKfGd5CR0v0NBaAqtYUDw9XQbKsORHx7yU2HzAHcx0DxmUtwQ1GP7FyB5dcUo9c
yBWOTq3DlLYhrFZxV4io19rYsX8pC6KagjrnTNuC3Eyf2+QCyTaNWMiqNzxjxMlP
32qW7GYK50bB8lehEsxMw0iEoqsLWd0UiDU+0l9d61BOw3QRttAdfokIb9DZwxjp
T0j1pAvfwG9yamVyiqtU2zPf5ytEoiGPAewRPp2ppJVxUhKROaECirlJjrvX7kCP
z7+3YmmesWp5ZpqT4THV6xG+wR+HezusAcpGo35dJ5cZOZmJ6wJ71GPBsrNve7qw
SwbY/FBLO2RkK/Y+cM+d6vdbpQCNYSvww9tJE5lp5ASMcp/aVjR2prTFEVw8PvOm
czbVA8dP7aLx3EN9uYENmrz4Jm91JPYMTH82m5kwd9Z0YWwRH+sjh3qMFnvo/y11
5Qsw7spccFcBOLfk7QDhl3HLxGfmeeq7q/aBLzc3L3F2CFkLrgkWVi3By8SKJKZF
MBkdS9EbUiaTiJgt1YJKLWeYilaTeY+REua8MFlPPb05XkKF26tqMP2daNakaBwo
1qQ+kq3MICuLfUxygKZwBKGzhgZq/XirZ1fA851ElCM=
=foJx
-----END PGP PUBLIC KEY BLOCK-----
```
export secret key
```console
$ gpg -a -o sec --export-secret-keys hacker65536
```

```console
$ head sec; tail sec
-----BEGIN PGP PRIVATE KEY BLOCK-----
Version: GnuPG v2.0.22 (GNU/Linux)

lQc+BFv7kn0BEADD+gLTcJ4++SWSf3Kpp5fWy5HEt1SZCBnPcz63Hc04LUgFsgk3
4WbjDJr8m4kRdAgp0H62ef/UwFiOP8kbtgY6fAEccFxz8Hd33B3jA2aW6u/vXoUM
Ib/HnTEcXYGWHhMkcWlrP3qja4LOyUvlBVWMQ6ZlPjzHf7pU473TFoaDWAMME1VA
KpF5lkffl61OgjAhSE2Q8XLqYMih4FchO13FKvE5SkFb6tCS36TRhBViQnPDqGip
QJe2hB2qA+LBO0fQSFcOwyKFk4ow8+CO9BgmuxJx1brCaB5nmYOdtg4qq0URIxmx
aiKfGd5CR0v0NBaAqtYUDw9XQbKsORHx7yU2HzAHcx0DxmUtwQ1GP7FyB5dcUo9c
yBWOTq3DlLYhrFZxV4io19rYsX8pC6KagjrnTNuC3Eyf2+QCyTaNWMiqNzxjxMlP
61BOw3QRttAdfokIb9DZwxjpT0j1pAvfwG9yamVyiqtU2zPf5ytEoiGPAewRPp2p
pJVxUhKROaECirlJjrvX7kCPz7+3YmmesWp5ZpqT4THV6xG+wR+HezusAcpGo35d
J5cZOZmJ6wJ71GPBsrNve7qwSwbY/FBLO2RkK/Y+cM+d6vdbpQCNYSvww9tJE5lp
5ASMcp/aVjR2prTFEVw8PvOmczbVA8dP7aLx3EN9uYENmrz4Jm91JPYMTH82m5kw
d9Z0YWwRH+sjh3qMFnvo/y115Qsw7spccFcBOLfk7QDhl3HLxGfmeeq7q/aBLzc3
L3F2CFkLrgkWVi3By8SKJKZFMBkdS9EbUiaTiJgt1YJKLWeYilaTeY+REua8MFlP
Pb05XkKF26tqMP2daNakaBwo1qQ+kq3MICuLfUxygKZwBKGzhgZq/XirZ1fA851E
lCM=
=vSB8
-----END PGP PRIVATE KEY BLOCK-----
```

import (remote)

```console
$ gpg --import pub
gpg: directory `/home/ec2-user/.gnupg' created
gpg: new configuration file `/home/ec2-user/.gnupg/gpg.conf' created
gpg: WARNING: options in `/home/ec2-user/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/home/ec2-user/.gnupg/secring.gpg' created
gpg: keyring `/home/ec2-user/.gnupg/pubring.gpg' created
gpg: /home/ec2-user/.gnupg/trustdb.gpg: trustdb created
gpg: key 8B8884B7: public key "hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
```
```console
$ gpg -k
/home/ec2-user/.gnupg/pubring.gpg
---------------------------------
pub   4096R/8B8884B7 2018-11-26
uid                  hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/98463E46 2018-11-26
```

fingerprint
```console
$ gpg --fingerprint hacker65536
pub   4096R/8B8884B7 2018-11-26
      Key fingerprint = C159 943E 840B 72A6 75BB  9E52 5B9D B570 8B88 84B7
uid                  hacker65536 (I'll be the SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/98463E46 2018-11-26
```
```console


### oneliner

```bash
NAME_REAL=username

cat <<EOF > gen-key-script
Key-Type: 1
Key-Length: 2048
Subkey-Type: 1
Subkey-Length: 2048
Name-Real: $NAME_REAL
Expire-Date: 0
EOF
```

```bash
gpg --batch --gen-key gen-key-script
```

## list
```
$ gpg --list-keys
/root/.gnupg/pubring.gpg
------------------------
pub   2048R/03B92C0E 2017-07-03
uid       [ultimate] username
sub   2048R/B10989B6 2017-07-03

$ gpg --list-secret-keys
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
/root/.gnupg/secring.gpg
------------------------
sec   2048R/03B92C0E 2017-07-03
uid                  username
ssb   2048R/B10989B6 2017-07-03
```
## delete

```
gpg --delete-secret-key username
gpg (GnuPG) 2.0.28; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


sec  2048R/8A64A5AB 2017-07-03 username

Delete this key from the keyring? (y/N) y
This is a secret key! - really delete? (y/N) y
```

```
gpg --delete-key username
gpg (GnuPG) 2.0.28; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


pub  2048R/8A64A5AB 2017-07-03 username

Delete this key from the keyring? (y/N) y
```
```
gpg --list-keys
gpg: checking the trustdb
gpg: no ultimately trusted keys found
```
