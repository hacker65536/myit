
## install

redhat&centos

```
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.4.3-1.x86_64.rpm 
sudo yum localinstall grafana-4.4.3-1.x86_64.rpm 
```
or

via yum repo
```
cat <<'EOF' > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packagecloud.io/grafana/stable/el/6/$basearch
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

# baseurl=https://packagecloud.io/grafana/testing/el/6/$basearch
EOF

yum install grafana
```
