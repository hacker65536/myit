
```
$ export EDITOR=vim
```

```
$ crontab -e
```

```cron
*  *  *  *  *  some_command
```

```
min hour day month week
0-59 0-23 1-31 1-12 0-7
```

n sec 
```
* * * * * /some/command
* * * * * ( sleep 15 ; /some/command )
* * * * * ( sleep 30 ; /some/command )
* * * * * ( sleep 45 ; /some/command )
```

or
```
* * * * * for i in `seq 0 10 59`;do (sleep ${i} ; command ) & done;
```
