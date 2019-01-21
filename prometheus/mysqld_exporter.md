https://prometheus.io/download/


dl
---

```console
$ wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.11.0/mysqld_exporter-0.11.0.linux-amd64.tar.gz
$ tar zxvf !$:t
```


run
----
`export DATA_SOURCE_NAME='root:my-secret-pw@(127.0.0.1:3306)/'`
```console
$ cd !$:t:r:r
$ export DATA_SOURCE_NAME='mysqld_exporter:a_password@unix(/var/run/mysqld/mysqld.sock)/'4
$ #export DATA_SOURCE_NAME='root:my-secret-pw@(127.0.0.1:3306)/'
$ ./mysqld_exporter
INFO[0000] Starting mysqld_exporter (version=0.11.0, branch=HEAD, revision=5d7179615695a61ecc3b5bf90a2a7c76a9592cdd)  source="mysqld_exporter.go:206"
INFO[0000] Build context (go=go1.10.3, user=root@3d3ff666b0e4, date=20180629-15:00:35)  source="mysqld_exporter.go:207"
INFO[0000] Enabled scrapers:                             source="mysqld_exporter.go:218"
INFO[0000]  --collect.global_status                      source="mysqld_exporter.go:222"
INFO[0000]  --collect.global_variables                   source="mysqld_exporter.go:222"
INFO[0000]  --collect.slave_status                       source="mysqld_exporter.go:222"
INFO[0000]  --collect.info_schema.tables                 source="mysqld_exporter.go:222"
INFO[0000] Listening on :9104                            source="mysqld_exporter.go:232"
```

edit prometheus.yml
----
```yml
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
    - targets: ['localhost:9090']
  - job_name: 'mysqld'
    static_configs:
    - targets:
      - localhost:9104
```

run prometheus
----
```console
$ ./prometheus --config.file=prometheus.yml
```
