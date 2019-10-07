

MONITOR
--

https://redis.io/commands/MONITOR

```
xxxxx.xxxxxx.0001.use1.cache.amazonaws.com:6379> MONITOR
OK
1570409990.291100 [0 10.0.235.134:60774] "get" "aa"
1570410250.198847 [0 10.0.235.134:60774] "get" "adf"
1570410306.681796 [0 10.0.235.134:60858] "get" "aa"
1570410331.234002 [0 10.0.235.134:60866] "get" "ada"
```



```
# echo "get aa" | nc xxxxx.xxxxxx.0001.use1.cache.amazonaws.com 6379
$3
fff
```

