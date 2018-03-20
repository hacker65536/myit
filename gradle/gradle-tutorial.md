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

```
git clone https://github.com/gradle/gradle-build-scan-quickstart
cd !$:t
./gradlew build --scan
```

```
Downloading https://services.gradle.org/distributions/gradle-4.4.1-bin.zip
........................................................................
Unzipping /root/.gradle/wrapper/dists/gradle-4.4.1-bin/46gopw3g8i1v3zqqx4q949t2x/gradle-4.4.1-bin.z$
p to /root/.gradle/wrapper/dists/gradle-4.4.1-bin/46gopw3g8i1v3zqqx4q949t2x
Set executable permissions for: /root/.gradle/wrapper/dists/gradle-4.4.1-bin/46gopw3g8i1v3zqqx4q949$
2x/gradle-4.4.1/bin/gradle
Starting a Gradle Daemon (subsequent builds will be faster)
Download https://plugins.gradle.org/m2/com/gradle/build-scan-plugin/1.10.3/build-scan-plugin-1.10.3$
pom
Download https://plugins.gradle.org/m2/com/gradle/build-scan-plugin/1.10.3/build-scan-plugin-1.10.3$
jar

--snip--

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':compileJava'.
> Could not find tools.jar. Please check that /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.151-1.b12.amzn2.
x86_64/jre contains a valid JDK installation.

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more l
og output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 18s
1 actionable task: 1 executed

Publishing a build scan to scans.gradle.com requires accepting the Terms of Service defined at https
://scans.gradle.com/terms-of-service. Do you accept these terms? [yes, no]
yes
Gradle Cloud Services license agreement accepted.

Publishing build scan...
https://gradle.com/s/XXXXXXXXX

````

access to  https://gradle.com/s/XXXXXXXXX

```
yum install -y java-devel
```

```
# ./gradlew build --scan
Starting a Gradle Daemon, 1 incompatible Daemon could not be reused, use --status for details
Download https://jcenter.bintray.com/junit/junit/4.12/junit-4.12.pom
Download https://jcenter.bintray.com/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.pom
Download https://jcenter.bintray.com/org/hamcrest/hamcrest-parent/1.3/hamcrest-parent-1.3.pom
Download https://jcenter.bintray.com/junit/junit/4.12/junit-4.12.jar
Download https://jcenter.bintray.com/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

BUILD SUCCESSFUL in 13s
4 actionable tasks: 4 executed

Publishing a build scan to scans.gradle.com requires accepting the Terms of Service defined at https://scans.gradle.com/terms-of-service. Do you accept these terms? [yes, no]
yes
Gradle Cloud Services license agreement accepted.

Publishing build scan...
https://gradle.com/s/YYYYYYYYYYYYYY
```
access to https://gradle.com/s/YYYYYYYYYYYYYY




omit interact
```
# cat build.gradle
plugins {
    id 'com.gradle.build-scan' version '1.11'  // added
    id 'java'
}

// new block
buildScan { 
    licenseAgreementUrl = 'https://gradle.com/terms-of-service'
    licenseAgree = 'yes'
}

repositories {
    jcenter()
}

dependencies {
    compile 'com.google.guava:guava:23.0'
    testCompile 'junit:junit:4.12'
}
```

```
# ./gradlew build --scan

BUILD SUCCESSFUL in 1s
4 actionable tasks: 4 up-to-date

Publishing build scan...
https://gradle.com/s/ZZZZZZZZZ
```
