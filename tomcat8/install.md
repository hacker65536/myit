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

###with java-1.8

```bash
yum -y install java-1.8.0-openjdk-devel java-1.8.0-openjdk
```
```
alternatives --config java

There are 2 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
*+ 1           /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java
   2           /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.25-0.b18.4.amzn1.x86_64/jre/bin/java

Enter to keep the current selection[+], or type selection number: 2
```
```
alternatives --config javac

There are 2 programs which provide 'javac'.

  Selection    Command
-----------------------------------------------
*+ 1           /usr/lib/jvm/java-1.7.0-openjdk.x86_64/bin/javac
   2           /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.25-0.b18.4.amzn1.x86_64/bin/javac

Enter to keep the current selection[+], or type selection number: 2
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
```
http://hostname:8080
http://hostname:8080/manager  //basic authentication
```
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

```bash
service tomcat8 restart
service httpd start
```
###To be able to access examples/
you can't access to examples/ when using default settings

error log on /var/lib/tomcat8/catalina.yyyy-mm-dd.log
```
16-Dec-2014 07:44:26.698 WARNING [localhost-startStop-1] org.apache.catalina.startup.SetContextPropertiesRule.begin [SetContextPropertiesRule]{Context} Setting property 'allowLinking' to 'true' did not find a matching property.
16-Dec-2014 07:44:26.716 SEVERE [localhost-startStop-1] org.apache.catalina.core.ContainerBase.addChildInternal ContainerBase.addChild: start:
 org.apache.catalina.LifecycleException: Failed to start component [StandardEngine[Catalina].StandardHost[localhost].StandardContext[/examples]]
        at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:154)
        at org.apache.catalina.core.ContainerBase.addChildInternal(ContainerBase.java:725)
        at org.apache.catalina.core.ContainerBase.addChild(ContainerBase.java:701)
        ...more
        
16-Dec-2014 07:44:26.717 SEVERE [localhost-startStop-1] org.apache.catalina.startup.HostConfig.deployDirectory Error deploying web application directory /var/lib/tomcat8/webapps/examples
 java.lang.IllegalStateException: ContainerBase.addChild: start: org.apache.catalina.LifecycleException: Failed to start component [StandardEngine[Catalina].StandardHost[localhost].StandardContext[/examples]]
```
edit context.xml

```bash
vim /etc/tomcat8/context.xml
```
```xml
 <Context>
 <!--
 ...
 -->
 <Resources allowLinking="true"></Resources>
 </Context>
 ```

```
http://hostname/examples
http://hostname/manager
http://hostname/host-manager
```
