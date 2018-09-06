# PERCONA MONITORING AND MANAGEMENT


percona製のdatabaseモニターリングツール

__official__

https://www.percona.com/software/database-tools/percona-monitoring-and-management

__document__

https://www.percona.com/doc/percona-monitoring-and-management/index.html

__source__

https://github.com/percona/pmm-server

高負荷をrdsに掛けるとmackerelではmetricsが取得できないため当ツールを利用


- rdsが提供する拡張モニタリングのデータの取得に対応している
- databaseの詳細なデータが各種揃っている
- aws連携がとても簡易
- PrometheusとGrafanaのOSSが元なので何かあれば調べられる
- ただ枯れていないので破壊的変更はそれなりにある


## install

pull image
```console
$ docker pull percona/pmm-server:latest
```

create data(volume) container
```console
$ docker create \
   -v /opt/prometheus/data \
   -v /opt/consul-data \
   -v /var/lib/mysql \
   -v /var/lib/grafana \
   --name pmm-data \
   percona/pmm-server:latest /bin/true
```   
run server
```console
$ docker run -d \
   -p 80:80 \
   --volumes-from pmm-data \
   --name pmm-server \
   --restart always \
   percona/pmm-server:latest
```

- data containerにmetricsのデータが蓄積していくため、メインはこのコンテナとなる
- server containerは破壊的updateがない限り、新しいものに置き換えていける



## configure

rdsのモニタリング、さらに拡張モニタリングを行うにはinstanceに権限の付与が必要

- AmazonRDSReadOnlyAccessのポリシーがアタッチされたrole
- RDSOSMetricsのloggroupへの`FilterLogEvents`アクション

起動後にブラウザから該当instanceのIPにアクセスすると右上のメニューの `≡ PMM`から 
`Add an AWS RDS MySQL or Aurora MySQL Instance`でmetricsを取得したいRDSインスタンスを選択し
`Enabled`をclickしdbの`MySQL username`と`MySQL Password`を入力する


## backup

create backup dir
```console
$ mkdir pmm-data-backup
$ cd !$
$ mkdir -p {opt/prometheus,var/lib}
```

stop server container
```console
$ docker stop pmm-server
```

backup from data container
```console
$ docker cp pmm-data:/opt/prometheus/data opt/prometheus/
$ docker cp pmm-data:/opt/consul-data opt/
$ docker cp pmm-data:/var/lib/mysql var/lib/
$ docker cp pmm-data:/var/lib/grafana var/lib/
```

upload to s3

```console
$ aws s3 sync pmm-data-backup s3://<BUCKET>/pmm-data-backup
```

restart server container
```console
$ docker start pmm-server
```

## restore

if container alread exists ,stop and rename container before restore.


create new data container
```console
$ docker create \
   -v /opt/prometheus/data \
   -v /opt/consul-data \
   -v /var/lib/mysql \
   -v /var/lib/grafana \
   --name pmm-data \
   percona/pmm-server:latest /bin/true
```

download backup files
```console
$ aws s3 sycn s3://<BUCKET>/pmm-data-backup .
```

change directory to the direcotry of backup files
```console
$ cd pmm-data-backup
```

copy files
```console
$ docker cp opt/prometheus/data pmm-data:/opt/prometheus/
$ docker cp opt/consul-data pmm-data:/opt/
$ docker cp var/lib/mysql pmm-data:/var/lib/
$ docker cp var/lib/grafana pmm-data:/var/lib/
```

change owner
```console
$ docker run --rm --volumes-from pmm-data -it percona/pmm-server:latest chown -R pmm:pmm /opt/prometheus/data /opt/consul-data
$ docker run --rm --volumes-from pmm-data -it percona/pmm-server:latest chown -R grafana:grafana /var/lib/grafana
$ docker run --rm --volumes-from pmm-data -it percona/pmm-server:latest chown -R mysql:mysql /var/lib/mysql
```

run server
```console
$ docker run -d \
   -p 80:80 \
   --volumes-from pmm-data \
   --name pmm-server \
   --restart always \
   percona/pmm-server:latest
```


## update

stop server container
```console
$ docker stop pmm-server 
```

rename for backup
```console
$ docker rename pmm-server pmm-server-backup
```

pull new docker image
```console
$ docker pull percona/pmm-server:latest
```

run server
```console
$ docker run -d \
   -p 80:80 \
   --volumes-from pmm-data \
   --name pmm-server \
   --restart always \
   percona/pmm-server:latest
```

remove old server
```console
$ docker rm pmm-server-backup
```
