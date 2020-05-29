
https://stackoverflow.com/questions/11904907/redirect-stdout-and-stderr-to-function


```bash
function err (){
   read IN
   echo $IN
   exit 1
}

somecmd 2>&1 | err

```


example
```bash
#!/usr/bin/env bash


err(){
        read IN
        echo $IN
}

tail /var/log/maillog  2>&1 | err
```

```console
❯ sh log.sh
tail: cannot open ‘/var/log/maillog’ for reading: Permission denied
```
