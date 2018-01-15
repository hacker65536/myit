https://qiita.com/testnin2/items/7490ff01a4fe1c7ad61f


ip r (alias)
```
$ ip route show # or list
default via 172.31.32.1 dev eth0
169.254.169.254 dev eth0
172.17.0.0/16 dev docker0  proto kernel  scope link  src 172.17.0.1 linkdown
172.18.0.0/16 dev docker_gwbridge  proto kernel  scope link  src 172.18.0.1
172.19.0.0/16 dev br-564e25dd900b  proto kernel  scope link  src 172.19.0.1 linkdown
172.31.32.0/20 dev eth0  proto kernel  scope link  src 172.31.38.241
```

