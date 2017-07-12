# install

yum install bind bind-chroot

## ファイルコピー
```bash
cd /usr/share/doc/bind-9.7.3/sample/
cp -rp etc/* /var/named/chroot/etc
cp -rp var/named/named* /var/named/chroot/var/named
```
## 権限変更
```bash
chown -R root:named /var/named/chroot
```

## フォルダ作成
```bash
mkdir /var/named/chroot/var/named/dynamic
mkdir /var/named/chroot/var/named/data
chown named:named /var/named/chroot/var/named/dynamic
chown named:named /var/named/chroot/var/named/data
mkdir /var/named/chroot/var/log/named
chown named. /var/named/chroot/var/log/named
```
## conf
```bash
vim /var/named/chroot/etc/named.conf
```

```named
 # common
 options
 {
     # hid version 
     version "unknown";

     
     # this directory will be /var/named/chroot/var/named if using chroot 
     directory "/var/named";

     # cache file
     dump-file       "data/cache_dump.db";  

     # stats file
     statistics-file     "data/named_stats.txt";

     # memstats file
     memstatistics-file  "data/named_mem_stats.txt";

     # port and ip  of service 
     listen-on port 53 { any; };
     listen-on-v6 port 53    { ::1; };

     # only allow localnetwork
     allow-query             { localhost; 192.168.0.0/24; };
     allow-query-cache       { localhost; 192.168.0.0/24; };

     # allow recursion 
     recursion yes;

     # disabble dnssec
     dnssec-enable no;
     dnssec-validation no;
     dnssec-lookaside auto;  

 
 };

 # log settings
 logging
 {
         #debug
         channel default_debug {
                 file "data/named.run";
                 severity dynamic;
         };
 };

#キャッシュサーバの設定
view "localhost_resolver"
{
    #only allow localnetwork
    match-clients       { localhost; 192.168.0.0/24; };
    recursion yes;

    #root zone
    zone "." IN {
            type hint;
            file "/var/named/named.ca";
    };
    
    #for local zone
    include "/etc/named.rfc1912.zones";
};
```


dnssec-validation no　にしないと信頼できないために引けなくなる
```bash
mv /etc/named.conf /etc/named.conf.org
ln -s /var/named/chroot/etc/named.conf /etc/named.conf
```
## SELINUX
```bash
getsebool -a|grep named
```
```
named_write_master_zones --> off
```
```bash
setsebool -P named_write_master_zones 1
```
## 起動
```bash
chkconfig named on
service named start
```
