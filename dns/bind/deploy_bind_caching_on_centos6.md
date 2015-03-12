#install

yum install bind bind-chroot

##ファイルコピー
```bash
cd /usr/share/doc/bind-9.7.3/sample/
cp -rp etc/* /var/named/chroot/etc
cp -rp var/named/named* /var/named/chroot/var/named
```
##権限変更
```bash
chown -R root:named /var/named/chroot
```

##フォルダ作成
```bash
mkdir /var/named/chroot/var/named/dynamic
mkdir /var/named/chroot/var/named/data
chown named:named /var/named/chroot/var/named/dynamic
chown named:named /var/named/chroot/var/named/data
mkdir /var/named/chroot/var/log/named
chown named. /var/named/chroot/var/log/named
```
##conf
```bash
vim /var/named/chroot/etc/named.conf
```

```named
 # 動作全般に関する設定
 options
 {
     # バージョンを知られないように隠す設定
     version "unknown";

     # 設定ファイルのディレクトリ （デフォルト）
     # 下記設定の場合、chrootにより /var/named/chroot/var/named が設定される
     directory "/var/named";

     # キャッシュ内容を保存するファイル(rndcで利用)
     dump-file       "data/cache_dump.db";  

     # 名前解決の回数などを統計データとして保存するファイル(rndcで利用)
     statistics-file     "data/named_stats.txt";

     # サーバ終了時にメモリ使用統計について出力するファイル(rndcで利用)
     memstatistics-file  "data/named_mem_stats.txt";

     # サービスのListenポートとIP
     listen-on port 53 { any; };
     listen-on-v6 port 53    { ::1; };

     # 問い合わせ元をローカルホストとローカルネットワークに限定します
     allow-query             { localhost; 192.168.11.0/24; };

     # キャッシュを応答する先をローカルホストとローカルネットワークに限定します
     allow-query-cache       { localhost; 192.168.11.0/24; };

     # キャッシュサーバなので再帰問い合わせを許可します
     recursion yes;

     # DNSSECは無効にします。（後で有効にします）
     dnssec-enable no;
     dnssec-validation no;
     dnssec-lookaside auto;  #autoを指定するとトラストアンカの設定が自動作成されます。

 
 };

 # ログ設定（デフォルト）
 logging
 {
         #デバック時のログ出力先 （主にrndc trace コマンドで利用）
         channel default_debug {
                 file "data/named.run";
                 severity dynamic;
         };
 };

#キャッシュサーバの設定
view "localhost_resolver"
{
    #ローカルネットワークのみ利用可能にします
    match-clients       { localhost; 192.168.11.0/24; };
    recursion yes;

    #ルートゾーンの設定
    zone "." IN {
            type hint;
            file "/var/named/named.ca";
    };
    
    #ローカルホストに名前解決に関する設定
    include "/etc/named.rfc1912.zones";
};
```


dnssec-validation no　にしないと信頼できないために引けなくなる
```bash
mv /etc/named.conf /etc/named.conf.org
ln -s /var/named/chroot/etc/named.conf /etc/named.conf
```
##SELINUX
```bash
getsebool -a|grep named
named_write_master_zones --> off
setsebool -P named_write_master_zones 1
```
##起動
```bash
chkconfig named on
service named start
```
