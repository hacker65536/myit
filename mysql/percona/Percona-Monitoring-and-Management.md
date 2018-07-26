# PERCONA MONITORING AND MANAGEMENT

https://www.percona.com/software/database-tools/percona-monitoring-and-management

## doc
https://www.percona.com/doc/percona-monitoring-and-management/index.html

## install from docker

https://www.percona.com/doc/percona-monitoring-and-management/deploy/server/docker.html

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

## Connecting to an Amazon RDS DB instance

https://www.percona.com/doc/percona-monitoring-and-management/amazon-rds.html

instance role needed a plicy of `arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess` 

Menu
 - Query Analytics
   - Add an AWS RDS MySQL or Aurora MySQL Instance
   
   
   
