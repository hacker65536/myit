
https://github.com/future-architect/vuls/tree/master/setup/docker


# step 1 mkdir
```
mkdir vuls
cd !$
```

# step 2 fetch NVD
```
for i in `seq 2002 $(date +"%Y")`; do \
    docker run --rm -it \
    -v $PWD:/vuls \
    -v $PWD/go-cve-dictionary-log:/var/log/vuls \
    vuls/go-cve-dictionary fetchnvd -years $i; \
  done
```  


# step 2 fetch OVAL

```
docker run --rm -it \
    -v $PWD:/vuls \
    -v $PWD/goval-dictionary-log:/var/log/vuls \
    vuls/goval-dictionary fetch-redhat 5 6 7
```

# step 3 ssh-key

```
$ ls id_rsa
id_rsa
```
be ready

# step 4 configuration
```
cat <<'EOF' > config.toml
[servers]

[servers.amazon]
host         = "172.31.1.3"
port        = "22"
user        = "ec2-user"
keyPath     = "/vuls/id_rsa" # path to ssh private key in docker
EOF
```




# step 5 configtest
```
docker run --rm -it\
    -v $PWD:/vuls \
    -v $PWD/vuls-log:/var/log/vuls \
    vuls/vuls configtest \
    -ssh-native-insecure \
    -config=./config.toml # path to config.toml in docker
```    

need `--ssh-native-insecure` beacuse  default use `StrictHostKeyChecking=yes`

# step 6 scan
```
docker run --rm -it\
    -v $PWD:/vuls \
    -v $PWD/vuls-log:/var/log/vuls \
     -v /etc/localtime:/etc/localtime:ro \
    -e "TZ=Asia/Tokyo" \
    vuls/vuls scan \
    -ssh-native-insecure \
    -config=./config.toml # path to config.toml in docker
```

# step 7 report
```
docker run --rm -it \
    -v $PWD:/vuls \
    -v $PWD/vuls-log:/var/log/vuls \
    -v /etc/localtime:/etc/localtime:ro \
    vuls/vuls report \
    -cvedb-path=/vuls/cve.sqlite3 \
    -ovaldb-path=/vuls/oval.sqlite3 \
    -format-short-text \
    -config=./config.toml # path to config.toml in docker
```


# step 8 report with web
```
docker run -dt \
    -v $PWD:/vuls \
    -p 5111:5111 \
    vuls/vulsrepo
```

check web:5111


# step 9 tui
```
docker run --rm -it \
    -v $PWD:/vuls \
    -v $PWD/vuls-log:/var/log/vuls \
    --entrypoint=bash \
    vuls/vuls
```

```
# vuls tui
```
tab, ctrl+j, ctrl+k, ctrl+u, ctrl+d, ctrl+c


https://github.com/future-architect/vuls#step10-tui

https://github.com/future-architect/vuls#usage-tui
