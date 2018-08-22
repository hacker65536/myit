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
   
   
   
## enable iframe embed 

```console
$ docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                         NAMES
0aa407221158        percona/pmm-server:latest   "/opt/entrypoint.sh"   13 minutes ago      Up 13 minutes       0.0.0.0:80->80/tcp, 443/tcp   pmm-server
```
```console
$ docker exec -it 0aa407221158 bash
```

edit `X-Frame-Options`
```nginx
# cat /etc/nginx/conf.d/pmm-ssl.conf
ssl_protocols                   TLSv1 TLSv1.1 TLSv1.2;
ssl_prefer_server_ciphers       on;
ssl_ciphers                     "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
ssl_ecdh_curve                  secp384r1;
ssl_session_cache               shared:SSL:10m;
ssl_session_tickets             off;
ssl_stapling                    on;
ssl_stapling_verify             on;
resolver                        8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout                3s;

# HSTS
add_header                      Strict-Transport-Security "max-age=63072000; includeSubDomains";

# CWE-693, CWE-16

# comment out X-Frame-Options DENY
#add_header                     X-Frame-Options DENY;   

add_header                      X-Content-Type-Options nosniff;
add_header                      X-XSS-Protection "1; mode=block";

# CWE-524, CWE-525
add_header                      Cache-control "no-store";
add_header                      Pragma "no-cache";
```

```
$ docker kill -s HUP 0aa407221158
```
