http://rundeck.org/

```
yum install -y java-1.8.0-openjdk
alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```

```
# java -version
openjdk version "1.8.0_161"
OpenJDK Runtime Environment (build 1.8.0_161-b14)
OpenJDK 64-Bit Server VM (build 25.161-b14, mixed mode)
```

```
yum install -y http://repo.rundeck.org/latest.rpm
yum install -y rundeck 
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

```
sed -i 's/localhost/'$(curl -Ss checkip.amazonaws.com)'/' /etc/rundeck/rundeck-config.properties
```

restart
```
systemctl restart rundeckd
```

```
# netstat -plunt |grep java
tcp6       0      0 :::4440                 :::*                    LISTEN      30344/java
```

access to http://myhost:4440
