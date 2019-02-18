https://coreos.com/etcd/

https://coreos.com/etcd/docs/latest/getting-started-with-etcd.html

https://github.com/etcd-io/etcd


install
--

https://github.com/etcd-io/etcd/releases

```
ETCD_VER=v3.3.12

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

# if google isn't available
ret=$(curl -I -L -s -o /dev/null   ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETVER}-linux-amd64.tar.gz -w "%{http_code}")
if [[ $ret != 200 ]]
then
DOWNLOAD_URL=${GITHUB_URL}
fi

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
```

```console
$ /tmp/etcd-download-test/etcd --version
etcd Version: 3.3.12
Git SHA: d57e8b8
Go Version: go1.10.8
Go OS/Arch: linux/amd64
```

```console
$ ETCDCTL_API=3 /tmp/etcd-download-test/etcdctl version
etcdctl version: 3.3.12
API version: 3.3
```
