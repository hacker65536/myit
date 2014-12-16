#tomcat8

##env
```bash
uname -a
Linux ip-xxx-xxx-xxx-xxx 3.14.20-20.44.amzn1.x86_64 #1 SMP Mon Oct 1 00:00:00 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

##install
```bash
yum install -y tomcat8 
```

```bash
$ java -version
java version "1.7.0_71"
OpenJDK Runtime Environment (amzn-2.5.3.1.49.amzn1-x86_64 u71-b14)
OpenJDK 64-Bit Server VM (build 24.65-b04, mixed mode)
```

###javac
```bash
yum install -y java-1.7.0-openjdk-devel
```

```bash
$ javac -version
javac 1.7.0_71
```

###sample & manager
```bash
yum install -y tomcat8-admin-webapps tomcat8-webapps
#optional tomcat8-docs-webapp tomcat8-log4j
```

###settings manager
```bash
vim /etc/tomcat8/tomcat-users.xml
```

```xml
<role rolename="manager-gui"/>
<role rolename="admin-gui"/>
<user username="tomcat" password="s3cret" roles="manager-gui,admin-gui"/>
```
```bash
service tomcat8 start
```

http://hostname:8080/manager  
or  
http://hostname:8080 ->[server status]

###with apache
```bash
yum install httpd24
```

```bash
vim /etc/httpd/conf.d/tomcat.conf
```

```apache
<Location /examples >
ProxyPass ajp://localhost:8009/examples
</Location>
<Location /manager >
ProxyPass ajp://localhost:8009/manager
</Location>
<Location /host-manager >
ProxyPass ajp://localhost:8009/host-manager
</Location>
```

comment out default port 8080
```bash
vim /etc/tomcat8/server.xml
```
```xml
    <!--
    <Connector executor="tomcatThreadPool"
               port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />
    -->
```
###access examples

```xml
 <Context>
 <!--
 ...
 -->
 <Resources allowLinking="true"></Resources>
 </Context>
