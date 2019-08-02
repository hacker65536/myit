#  chsh

chsh - change your login shell


install
--

```console
# sudo yum search chsh
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
348 packages excluded due to repository priority protections
========================================== Matched: chsh ===========================================
util-linux-user.x86_64 : libuser based util-linux utilities
```

```console
# sudo yum install util-linux-user
```



change bash to fish
--


```console
$ whereis fish
fish: /usr/bin/fish /etc/fish /usr/share/fish /usr/share/man/man1/fish.1.gz
```

```console
$ chsh -l
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
/bin/tcsh
/bin/csh
/usr/bin/fish
```

```console
$ cat /etc/shells
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
/bin/tcsh
/bin/csh
/usr/bin/fish
```


```console
$ chsh -s /usr/bin/fish
```



ref
--

https://serverfault.com/questions/202468/changing-the-shell-using-chsh-via-the-command-line-in-a-script

https://askubuntu.com/questions/812420/chsh-always-asking-a-password-and-get-pam-authentication-failure
