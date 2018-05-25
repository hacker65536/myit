http://taku910.github.io/mecab/


require
```console
$ yum install gcc gcc-c++
```

install mecab
```console
$ curl -SsL -o mecab-0.996.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE"
$ tar zxvf mecab-0.996.tar.gz
$ cd mecab-0.996
$ ./configure
$ make
$ make check
$ sudo make install
```
install dic
```console
$ curl -SsL -o mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM"
$ tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz
$ cd mecab-ipadic-2.7.0-20070801
$ ./configure
$ make
$ sudo make install
```

my.cnf
```
[mysqld]
loose-mecab-rc-file=/usr/local/etc/mecabrc
```

mysql configuration
```
mysql> install plugin mecab SONAME 'libpluginmecab.so';
Query OK, 0 rows affected (0.00 sec)


mysql> SHOW STATUS LIKE 'mecab_charset';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| mecab_charset | utf8  |
+---------------+-------+
1 row in set (0.01 sec)

mysql> SELECT  PLUGIN_NAME, PLUGIN_STATUS, PLUGIN_TYPE,
    ->   PLUGIN_LIBRARY, PLUGIN_LICENSE
    -> FROM INFORMATION_SCHEMA.PLUGINS WHERE PLUGIN_NAME LIKE '%mecab%';
+-------------+---------------+-------------+-------------------+----------------+
| PLUGIN_NAME | PLUGIN_STATUS | PLUGIN_TYPE | PLUGIN_LIBRARY    | PLUGIN_LICENSE |
+-------------+---------------+-------------+-------------------+----------------+
| mecab       | ACTIVE        | FTPARSER    | libpluginmecab.so | GPL            |
+-------------+---------------+-------------+-------------------+----------------+
1 row in set (0.00 sec)

```
