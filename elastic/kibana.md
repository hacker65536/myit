
rpm 
```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo tee -a /etc/yum.repos.d/elasticsearch.repo > /dev/null <<'EOF'
[kibana-5.x]
name=Kibana repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
```

```
sudo yum install kibana
```

```
$ sudo service kibana start
kibana started
```
```
$ ps aux|grep [k]ibana
kibana    6619  9.6  1.6 1190452 128916 pts/0  Sl   05:39   0:02 /usr/share/kibana/bin/../node/bin/node --no-warnings /usr/share/kibana/bin/../src/cli -c /etc/kibana/kibana.yml
```


configure access from remote

/etc/kibana/kibana.yml
```yml
#server.host: "localhost"
server.host: "172.31.1.1"
```
