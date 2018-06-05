install rundeck
===================

https://www.rundeck.com/open-source


require
------------
```console
$ sudo yum install -y java-1.8.0-openjdk
```
```console
$ java -version
openjdk version "1.8.0_171"
OpenJDK Runtime Environment (build 1.8.0_171-b10)
OpenJDK 64-Bit Server VM (build 25.171-b10, mixed mode)
```

install
------

```console
$ sudo yum install -y http://repo.rundeck.org/latest.rpm
$ sudo yum install -y rundeck 
```
```console
$ sudo yum list installed "rundeck*"
Loaded plugins: langpacks, priorities, update-motd
Installed Packages
rundeck.noarch                                2.11.3-1.54.GA                          @rundeck-release-bintray
rundeck-config.noarch                         2.11.3-1.54.GA                          @rundeck-release-bintray
rundeck-repo.noarch                           4-0                                     installed
```

allow external access
-----------

`/etc/rundeck/rundeck-config.properties`
```ini
#loglevel.default is the default log level for jobs: ERROR,WARN,INFO,VERBOSE,DEBUG
loglevel.default=INFO
rdeck.base=/var/lib/rundeck

#rss.enabled if set to true enables RSS feeds that are public (non-authenticated)
rss.enabled=false
# change hostname here
grails.serverURL=http://localhost:4440
dataSource.dbCreate = update
dataSource.url = jdbc:h2:file:/var/lib/rundeck/data/rundeckdb;MVCC=true
```

to

```console
$ diff <(sudo sed -e 's/localhost/'$(curl -Ss checkip.amazonaws.com)'/' /etc/rundeck/rundeck-config.properties) <(sudo cat /etc/rundeck/rundeck-config.properties)
8c8
< grails.serverURL=http://xxx.xxx.xxx.xxx:4440
---
> grails.serverURL=http://localhost:4440

$ sudo sed -e 's/localhost/'$(curl -Ss checkip.amazonaws.com)'/' -i /etc/rundeck/rundeck-config.properties
```

```console
$ sudo systemctl start rundeckd
$ journalctl -u rundeckd --no-pager
-- Logs begin at Tue 2018-06-05 01:36:08 UTC, end at Tue 2018-06-05 03:38:51 UTC. --
Jun 05 03:38:51 ip-172-31-22-250.us-east-2.compute.internal systemd[1]: Starting SYSV: rundeckd, providing rundeckd...
Jun 05 03:38:51 ip-172-31-22-250.us-east-2.compute.internal rundeckd[3583]: Starting rundeckd: [  OK  ]
Jun 05 03:38:51 ip-172-31-22-250.us-east-2.compute.internal systemd[1]: Started SYSV: rundeckd, providing rundeckd.
```

```console
$ sudo netstat -plunt | grep [j]ava
tcp6       0      0 :::4440                 :::*                    LISTEN      3594/java
```

configure
-----


