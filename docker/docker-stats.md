
like as top
```
docker stats <hash>
```

```
$ docker stats --help

Usage:  docker stats [OPTIONS] [CONTAINER...]

Display a live stream of container(s) resource usage statistics

Options:
  -a, --all             Show all containers (default shows just running)
      --format string   Pretty-print images using a Go template
      --help            Print usage
      --no-stream       Disable streaming stats and only pull the first result
```

```
$ docker stats --no-stream
CONTAINER           CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
1e2a86a323a0        0.37%               903 MiB / 1 GiB     88.18%              2.15 MB / 2.18 MB   0 B / 3.31 MB       0
66e88b3de688        0.76%               914.7 MiB / 1 GiB   89.33%              2.18 MB / 2.15 MB   434 kB / 2.99 MB    0
```

show cotianername
```
$ docker stats $(docker ps --format={{.Names}})
```
