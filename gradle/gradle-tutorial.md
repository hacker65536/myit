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
