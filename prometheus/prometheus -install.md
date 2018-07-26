# prometheus

https://prometheus.io/docs/prometheus/latest/getting_started/


## install from source
https://prometheus.io/download/

```
curl -SsLO https://github.com/prometheus/prometheus/releases/download/v2.3.2/prometheus-2.3.2.linux-amd64.tar.gz
tar xf !$:t
cd !$:r:r
```

```
./prometheus --config.file=prometheus.yml
```

http://host:9090

## using docker

```
docker run -p 9090:9090 -v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml  prom/prometheus
```

or 
```
docker run -p 9090:9090 -v /prometheus-data   prom/prometheus -config.file=/prometheus-data/prometheus.yml
```
