

```console
$ gpg --version
gpg (GnuPG) 2.2.4
libgcrypt 1.8.1
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Home: /home/ubuntu/.gnupg
Supported algorithms:
Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA
Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH,
        CAMELLIA128, CAMELLIA192, CAMELLIA256
Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
Compression: Uncompressed, ZIP, ZLIB, BZIP2
```

```console
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.1 LTS
Release:        18.04
Codename:       bionic
```


```console
$ gpg --gen-key
gpg (GnuPG) 2.2.4; Copyright (C) 2017 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: directory '/home/ubuntu/.gnupg' created
gpg: keybox '/home/ubuntu/.gnupg/pubring.kbx' created
Note: Use "gpg --full-generate-key" for a full featured key generation dialog.

GnuPG needs to construct a user ID to identify your key.

Real name: hacker65536
Email address: s.hacker65536@gmail.com
You selected this USER-ID:
    "hacker65536 <s.hacker65536@gmail.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/ubuntu/.gnupg/trustdb.gpg: trustdb created
gpg: key 832D311F7993CA01 marked as ultimately trusted
gpg: directory '/home/ubuntu/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/ubuntu/.gnupg/openpgp-revocs.d/6B75C58DA157E3E5E7B125B6832D311F7993CA01.rev'
public and secret key created and signed.

pub   rsa3072 2019-06-28 [SC] [expires: 2021-06-27]
      6B75C58DA157E3E5E7B125B6832D311F7993CA01
uid                      hacker65536 <s.hacker65536@gmail.com>
sub   rsa3072 2019-06-28 [E] [expires: 2021-06-27]

$ gpg -k
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: next trustdb check due at 2021-06-27
/home/ubuntu/.gnupg/pubring.kbx
-------------------------------
pub   rsa3072 2019-06-28 [SC] [expires: 2021-06-27]
      6B75C58DA157E3E5E7B125B6832D311F7993CA01
uid           [ultimate] hacker65536 <s.hacker65536@gmail.com>
sub   rsa3072 2019-06-28 [E] [expires: 2021-06-27]

$ gpg -K
/home/ubuntu/.gnupg/pubring.kbx
-------------------------------
sec   rsa3072 2019-06-28 [SC] [expires: 2021-06-27]
      6B75C58DA157E3E5E7B125B6832D311F7993CA01
uid           [ultimate] hacker65536 <s.hacker65536@gmail.com>
ssb   rsa3072 2019-06-28 [E] [expires: 2021-06-27]
```
