https://docs.bazel.build/versions/master/install-redhat.html


repo
--------
```
cd /etc/yum.repos.d/
curl -O https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/vbatts-bazel-epel-7.repo
```

install
--------
```
yum install bazel
```


ubuntu
----------
https://docs.bazel.build/versions/master/install-ubuntu.html

```
sudo apt-get install pkg-config zip g++ zlib1g-dev unzip python
curl -OL https://github.com/bazelbuild/bazel/releases/download/0.13.0/bazel-0.13.0-installer-linux-x86_64.sh
chmod +x !$
./bazel-0.13.0-installer-linux-x86_64.sh --user
export PATH="$PATH:$HOME/bin"
bazel version
Build label: 0.13.0
Build target: bazel-out/k8-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Mon Oct 18 21:33:40 +50297 (1525078013620)
Build timestamp: 1525078013620
Build timestamp as int: 1525078013620
```

