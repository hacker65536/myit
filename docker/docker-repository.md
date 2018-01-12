https://docs.docker.com/engine/installation/linux/docker-ce/centos/#install-using-the-repository

centos7

```
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```  
```
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

```
$ sudo yum-config-manager --enable docker-ce-edge
```

```
$ sudo yum-config-manager --enable docker-ce-test
```

```
$ sudo yum-config-manager --disable docker-ce-edge
```

```
$ sudo yum install docker-ce
```


```
$ yum list docker-ce --showduplicates | sort -r
 * updates: mirror.datto.com
Loading mirror speeds from cached hostfile
Loaded plugins: fastestmirror
Installed Packages
 * extras: mirror.es.its.nyu.edu
docker-ce.x86_64         18.01.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         18.01.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         18.01.0.ce-1.el7.centos                @docker-ce-edge
docker-ce.x86_64         18.01.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.12.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.12.0.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.12.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.12.0.ce-0.4.rc4.el7.centos          docker-ce-test
docker-ce.x86_64         17.12.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.12.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.12.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.11.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.11.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.11.0.ce-0.4.rc4.el7.centos          docker-ce-test
docker-ce.x86_64         17.11.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.11.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.11.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.10.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.10.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.10.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.10.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.09.1.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.09.1.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.09.1.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.09.1.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.09.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.09.0.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.09.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.09.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.09.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.09.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.07.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.07.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.07.0.ce-0.4.rc4.el7.centos          docker-ce-test
docker-ce.x86_64         17.07.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.07.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.07.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.2.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.06.2.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.06.2.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.06.2.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.1.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.06.1.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.06.1.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.06.1.ce-0.4.rc4.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.1.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.1.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.1.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.0.ce-1.el7.centos                docker-ce-test
docker-ce.x86_64         17.06.0.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.06.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.06.0.ce-0.5.rc5.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.0.ce-0.4.rc4.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.06.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.05.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.05.0.ce-0.3.rc3.el7.centos          docker-ce-test
docker-ce.x86_64         17.05.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.05.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.04.0.ce-1.el7.centos                docker-ce-edge
docker-ce.x86_64         17.04.0.ce-0.2.rc2.el7.centos          docker-ce-test
docker-ce.x86_64         17.04.0.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.03.2.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.03.2.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.03.1.ce-1.el7.centos                docker-ce-stable
docker-ce.x86_64         17.03.1.ce-0.1.rc1.el7.centos          docker-ce-test
docker-ce.x86_64         17.03.0.ce-1.el7.centos                docker-ce-stable
 * base: mirrors.umflint.edu
Available Packages
```
