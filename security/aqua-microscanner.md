aqua microscanner
====================

https://github.com/aquasecurity/microscanner

```console
$ docker run --rm -it aquasec/microscanner --register <email address>
Unable to find image 'aquasec/microscanner:latest' locally
latest: Pulling from aquasec/microscanner
1160f4abea84: Pull complete
aa607352b93a: Pull complete
bf467aaa87ef: Pull complete
Digest: sha256:2c3feb746740d3e76a0355cf0f45394a291cead41acb2b1906f62108aef85cf1
Status: Downloaded newer image for aquasec/microscanner:latest
   ___                 ____          __  ____              ____
  / _ |___ ___ _____ _/ __/__ ____  /  |/  (_)__________  / __/______ ____  ___  ___ ____
 / __ / _ `/ // / _ `/\ \/ -_) __/ / /|_/ / / __/ __/ _ \_\ \/ __/ _ `/ _ \/ _ \/ -_) __/
/_/ |_\_, /\_,_/\_,_/___/\__/\__/ /_/  /_/_/\__/_/  \___/___/\__/\_,_/_//_/_//_/\__/_/
       /_/
Aqua Security MicroScanner, version 2.6.4
Community Edition

By proceeding, you are accepting the microscanner terms & conditions available at https://microscanner.aquasec.com/terms.
Accept and proceed? Y/N:
Y
Please check your email for the token.

```
```dockerfile
FROM alpine
RUN apk add --no-cache ca-certificates && update-ca-certificates
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
RUN ./microscanner <TOKEN>
```


```console
docker build -t myapp .
Sending build context to Docker daemon  71.85MB
Step 1/5 : FROM alpine
latest: Pulling from library/alpine
ff3a5c916c92: Pull complete
Digest: sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0
Status: Downloaded newer image for alpine:latest
 ---> 3fd9065eaf02
Step 2/5 : RUN apk add --no-cache ca-certificates && update-ca-certificates
 ---> Running in 46a610171ba1
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
(1/1) Installing ca-certificates (20171114-r0)
Executing busybox-1.27.2-r7.trigger
Executing ca-certificates-20171114-r0.trigger
OK: 5 MiB in 12 packages
WARNING: ca-certificates.crt does not contain exactly one certificate or CRL: skipping
Removing intermediate container 46a610171ba1
 ---> d10b59a39f6a
Step 3/5 : ADD https://get.aquasec.com/microscanner .
Downloading [==================================================>]  21.61MB/21.61MB
 ---> 3f5cadb7f313
Step 4/5 : RUN chmod +x microscanner
 ---> Running in b8b7077ad82d
Removing intermediate container b8b7077ad82d
 ---> 55c428db5dac
Step 5/5 : RUN ./microscanner <TOKEN>
 ---> Running in 2af9bdb90c04
