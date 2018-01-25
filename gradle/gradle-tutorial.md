https://gradle.org/install/

https://github.com/gradle/gradle


require java
```
$ java -version
openjdk version "1.8.0_151"
OpenJDK Runtime Environment (build 1.8.0_151-b12)
OpenJDK 64-Bit Server VM (build 25.151-b12, mixed mode)
```

```
mkdir /opt/gradle
curl -SsL -O https://services.gradle.org/distributions/gradle-4.5-bin.zip
unzip -d /opt/gradle gradle-4.5-bin.zip
```

```
# tree -L 1 /opt/gradle/gradle-4.5/
/opt/gradle/gradle-4.5/
├── bin
├── getting-started.html
├── init.d
├── lib
├── LICENSE
├── media
└── NOTICE

4 directories, 3 files
```

```
export PATH=$PATH:/opt/gradle/gradle-4.5/bin
```

```
# gradle -v

------------------------------------------------------------
Gradle 4.5
------------------------------------------------------------

Build time:   2018-01-24 17:04:52 UTC
Revision:     77d0ec90636f43669dc794ca17ef80dd65457bec

Groovy:       2.4.12
Ant:          Apache Ant(TM) version 1.9.9 compiled on February 2 2017
JVM:          1.8.0_151 (Oracle Corporation 25.151-b12)
OS:           Linux 4.9.76-38.79.amzn2.x86_64 amd64

```
