
enabled I2C 
--

```console
$ sudo raspi-config
```

`Interface Options` -> `P5 I2C`

`Would you like the ARM I2C interface to be enabled?` -> yes

install bcm2835
--

http://www.airspayce.com/mikem/bcm2835/index.html

```console
$ wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.58.tar.gz
$ tar zxvf !$:t
$ cd !$:r:r
$ ./configure
$ make
```
```console
$ sudo make check
Making check in src
make[1]: ディレクトリ '/home/pi/bcm2835-1.58/src' に入ります
make  test
make[2]: ディレクトリ '/home/pi/bcm2835-1.58/src' に入ります
make[2]: 'test' は更新済みです.
make[2]: ディレクトリ '/home/pi/bcm2835-1.58/src' から出ます
make  check-TESTS
make[2]: ディレクトリ '/home/pi/bcm2835-1.58/src' に入ります
make[3]: ディレクトリ '/home/pi/bcm2835-1.58/src' に入ります
PASS: test
============================================================================
Testsuite summary for bcm2835 1.58
============================================================================
# TOTAL: 1
# PASS:  1
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================
make[3]: ディレクトリ '/home/pi/bcm2835-1.58/src' から出ます
make[2]: ディレクトリ '/home/pi/bcm2835-1.58/src' から出ます
make[1]: ディレクトリ '/home/pi/bcm2835-1.58/src' から出ます
Making check in doc
make[1]: ディレクトリ '/home/pi/bcm2835-1.58/doc' に入ります
make[1]: 'check' に対して行うべき事はありません.
make[1]: ディレクトリ '/home/pi/bcm2835-1.58/doc' から出ます
make[1]: ディレクトリ '/home/pi/bcm2835-1.58' に入ります
make[1]: ディレクトリ '/home/pi/bcm2835-1.58' から
```
```console
$ sudo make install
```