2018-05-17 07:57:56.830 INFO    Contacting CyberCenter...       {"registry": "", "image": ""}
2018-05-17 07:57:57.367 INFO    CyberCenter connection established      {"registry": "", "image": "", "api_version": "4"}
2018-05-17 07:57:57.644 INFO    Processing results...   {"registry": "", "image": ""}
2018-05-17 07:57:57.644 INFO    Applying image assurance policies...    {"registry": "", "image": ""}
{
  "scan_started": {
    "seconds": 1526543876,
    "nanos": 726903418
  },
  "scan_duration": 1,
  "digest": "87dee5a19d029c4edbff3a2ca92a5e316f6d3adf305691227b8754814759c191",
  "metadata": {
    "container_config": {},
    "config": {}
  },
  "os": "alpine",
  "version": "3.7.0",
  "resources": [
    {
      "resource": {
        "format": "apk",
        "name": "musl",
        "version": "1.1.18-r2",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:musl:1.1.18-r2",
        "license": "MIT",
        "name_hash": "e6a295ffc4b56faeb936c5ed9b621796"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "busybox",
        "version": "1.27.2-r7",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:busybox:1.27.2-r7",
        "license": "GPL2",
        "name_hash": "1a0be787cebd01a5ca5d163e1502c1c6"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "alpine-baselayout",
        "version": "3.0.5-r2",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:alpine-baselayout:3.0.5-r2",
        "license": "GPL2",
        "name_hash": "0316409a5019da26c343d407d1c7b0fb"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "alpine-keys",
        "version": "2.1-r1",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:alpine-keys:2.1-r1",
        "license": "MIT",
        "name_hash": "15e58036e489dbb2e315895941442f71"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "libressl2.6-libcrypto",
        "version": "2.6.3-r0",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:libressl2.6-libcrypto:2.6.3-r0",
        "license": "custom",
        "name_hash": "84ebc10f7dde6b097116a6e794a048e1"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "libressl2.6-libssl",
        "version": "2.6.3-r0",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:libressl2.6-libssl:2.6.3-r0",
        "license": "custom",
        "name_hash": "55a9f3fefd159d8c6cf3b0aacf2a166b"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "zlib",
        "version": "1.2.11-r1",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:zlib:1.2.11-r1",
        "license": "zlib",
        "name_hash": "7a990d405d2c6fb93aa8fbb0ec1a3b23"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "apk-tools",
        "version": "2.8.2-r0",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:apk-tools:2.8.2-r0",
        "license": "GPL2",
        "name_hash": "1854316599af827d5e6b31ac311bac1f"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "scanelf",
        "version": "1.2.2-r1",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:scanelf:1.2.2-r1",
        "license": "GPL2",
        "name_hash": "188f0ba2744e0b8219f7d042847741b8"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "musl-utils",
        "version": "1.1.18-r2",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:musl-utils:1.1.18-r2",
        "license": "MIT,BSD,GPL2+",
        "name_hash": "4b2ade9208c55350a22700b3706c4b3d"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "libc-utils",
        "version": "0.7.1-r0",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:libc-utils:0.7.1-r0",
        "license": "BSD",
        "name_hash": "49688b358622b3b0377f507e04ea5bfe"
      },
      "scanned": true
    },
    {
      "resource": {
        "format": "apk",
        "name": "ca-certificates",
        "version": "20171114-r0",
        "arch": "x86_64",
        "cpe": "pkg:/alpine:3.7.0:ca-certificates:20171114-r0",
        "license": "MPL,2.0,GPL2+",
        "name_hash": "7254f6aafc64c401975b544e0163895f"
      },
      "scanned": true
    }
  ],
  "image_assurance_results": {
    "checks_performed": [
      {
        "policy_id": 1,
        "policy_name": "Default",
        "control": "max_severity",
        "maximum_severity_allowed": "high"
      }
    ]
  },
  "vulnerability_summary": {},
  "scan_options": {},
  "initiating_user": "token",
  "data_date": 1520221957
}
Removing intermediate container 2af9bdb90c04
 ---> a6b92ec8e67a
Successfully built a6b92ec8e67a
Successfully tagged myapp:latest
```


amazlinux
```
---snip-----
    {
      "resource": {
        "format": "rpm",
        "name": "aws-cli",
        "version": "1.14.9-1.48.amzn1",
        "arch": "noarch",
        "cpe": "pkg:/amzn:2017.09:aws-cli:1.14.9-1.48.amzn1",
        "license": "ASL 2.0",
        "name_hash": "980f5e020af2822c36c71d560c5c5af4"
      },
      "scan_error": "unknown/unsupported operating system"
    },
    {
      "resource": {
        "format": "rpm",
        "name": "unzip",
        "version": "6.0-4.10.amzn1",
        "arch": "x86_64",
        "cpe": "pkg:/amzn:2017.09:unzip:6.0-4.10.amzn1",
        "license": "BSD",
        "name_hash": "0a342b59ecdcede0571340b9ed11633f"
      },
      "scan_error": "unknown/unsupported operating system"
    }
  ],
  "image_assurance_results": {
    "checks_performed": [
      {
        "policy_id": 1,
        "policy_name": "Default",
        "control": "max_severity",
        "maximum_severity_allowed": "high"
      }
    ]
  },
  "vulnerability_summary": {},
  "scan_options": {},
  "partial_results": true,
  "initiating_user": "token",
  "data_date": 1520221957
}
Removing intermediate container f93a49612689
 ---> 1afd03426297
Successfully built 1afd03426297
Successfully tagged myapp:latest
```
:persevere:
