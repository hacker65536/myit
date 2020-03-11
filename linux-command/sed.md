
same

```
tail -n +3 file
```

```
sed -ne '3,$p' file
```


like grep
--

```console
$ sudo sed -n '/ChallengeR/p' /etc/ssh/sshd_config
#ChallengeResponseAuthentication yes
ChallengeResponseAuthentication no
# be allowed through the ChallengeResponseAuthentication and
# PAM authentication via ChallengeResponseAuthentication may bypass
# and ChallengeResponseAuthentication to 'no'.
```

-n : no printing  ( or --quiet  or --silent )


https://www.grymoire.com/Unix/Sed.html#uh-15
