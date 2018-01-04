
https://nginx.org/en/linux_packages.html#stable

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
gpgcheck=0
enabled=1
```

>Replace “OS” with “rhel” or “centos”, depending on the distribution used, and “OSRELEASE” with “6” or “7”, for 6.x or 7.x versions, respectively.


/etc/yum.repos.d/nginx.repo
```
cat <<'EOF' > /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
EOF
```
```
sudo bash -c 'cat <<"EOF" > /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
EOF'
```

```
yum install nginx
```

```
$ sudo yum list installed nginx
Loaded plugins: langpacks, update-motd
Installed Packages
nginx.x86_64                               1:1.12.2-1.el7_4.ngx                               @nginx
```
