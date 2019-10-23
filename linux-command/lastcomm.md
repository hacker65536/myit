# lastcomm


```console
$ rpm -qf /usr/bin/lastcomm
psacct-6.6.1-13.amzn2.0.2.x86_64
```

http://www.gnu.org/software/acct/

```
lastcomm [ command-name ... ] [ user-name ... ] [ terminal-name ... ] [ OPTION ... ]
```


example
```
lastcomm --strict-match --command a.out --user root --tty tty0
```


required running service
```
sudo systemctl start psacct
```
