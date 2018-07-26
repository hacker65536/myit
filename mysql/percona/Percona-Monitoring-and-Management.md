# PERCONA MONITORING AND MANAGEMENT

https://www.percona.com/software/database-tools/percona-monitoring-and-management

## install from docker

https://www.percona.com/doc/percona-monitoring-and-management/deploy/server/docker.setting-up.html

```console
$ docker pull percona/pmm-server:latest
```

to create a container for persistent PMM data
```console
$ docker create \
   -v /opt/prometheus/data \
   -v /opt/consul-data \
   -v /var/lib/mysql \
   -v /var/lib/grafana \
   --name pmm-data \
   percona/pmm-server:latest /bin/true
```

```console
$ docker run -d \
   -p 80:80 \
   --volumes-from pmm-data \
   --name pmm-server \
   --restart always \
   percona/pmm-server:latest
```
