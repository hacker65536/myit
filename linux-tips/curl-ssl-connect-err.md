
```console
$ cat /etc/centos-release
CentOS release 6.4 (Final)
```

```console
$ curl -fsSL https://mackerel.io/file/script/setup-all-yum.sh | MACKEREL_APIKEY='xxxxxxxxxxxxxxxxxx' sh
curl: (35) SSL connect error
```

```console
$ curl -V
curl 7.19.7 (x86_64-redhat-linux-gnu) libcurl/7.19.7 NSS/3.14.0.0 zlib/1.2.3 libidn/1.18 libssh2/1.4.2
Protocols: tftp ftp telnet dict ldap ldaps http file https ftps scp sftp
Features: GSS-Negotiate IDN IPv6 Largefile NTLM SSL libz
```

```console
$ curl -fsSL https://mackerel.io/file/script/setup-all-yum.sh --verbose
* About to connect() to mackerel.io port 443 (#0)
*   Trying 52.198.226.45... connected
* Connected to mackerel.io (52.198.226.45) port 443 (#0)
* Initializing NSS with certpath: sql:/etc/pki/nssdb
*   CAfile: /etc/pki/tls/certs/ca-bundle.crt
  CApath: none
* NSS error -5961
* Closing connection #0
* SSL connect error
curl: (35) SSL connect error
```

`NSS error -5961`

```console
$ rpm -q nss
nss-3.14.0.0-12.el6.x86_64
```

```
$ wget https://mackerel.io/file/script/setup-all-yum.sh
--2019-01-31 11:01:01--  https://mackerel.io/file/script/setup-all-yum.sh
Resolving mackerel.io... 52.196.35.56
Connecting to mackerel.io|52.196.35.56|:443... connected.
ERROR: certificate common name “*.mackerel.io” doesn’t match requested host name “mackerel.io”.
To connect to mackerel.io insecurely, use ‘--no-check-certificate’.
```

```
$ wget --no-check-certificate https://mackerel.io/file/script/setup-all-yum.sh
```

```console
$ sudo yum  install mackerel-agent mackerel-agent-plugins mackerel-check-plugins
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * base: ftp.tsukuba.wide.ad.jp
 * extras: ftp.tsukuba.wide.ad.jp
 * updates: ftp.tsukuba.wide.ad.jp
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package mackerel-agent.noarch 0:0.59.0-1 will be installed
---> Package mackerel-agent-plugins.noarch 0:0.54.0-1 will be installed
---> Package mackerel-check-plugins.noarch 0:0.27.0-1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

===========================================================================================================================
 Package                                 Arch                    Version                   Repository                 Size
===========================================================================================================================
Installing:
 mackerel-agent                          noarch                  0.59.0-1                  mackerel                  3.7 M
 mackerel-agent-plugins                  noarch                  0.54.0-1                  mackerel                   87 M
 mackerel-check-plugins                  noarch                  0.27.0-1                  mackerel                   36 M

Transaction Summary
===========================================================================================================================
Install       3 Package(s)

Total size: 127 M
Installed size: 295 M
Is this ok [y/N]: y
Downloading Packages:
warning: rpmts_HdrFromFdno: Header V4 DSA/SHA1 Signature, key ID c2b48821: NOKEY


Public key for mackerel-check-plugins-0.27.0-1.noarch.rpm is not installed
```



```bash
#!/bin/sh

set -e

echo ${MACKEREL_APIKEY:?'Please execute this script with `MACKEREL_APIKEY` environment variable'} >/dev/null

sudo -k

echo "This script requires superuser authority to setup Mackerel agent:"

# yum repo setup part is taken from setup-yum.sh!
sudo MACKEREL_APIKEY=$MACKEREL_APIKEY sh <<'SCRIPT'
  set -x

  if command -v curl; then
    http_get="curl -LfsS"
  elif command -v wget; then
    http_get="wget -q -O -"
  fi
  if [ "$http_get" = "" ]; then
    echo "curl or wget are required to install the mackerel-agent"
    exit 1
  fi

  # import GPG key
  gpgkey_path=`mktemp`
  $http_get https://mackerel.io/file/cert/GPG-KEY-mackerel > $gpgkey_path
  rpm --import $gpgkey_path
  rm $gpgkey_path

  # add config for mackerel yum repos
  cat >/etc/yum.repos.d/mackerel.repo <<'EOF';
[mackerel]
name=mackerel-agent
baseurl=http://yum.mackerel.io/centos/$basearch
gpgcheck=1
EOF

  # install mackerel-agent
  yum install -y mackerel-agent

  # setup mackerel-agent.conf
  mackerel-agent init -apikey="$MACKEREL_APIKEY"

  # start mackerel-agent!
  /etc/init.d/mackerel-agent start
SCRIPT

echo '*************************************'
echo ''
echo '     Done! Welcome to Mackerel!'
echo ''
echo '*************************************'
```

`http_get="wget -q -O -"` => `http_get="wget -q -O --no-check-certificate - "`
