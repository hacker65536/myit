
prepare
--

```console
$ docker pull jenkins/jenkins:lts
```


```console
$ mkdir -p /opt/jenkins/jenkins_home/.cacerts
$ cd /opt/jenkins/jenkins_home/.cacerts
$ chown -R dockerroot. /opt/jenkins/jenkins_home/
```


create ssl cert for https
--
```console
$ openssl req \
-batch \
-nodes \
-x509 \
-newkey rsa:2048 \
-days 3652 \
-subj "/C=JP/ST=Tokyo/L=Shibuya/O=mycompany/OU=infra/CN=mycompany.com" \
-keyout jenkins.key \
-out jenkins.crt
```

convert pkcs#8 to pkcs#5 
```
$ openssl rsa -in jenkins.key -out jenkins.pk
```

import Self-signed certificate for ldaps
--

copy cacerts 
```console
$ docker run --rm --entrypoint cat jenkins/jenkins:lts /docker-java-home/jre/lib/security/cacerts > cacerts 
```
```console
$ keytool -list -keystore cacerts -storepass changeit | grep "Your keystore contains"
Your keystore contains 151 entries
```

import ldaps cert 
```console
$ ldap=my.ldaps-host.com
$ openssl s_client -showcerts -connect ${ldap}:636 < /dev/null 2> /dev/null | openssl x509 -outform PEM >crt
$ docker run --rm -v `pwd`:/tmp/certs openjdk:latest \
bash -c 'cd /tmp/certs && keytool -keystore ./cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias '$ldap' -file crt'
``` 

```console
$ keytool -list -keystore cacerts -storepass changeit | grep "Your keystore contains"
Your keystore contains 152 entries
```

```
$ USER=dockerroot
docker run -d -it -v /opt/jenkins/jenkins_home:/var/jenkins_home \
-p 8080:8080 -p 50000:50000 \
--name jenkins \
-u $(id -u ${USER}):$(id -g ${USER}) \
--env JAVA_OPTS="-Djavax.net.ssl.trustStore=/var/jenkins_home/.cacerts/cacerts -Djavax.net.ssl.trustStorePassword=changeit" \
jenkins/jenkins:lts \
--httpPort=-1 \
--httpsPort=8080 \
--httpsCertificate=/var/jenkins_home/.cacerts/jenkins.crt \
--httpsPrivateKey=/var/jenkins_home/.cacerts/jenkins.pk
```

ldap settings
--
-> global settings -> LDAP

```
server  my.ldaps-host.com
root DN  dc=mycompany,dc=local		
Manager DN uid=readonly,ou=system,dc=mycompany,dc=local
Manager Password xxxxxxxxxx
```
