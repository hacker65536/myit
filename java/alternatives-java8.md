```
alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```


```
[ec2-user@ip-172-31-36-96 ~]$ java -version
java version "1.7.0_151"
OpenJDK Runtime Environment (amzn-2.6.11.0.74.amzn1-x86_64 u151-b00)
OpenJDK 64-Bit Server VM (build 24.151-b00, mixed mode)
[ec2-user@ip-172-31-36-96 ~]$ sudo alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
[ec2-user@ip-172-31-36-96 ~]$ java -version
openjdk version "1.8.0_141"
OpenJDK Runtime Environment (build 1.8.0_141-b16)
OpenJDK 64-Bit Server VM (build 25.141-b16, mixed mode)
```
