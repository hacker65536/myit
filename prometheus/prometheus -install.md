# prometheus

https://prometheus.io/docs/prometheus/latest/getting_started/


## install from source
https://prometheus.io/download/

```
$ wget -O - https://github.com/prometheus/prometheus/releases/download/v2.12.0/prometheus-2.12.0.linux-amd64.tar.gz | tar zxvf -
```

```
$ cd prometheus-2.12.0.linux-amd64/
$ ./prometheus --config.file=prometheus.yml
```

http://host:9090

http://host:9090/metrics

## run from docker

```
docker run -p 9090:9090 -v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml  prom/prometheus
```

or 
```
docker run -p 9090:9090 -v /prometheus-data   prom/prometheus -config.file=/prometheus-data/prometheus.yml
```

## Using the expression browser

input `prometheus_target_interval_length_seconds` into Expression field and press Enter

