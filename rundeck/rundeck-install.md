http://rundeck.org/

```console
$ sudo yum install -y java-1.8.0-openjdk
$ sudo alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java has not been configured as an alternative for java
```

```console
$ java -version
openjdk version "1.8.0_171"
OpenJDK Runtime Environment (build 1.8.0_171-b10)
OpenJDK 64-Bit Server VM (build 25.171-b10, mixed mode)
```

```console
$ sudo yum install -y http://repo.rundeck.org/latest.rpm
$ sudo yum install -y rundeck 
```

change serverURL if dont using localhost
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

```console
$ diff <(sudo sed -e 's/localhost/'$(curl -Ss checkip.amazonaws.com)'/' /etc/rundeck/rundeck-config.properties) <(sudo cat /etc/rundeck/rundeck-config.properties)
8c8
< grails.serverURL=http://xxx.xxx.xxx.xxx:4440
---
> grails.serverURL=http://localhost:4440

$ sudo sed -e 's/localhost/'$(curl -Ss checkip.amazonaws.com)'/' -i /etc/rundeck/rundeck-config.properties
```

start
```console
$ sudo systemctl start rundeckd
$ journalctl -u rundeckd --no-pager
-- Logs begin at Thu 2018-05-24 02:26:05 UTC, end at Tue 2018-05-29 05:55:21 UTC. --
May 29 05:55:21 ip-172-31-27-49.us-east-2.compute.internal systemd[1]: Starting SYSV: rundeckd, providing rundeckd...
May 29 05:55:21 ip-172-31-27-49.us-east-2.compute.internal rundeckd[20754]: Starting rundeckd: [  OK  ]
May 29 05:55:21 ip-172-31-27-49.us-east-2.compute.internal systemd[1]: Started SYSV: rundeckd, providing rundeckd.
```

```
# netstat -plunt |grep java
tcp6       0      0 :::4440                 :::*                    LISTEN      30344/java
```

access to http://myhost:4440
