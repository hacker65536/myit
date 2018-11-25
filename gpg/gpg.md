
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
### interactive mode 


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
Comment: I'll be SUPER HACKER
You selected this USER-ID:
    "hacker65536 (I'll be SUPER HACKER) <s.hacker65536@gmail.com>"

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
gpg: key 13BE5F85 marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   4096R/13BE5F85 2018-11-25
      Key fingerprint = 7E0B 3DAD 571F 7E3B 4859  65C7 B775 DE8E 13BE 5F85
uid                  hacker65536 (I'll be SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/92D97B88 2018-11-25
```
```console
$ ps aux|grep [g]pg-agent
ec2-user  3352  0.1  0.2 128196  2368 ?        Ss   08:48   0:00 gpg-agent --daemon --use-standard-socket
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
