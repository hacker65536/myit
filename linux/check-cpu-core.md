https://access.redhat.com/ja/solutions/2159401


```
$ grep physical.id /proc/cpuinfo | sort -u | wc -l
2
```

```
$ grep cpu.cores /proc/cpuinfo | sort -u
cpu cores :4
```

```
$ grep processor /proc/cpuinfo | wc -l
16
```
