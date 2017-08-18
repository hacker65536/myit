
```
$ telnet cache 11211

Trying 10.0.0.101...
Connected to cache.
Escape character is '^]'.
stats items
STAT items:1:number 2
STAT items:1:number_hot 0
STAT items:1:number_warm 0
STAT items:1:number_cold 2
STAT items:1:age 852
STAT items:1:evicted 0
STAT items:1:evicted_nonzero 0
STAT items:1:evicted_time 0
STAT items:1:outofmemory 0
STAT items:1:tailrepairs 0
STAT items:1:reclaimed 10
STAT items:1:expired_unfetched 7
STAT items:1:evicted_unfetched 0
STAT items:1:evicted_active 0
STAT items:1:crawler_reclaimed 0
STAT items:1:crawler_items_checked 0
STAT items:1:lrutail_reflocked 0
STAT items:1:moves_to_cold 28
STAT items:1:moves_to_warm 9
STAT items:1:moves_within_lru 0
STAT items:1:direct_reclaims 0
STAT items:2:number 1
STAT items:2:number_hot 0
STAT items:2:number_warm 0
STAT items:2:number_cold 1
STAT items:2:age 978
STAT items:2:evicted 0
STAT items:2:evicted_nonzero 0
STAT items:2:evicted_time 0
STAT items:2:outofmemory 0
STAT items:2:tailrepairs 0
STAT items:2:reclaimed 0
STAT items:2:expired_unfetched 0
STAT items:2:evicted_unfetched 0
STAT items:2:evicted_active 0
STAT items:2:crawler_reclaimed 0
STAT items:2:crawler_items_checked 0
STAT items:2:lrutail_reflocked 0
STAT items:2:moves_to_cold 1
STAT items:2:moves_to_warm 0
STAT items:2:moves_within_lru 0
STAT items:2:direct_reclaims 0
END

stats cachedump 1 2
```


