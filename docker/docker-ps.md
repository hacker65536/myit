```
$ docker ps --help

Usage:  docker ps [OPTIONS]

List containers

Options:
  -a, --all             Show all containers (default shows just running)
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print containers using a Go template
      --help            Print usage
  -n, --last int        Show n last created containers (includes all states) (default -1)
  -l, --latest          Show the latest created container (includes all states)
      --no-trunc        Don't truncate output
  -q, --quiet           Only display numeric IDs
  -s, --size            Display total file sizes
```

latest container ID
```
docker ps -ql
```

```
docker ps -s
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES                 SIZE
d300aa18e0a2        nginx               "nginx -g 'daemon ..."   7 seconds ago       Up 6 seconds        80/tcp              flamboyant_thompson   2 B (virtual 107 MB)
```

writable size (virtual read-only size)
