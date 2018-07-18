```console
$ sudo yum-config-manager --enable mysql56-community
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
===================================== repo: mysql56-community ======================================
[mysql56-community]
async = True
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/2
baseurl = http://repo.mysql.com/yum/mysql-5.6-community/el/7/x86_64/
cache = 0
cachedir = /var/cache/yum/x86_64/2/mysql56-community
check_config_file_age = True
compare_providers_priority = 80
cost = 1000
deltarpm_metadata_percentage = 100
deltarpm_percentage =
enabled = 1
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/2/mysql56-community/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/2/mysql56-community/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
hdrdir = /var/cache/yum/x86_64/2/mysql56-community/headers
http_caching = all
includepkgs =
ip_resolve =
keepalive = True
keepcache = False
mddownloadpolicy = sqlite
mdpolicy = group:small
mediaid =
metadata_expire = 21600
metadata_expire_filter = read-only:present
metalink =
minrate = 0
mirrorlist =
mirrorlist_expire = 86400
name = MySQL 5.6 Community Server
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/2/mysql56-community
pkgdir = /var/cache/yum/x86_64/2/mysql56-community/packages
priority = 99
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
report_instanceid = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
ui_id = mysql56-community/x86_64
ui_repoid_vars = releasever,
   basearch
username =
```
```console
$ repoquery -f mysql-server|sort
mariadb-server-3:10.2.10-2.amzn2.0.1.x86_64
mysql-community-server-0:5.6.15-4.el7.x86_64
mysql-community-server-0:5.6.16-1.el7.x86_64
mysql-community-server-0:5.6.17-4.el7.x86_64
mysql-community-server-0:5.6.19-2.el7.x86_64
mysql-community-server-0:5.6.20-4.el7.x86_64
mysql-community-server-0:5.6.21-2.el7.x86_64
mysql-community-server-0:5.6.22-2.el7.x86_64
mysql-community-server-0:5.6.23-2.el7.x86_64
mysql-community-server-0:5.6.23-3.el7.x86_64
mysql-community-server-0:5.6.24-3.el7.x86_64
mysql-community-server-0:5.6.25-2.el7.x86_64
mysql-community-server-0:5.6.26-2.el7.x86_64
mysql-community-server-0:5.6.27-2.el7.x86_64
mysql-community-server-0:5.6.28-2.el7.x86_64
mysql-community-server-0:5.6.29-2.el7.x86_64
mysql-community-server-0:5.6.30-2.el7.x86_64
mysql-community-server-0:5.6.31-2.el7.x86_64
mysql-community-server-0:5.6.32-2.el7.x86_64
mysql-community-server-0:5.6.33-2.el7.x86_64
mysql-community-server-0:5.6.34-2.el7.x86_64
mysql-community-server-0:5.6.35-2.el7.x86_64
mysql-community-server-0:5.6.36-2.el7.x86_64
mysql-community-server-0:5.6.37-2.el7.x86_64
mysql-community-server-0:5.6.38-2.el7.x86_64
mysql-community-server-0:5.6.39-2.el7.x86_64
mysql-community-server-0:5.6.40-2.el7.x86_64
```

```console
$ sudo yum install \
mysql-community-server-0:5.6.36-2.el7.x86_64 \
mysql-community-client-0:5.6.36-2.el7.x86_64 \
mysql-community-common-0:5.6.36-2.el7.x86_64 \
mysql-community-devel-0:5.6.36-2.el7.x86_64 \
mysql-community-libs-0:5.6.36-2.el7.x86_64
```
