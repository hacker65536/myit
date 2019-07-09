
```console
$ yum deplist docker
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
607 packages excluded due to repository priority protections
package: docker.x86_64 18.06.1ce-8.amzn2
  dependency: /bin/sh
   provider: bash.x86_64 4.2.46-30.amzn2
  dependency: /usr/bin/unshare
   provider: util-linux.x86_64 2.30.2-2.amzn2.0.4
   provider: util-linux.i686 2.30.2-2.amzn2.0.4
  dependency: config(docker) = 18.06.1ce-8.amzn2
   provider: docker.x86_64 18.06.1ce-8.amzn2
  dependency: device-mapper-libs >= 1.02.90-2.24
   provider: device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
   provider: device-mapper-libs.i686 7:1.02.146-4.amzn2.0.2
  dependency: iptables
   provider: iptables-services.x86_64 1.4.21-24.1.amzn2
   provider: iptables.x86_64 1.4.21-24.1.amzn2
   provider: iptables.i686 1.4.21-24.1.amzn2
  dependency: libc.so.6()(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libc.so.6(GLIBC_2.14)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libc.so.6(GLIBC_2.17)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libc.so.6(GLIBC_2.2.5)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libc.so.6(GLIBC_2.3)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libc.so.6(GLIBC_2.4)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libcgroup
   provider: libcgroup.x86_64 0.41-15.amzn2
   provider: libcgroup.i686 0.41-15.amzn2
  dependency: libdevmapper.so.1.02()(64bit)
   provider: device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  dependency: libdevmapper.so.1.02(Base)(64bit)
   provider: device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  dependency: libdevmapper.so.1.02(DM_1_02_97)(64bit)
   provider: device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  dependency: libdl.so.2()(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libdl.so.2(GLIBC_2.2.5)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libltdl.so.7()(64bit)
   provider: libtool-ltdl.x86_64 2.4.2-22.2.amzn2.0.2
  dependency: libpthread.so.0()(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libpthread.so.0(GLIBC_2.2.5)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libpthread.so.0(GLIBC_2.3.2)(64bit)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
  dependency: libseccomp.so.2()(64bit)
   provider: libseccomp.x86_64 2.3.1-3.amzn2.0.3
  dependency: libsystemd.so.0()(64bit)
   provider: systemd-libs.x86_64 219-57.amzn2.0.9
  dependency: libsystemd.so.0(LIBSYSTEMD_209)(64bit)
   provider: systemd-libs.x86_64 219-57.amzn2.0.9
  dependency: pigz
   provider: pigz.x86_64 2.3.4-1.amzn2.0.1
  dependency: rtld(GNU_HASH)
   provider: glibc.x86_64 2.26-32.amzn2.0.1
   provider: glibc.i686 2.26-32.amzn2.0.1
  dependency: xfsprogs
   provider: xfsprogs.x86_64 4.5.0-18.amzn2.0.1
   provider: xfsprogs.i686 4.5.0-18.amzn2.0.1
  dependency: xz
   provider: xz.x86_64 5.2.2-1.amzn2.0.2
```
