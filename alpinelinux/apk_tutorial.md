
http://wiki.alpinelinux.org/wiki/Developer_Documentation




```
apk --no-cache add
```

```
apk add --virtual
```

```
apk add alpine-sdk
```

```
(1/52) Installing fakeroot (1.20.2-r3)
(2/52) Installing sudo (1.8.16-r0)
(3/52) Installing libcap (2.25-r0)
(4/52) Installing pax-utils (1.1.6-r0)
(5/52) Installing openssl (1.0.2k-r0)
(6/52) Installing libattr (2.4.47-r4)
(7/52) Installing attr (2.4.47-r4)
(8/52) Installing tar (1.29-r1)
(9/52) Installing pkgconf (0.9.12-r0)
(10/52) Installing patch (2.7.5-r1)
(11/52) Installing libssh2 (1.7.0-r0)
(12/52) Installing libcurl (7.55.0-r2)
(13/52) Installing curl (7.55.0-r2)
(14/52) Installing abuild (2.27.1-r1)
Executing abuild-2.27.1-r1.pre-install
(15/52) Installing binutils-libs (2.26-r1)
(16/52) Installing binutils (2.26-r1)
(17/52) Installing gmp (6.1.0-r0)
(18/52) Installing isl (0.14.1-r0)
(19/52) Installing libgomp (5.3.0-r0)
(20/52) Installing libatomic (5.3.0-r0)
(21/52) Installing libgcc (5.3.0-r0)
(22/52) Installing pkgconfig (0.25-r1)
(23/52) Installing mpfr3 (3.1.2-r0)
(24/52) Installing mpc1 (1.0.3-r0)
(25/52) Installing libstdc++ (5.3.0-r0)
(26/52) Installing gcc (5.3.0-r0)
(27/52) Installing make (4.1-r1)
(28/52) Installing musl-dev (1.1.14-r16)
(29/52) Installing libc-dev (0.7-r0)
(30/52) Installing fortify-headers (0.8-r0)
(31/52) Installing g++ (5.3.0-r0)
(32/52) Installing build-base (0.4-r1)
(33/52) Installing pcre (8.38-r1)
(34/52) Installing git (2.8.6-r0)
(35/52) Installing xz-libs (5.2.2-r1)
(36/52) Installing lzo (2.09-r1)
(37/52) Installing squashfs-tools (4.3-r2)
(38/52) Installing libmagic (5.27-r0)
(39/52) Installing file (5.27-r0)
(40/52) Installing bzip2 (1.0.6-r5)
(41/52) Installing cdrkit (1.1.11-r2)
(42/52) Installing acct (6.6.2-r0)
(43/52) Installing lddtree (1.25-r2)
(44/52) Installing libuuid (2.28-r3)
(45/52) Installing libblkid (2.28-r3)
(46/52) Installing device-mapper (2.02.154-r0)
(47/52) Installing cryptsetup-libs (1.7.1-r0)
(48/52) Installing kmod (22-r0)
(49/52) Installing mkinitfs (3.0.5-r1)
Executing mkinitfs-3.0.5-r1.post-install
(50/52) Installing mtools (4.0.18-r1)
(51/52) Installing alpine-sdk (0.4-r3)
(52/52) Installing .builddeps (0)
Executing busybox-1.24.2-r13.trigger
```

dockerfile (e.g.
```Dockerfile
FROM python:2.7-alpine
RUN apk add --no-cache --virtual .builddeps alpine-sdk && \
    pip install locustio pyzmq  && \
    apk del .builddeps && \
    mkdir /locust
Add locustfile.py /locust/locustfile.py
EXPOSE 5557 5558 8089
ENTRYPOINT ["/usr/local/bin/locust", "-f", "/locust/locustfile.py"]
```
