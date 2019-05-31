
prepare
--

```console
$ docker pull jenkins/jenkins:lts
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
-keyout example.key \
-out example.crt 
```

import Self-signed certificate for ldaps
--

copy cacerts 
```console
$ docker run --rm --entrypoint cat jenkins/jenkins:lts /docker-java-home/jre/lib/security/cacerts > cacerts 
```

import ldaps cert 
```console
$ ldap=my.ldaps-host.com
$ openssl s_client -showcerts -connect ${ldap}:636 < /dev/null 2> /dev/null | openssl x509 -outform PEM >crt
$ docker run --rm -v `pwd`:/tmp/certs openjdk:latest \
bash -c 'cd /tmp/certs && keytool -keystore ./cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias '$ldap' -file crt'
``` 
