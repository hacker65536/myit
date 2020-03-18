```bash
date +'%Y-%m-%d'
```


to unixtime
```bash
date +%s
1465363650
```

to str
```bash
date -d "@1465363650"
```

format
```
date -d "@1465364068" +"%F %R:%S"
```

to long (for aws cloudwatch log)
> %N     nanoseconds (000000000..999999999)
```
date +%s%3N
1584510188036
```
