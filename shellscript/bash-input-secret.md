```bash
#!/bin/env bash


read -s -p 'slack signing secret     :' ss

echo 
echo ${ss: 0:5}xxxxxxxxxxxxxxxxx${ss: -5}
```

```console
$ mkpasswd -s 0 -l 40
agg1swosplwyvqqt7lgYldeoyvpopqstZgircwiu
```
```console
$ sh param.sh
slack signing secret     :  # input copied mkpasswd
agg1sxxxxxxxxxxxxxxxxxrcwiu
```
