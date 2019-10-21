error massage
```
bash: warning: setlocale: LC_CTYPE: cannot change locale (en_us.UTF-8)
```

situation

local mac
```console
$ locale
LANG="en_us.UTF-8"
LC_COLLATE="en_us.UTF-8"
LC_CTYPE="en_us.UTF-8"
LC_MESSAGES="en_us.UTF-8"
LC_MONETARY="en_us.UTF-8"
LC_NUMERIC="en_us.UTF-8"
LC_TIME="en_us.UTF-8"
LC_ALL=
```
`/etc/ssh/ssh_config`
```
Host *
        SendEnv LANG LC_*
```


remote amzlinux2
```
$ locale
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
LANG=en_us.UTF-8
LC_CTYPE="en_us.UTF-8"
LC_NUMERIC="en_us.UTF-8"
LC_TIME="en_us.UTF-8"
LC_COLLATE="en_us.UTF-8"
LC_MONETARY="en_us.UTF-8"
LC_MESSAGES="en_us.UTF-8"
LC_PAPER="en_us.UTF-8"
LC_NAME="en_us.UTF-8"
LC_ADDRESS="en_us.UTF-8"
LC_TELEPHONE="en_us.UTF-8"
LC_MEASUREMENT="en_us.UTF-8"
LC_IDENTIFICATION="en_us.UTF-8"
LC_ALL=
```

solution
--



`~/.bash_profile`
```
$ cat ~/.bash_profile
export LANG="en_us.UTF-8"
export LC_ALL=en_US.UTF-8
```

or
comment out `/etc/ssh/ssh_config`
```
Host *
#        SendEnv LANG LC_*
```

or

iterm2 -> profile -> Terminal -> Set locale variables automatically (remove check)
