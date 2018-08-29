
## install
https://grafana.com/grafana/download

redhat&centos

```console
$ wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.2-1.x86_64.rpm
$ sudo yum localinstall -y grafana-5.2.2-1.x86_64.rpm 
```
or

http://docs.grafana.org/installation/rpm/
```consoel
$ cat <<'EOF' | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packagecloud.io/grafana/stable/el/7/$basearch
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
```
```console
$ sudo yum install grafana
```
## start service

```console
$ sudo systemctl daemon-reload
$ sudo systemctl start grafana-server
$ sudo systemctl status grafana-server
```

```console
$ sudo systemctl enable grafana-server.service
```

## longin

```console
$ curl checkip.amazonaws.com
```

>There you will see the login page. Default username is admin and default password is admin. 
