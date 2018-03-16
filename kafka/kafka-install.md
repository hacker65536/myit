http://kafka.apache.org/downloads.html
https://www.apache.org/dyn/closer.cgi?path=/kafka/1.0.1/kafka-1.0.1-src.tgz

source install

require java and gradle
```
yum install -y java-devel
mkdir /opt/gradle
curl -SsL -O https://services.gradle.org/distributions/gradle-4.5-bin.zip
unzip -d /opt/gradle gradle-4.5-bin.zip
export PATH=$PATH:/opt/gradle/gradle-4.5/bin
```


```
curl -SsL -O http://ftp.jaist.ac.jp/pub/apache/kafka/1.0.1/kafka-1.0.1-src.tgz
tar zxvf !$:t
cd !$:t:r
gradle
./gradlew jar
```

```
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
bin/kafka-server-start.sh -daemon config/server.properties
```
```
bin/kafka-topics.sh --create --zookeeper localhost:2181 
--replication-factor 1 --partitions 1 --topic test
OpenJDK 64-Bit Server VM warning: If the number of processors is expected to increase from one, then                                                                          you should configure the number of parallel GC threads appropriately using -XX:ParallelGCThreads=N
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/core/build/dependant-libs-2.11.12/slf4j-log4                                                                         j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/tools/build/dependant-libs-2.11.12/slf4j-log                                                                         4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/api/build/dependant-libs/slf4j-log4j                                                                         12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/transforms/build/dependant-libs/slf4                                                                         j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/runtime/build/dependant-libs/slf4j-l                                                                         og4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/file/build/dependant-libs/slf4j-log4                                                                         j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/json/build/dependant-libs/slf4j-log4                                                                         j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Created topic "test".
```

```
bin/kafka-topics.sh --list --zookeeper localhost:2181
OpenJDK 64-Bit Server VM warning: If the number of processors is expected to increase from one, then you should configure the number of parallel GC threads appropriately using -XX:ParallelGCThreads=N
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/core/build/dependant-libs-2.11.12/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/tools/build/dependant-libs-2.11.12/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/api/build/dependant-libs/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/transforms/build/dependant-libs/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/runtime/build/dependant-libs/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/file/build/dependant-libs/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/root/kafka-1.0.1-src/connect/json/build/dependant-libs/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
test

```
