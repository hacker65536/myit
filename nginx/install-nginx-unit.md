
install nginx-unit
=============

Amazon linux 2
--------

```
# cat /etc/system-release
Amazon Linux release 2 (2017.12) LTS Release Candidate
```
create repo
```
cat <<'EOF'>/etc/yum.repos.d/unit.repo
[unit]
name=unit repo
baseurl=https://packages.nginx.org/unit/amzn2/$releasever/$basearch/
gpgcheck=0
enabled=1
EOF
```

install unit 
```
yum install -y unit
```

install additional module packages

```
yum install unit-php unit-python unit-go unit-perl
```

```
systemctl start unit
```

```
# systemctl status unit
● unit.service - NGINX Unit
   Loaded: loaded (/usr/lib/systemd/system/unit.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2018-04-16 03:29:56 UTC; 4min 6s ago
  Process: 3561 ExecStart=/usr/sbin/unitd $UNITD_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 3562 (unitd)
   CGroup: /system.slice/unit.service
           ├─3562 unit: main [/usr/sbin/unitd]
           ├─3564 unit: controller
           └─3565 unit: router

Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal systemd[1]: Starting NGINX Unit...
Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal unitd[3561]: 2018/04/16 03:29:56 [inf...
Apr 16 03:29:56 ip-172-31-29-117.us-east-2.compute.internal systemd[1]: Started NGINX Unit.
Hint: Some lines were ellipsized, use -l to show in full.
```


ref http://unit.nginx.org/configuration/
```
cat <<'EOF'> start.json
{
    "listeners": {
        "*:8300": {
            "application": "blogs"
        }
    },

    "applications": {
        "blogs": {
            "type": "php",
            "processes": 20,
            "root": "/www/blogs/scripts",
            "index": "index.php"
        }
    }
}
EOF
```
```
mkdir -p /www/blogs/scripts
```
```
# curl -X PUT -d @./start.json  --unix-socket /run/control.unit.sock http://localhost/
{
        "success": "Reconfiguration done."
}
```

```
# curl --unix-socket /run/control.unit.sock http://localhost/
{
        "listeners": {
                "*:8300": {
                        "application": "blogs"
                }
        },

        "applications": {
                "blogs": {
                        "type": "php",
                        "processes": 20,
                        "root": "/www/blogs/scripts",
                        "index": "index.php"
                }
        }
}
```
