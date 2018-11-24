

```
$ gpg --gen-key
gpg (GnuPG) 2.0.22; Copyright (C) 2013 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

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
                  │ Passphrase *****___________________________________ │
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
gpg: key 345848DC marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   4096R/345848DC 2018-11-24
      Key fingerprint = FD99 D9D8 9003 3D97 1B3E  F79C DDB9 6936 3458 48DC
uid                  hacker65536 (I'll be SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/06F2BBA8 2018-11-24
```

```console
$ gpg -k
/home/ec2-user/.gnupg/pubring.gpg
---------------------------------
pub   4096R/345848DC 2018-11-24
uid                  hacker65536 (I'll be SUPER HACKER) <s.hacker65536@gmail.com>
sub   4096R/06F2BBA8 2018-11-24
```

