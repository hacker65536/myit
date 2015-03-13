#環境
```bash
uname -a
Linux ip-10-1-1-6 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```
##時間設定
```bash
cp /etc/localtime /etc/localtime.org
\cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date
```

##yum update
```bash
yum -y update
```

##サーバとクライアントをyumでインストール
```bash
yum install -y openldap-servers openldap-clients
```


インストールしたバージョンを確認
```
yum list installed 'openldap*'
```

    Loaded plugins: priorities, update-motd, upgrade-helper
    Installed Packages
    openldap.x86_64                        2.4.23-34.23.amzn1                    installed
    openldap-clients.x86_64                2.4.23-34.23.amzn1                    @amzn-main
    openldap-servers.x86_64                2.4.23-34.23.amzn1                    @amzn-main

##ldapのlog設定



`local4.* -/var/log/ldaplog`
この記述をconfig dirにファイルとして出力
```bash
echo -e '#ldaplog\nlocal4.*\t-/var/log/ldaplog' > /etc/rsyslog.d/ldap.conf
```

念のためにコピー
```
cp /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```

3行目に `/var/log/ldap`を追加
```
sed -i '3s/\(.*\)/\1\n\/var\/log\/ldaplog/' /etc/logrotate.d/syslog
```

三行目に追加されている事を確認
```
diff /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```

    4d3  
    < /var/log/ldaplog

コピーを削除
```
rm -f /etc/logrotate.d/syslog.org
```

rsyslogを再起動
```
service rsyslog restart
```

##設定
DB_CONFIGをコピーと権限設定
```
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap. /var/lib/ldap/DB_CONFIG
```

ldapviをインストール  
ldapviはインタラクティブに設定の変更を行えるツール
```
yum install -y --enablerepo=epel ldapvi
```

ldap 起動  
```bash
chkconfig slapd on
service slapd start
```


設定ファイル作成
```
mkdir ldapconf
cd ldapconf
```
password生成
```bash
slappasswd -s password
```
```
{SSHA}dx+bl9fhNGwRQYT3MIDejFVu8EfQYeuL
```

初期設定 パスワード設定
```
vim ldapconf_init_passwd.ldif
```
```
dn:olcDatabase={0}config,cn=config
changeType:modify
add: olcRootPW
olcRootPW:{SSHA}dx+bl9fhNGwRQYT3MIDejFVu8EfQYeuL
```

簡易版
```bash
ldappassword=$(slappasswd -s password)

echo "dn: olcDatabase={0}config,cn=config">>ldapconf_init_passwd.ldif
echo "changeType: modify">>ldapconf_init_passwd.ldif
echo "add: olcRootPW">>ldapconf_init_passwd.ldif
echo "olcRootPW: ${ldappassword}">>ldapconf_init_passwd.ldif
```




反映
```bash
ldapadd -Y EXTERNAL -H ldapi:// -f ldapconf_init_passwd.ldif
```
```
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={0}config,cn=config"
```


確認
```
ldapsearch -x -LLL -D "cn=config" -w password -b "cn=config" '(objectClass=*)'
```


ldapviで行う場合
```
ldapvi -Y EXTERNAL -h ldapi:/// -b 'olcDatabase={0}config,cn=config'
```

`olcRootPW: {SSHA}dx+l9fhNGwRQYTeMIDejFVu8EfQYeuL`を追記し`:wq`で保存するとすべきActionの選択が出てくる

```
add: 0, rename: 0, modify: 1, delete: 0
Action? [yYqQvVebB*rsf+?]
```

- y -- commit changes

http://www.lichteblau.com/ldapvi/manual



初期suffix修正

```
vim ldapconf_init_suffix.ldif
```
```
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"
  read by dn.base="cn=Manager,dc=testcompany,dc=com" read by * none

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=testcompany,dc=com

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=Manager,dc=testcompany,dc=com

dn: olcDatabase={2}bdb,cn=config
changetype: modify
add: olcRootPW
olcRootPW: {SSHA}QbgC8LOCYsd78ikhKvBj8xOGETdOEedY

```

反映

```
ldapmodify -x -D "cn=config" -w password -f ldapconf_init_suffix.ldif
```

```
modifying entry "olcDatabase={1}monitor,cn=config"

modifying entry "olcDatabase={2}bdb,cn=config"

modifying entry "olcDatabase={2}bdb,cn=config"

modifying entry "olcDatabase={2}bdb,cn=config"
```

ldapviでも同様な事が可能  

```
ldapvi -Y EXTERNAL -h ldapi:/// -b 'olcDatabase={1}monitor,cn=config'
ldapvi -Y EXTERNAL -h ldapi:/// -b 'olcDatabase={2}bdb,cn=config'
```
olcRootPWはolcRootDNの設定後(commit)でないと以下のエラーがでる
```
additional info: <olcRootPW> can only be set when rootdn is under suffix
```


tls対応

```bash
vim /etc/sysconfig/ldap
```
or  
```
sed -i 's/SLAPD_LDAPS=no/SLAPD_LDAPS=yes/' /etc/sysconfig/ldap
cat /etc/sysconfig/ldap |grep SLAPD_LDAPS|grep -v -E "^#"
```

```
SLAPD_LDAPS=yes
```

```bash
service slapd restart

lsof -i:ldaps  #lsof -i:636
```

認証局と証明書作成  

本来はopensslを使用して作成するが一般公開するものではないのでできる限り手順を省略する。apacheのsslmoduleを入れるとkeyと証明書を代わりに作ってくれるので、こちらを利用する。

```bash
yum install -y mod24_ssl
```
`/etc/pki/tls/private/`の下に`localhost.key`と`/etc/pki/tls/certs/`の下に`localhost.crt`が作られているのでこれを利用。


```bash
cd /etc/openldap/certs
cp /etc/pki/tls/private/localhost.key .
cp /etc/pki/tls/certs/localhost.crt .
cp /etc/pki/tls/certs/ca-bundle.crt .
chown ldap. ./*
```

```bash
vim ldapconf_init_tls.ldif
```

```ldif
dn: cn=config
changetype: modify
replace: olcTLSCertificateFile
olcTLSCertificateFile: /etc/openldap/certs/localhost.crt
-
replace: olcTLSCertificateKeyFile
olcTLSCertificateKeyFile: /etc/openldap/certs/localhost.key
```

```bash
ldapmodify -x -w password -D "cn=config" -f ldapconf_init_tls.ldif
```

証明書チェック

```bash
echo | openssl s_client -connect localhost:636 -showcerts -state 
```
```
CONNECTED(00000003)
SSL_connect:before/connect initialization
SSL_connect:SSLv2/v3 write client hello A
SSL_connect:SSLv3 read server hello A
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = ip-10-1-1-6, emailAddress = root@ip-10-1-1-6
verify error:num=18:self signed certificate
verify return:1
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = ip-10-1-1-6, emailAddress = root@ip-10-1-1-6
verify return:1
SSL_connect:SSLv3 read server certificate A
SSL_connect:SSLv3 read server key exchange A
SSL_connect:SSLv3 read server done A
SSL_connect:SSLv3 write client key exchange A
SSL_connect:SSLv3 write change cipher spec A
SSL_connect:SSLv3 write finished A
SSL_connect:SSLv3 flush data
SSL_connect:SSLv3 read finished A
---
Certificate chain
 0 s:/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=ip-10-1-1-6/emailAddress=root@ip-10-1-1-6
   i:/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=ip-10-1-1-6/emailAddress=root@ip-10-1-1-6
-----BEGIN CERTIFICATE-----
MIIEUjCCAzqgAwIBAgICPewwDQYJKoZIhvcNAQELBQAwgacxCzAJBgNVBAYTAi0t
MRIwEAYDVQQIDAlTb21lU3RhdGUxETAPBgNVBAcMCFNvbWVDaXR5MRkwFwYDVQQK
DBBTb21lT3JnYW5pemF0aW9uMR8wHQYDVQQLDBZTb21lT3JnYW5pemF0aW9uYWxV
bml0MRQwEgYDVQQDDAtpcC0xMC0xLTEtNjEfMB0GCSqGSIb3DQEJARYQcm9vdEBp
cC0xMC0xLTEtNjAeFw0xNTAzMTMwNjQ3NDNaFw0xNjAzMTIwNjQ3NDNaMIGnMQsw
CQYDVQQGEwItLTESMBAGA1UECAwJU29tZVN0YXRlMREwDwYDVQQHDAhTb21lQ2l0
eTEZMBcGA1UECgwQU29tZU9yZ2FuaXphdGlvbjEfMB0GA1UECwwWU29tZU9yZ2Fu
aXphdGlvbmFsVW5pdDEUMBIGA1UEAwwLaXAtMTAtMS0xLTYxHzAdBgkqhkiG9w0B
CQEWEHJvb3RAaXAtMTAtMS0xLTYwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQDOLOZ0+PapJND5j5td+zg4Vxj7ydvjNro2pLGrYYLkyC+bS7ltvJV4TneA
ZVpyVKxIWbTR3cbgNPK5F3NEU9tAMvP9D5xyAYawvmPgeqseBES1IOY70eZb/K1c
C82jzA9qa9xJU9ney2vDnKRr8Oj+vZKskvKxvtJdimkFkrGD8LRvxqYitypQkQ4Q
0mKB+oZav5Ov0EkTAtd1ojMzllXfjcLNeoY3laTWj6zfKC2BD2WkMgl1MQapD9mW
87TPCM/hkpPH3R0mNrtuW7iaJV3LiVc/Ao9u3ukIi1s2xhGyOlyL/2bl8HsKrAPw
wjcxuc1BENEBRrEHOeqGEWzaowI7AgMBAAGjgYUwgYIwDAYDVR0TBAUwAwEB/zBl
BgNVHREEXjBcgglsb2NhbGhvc3SCFWxvY2FsaG9zdC5sb2NhbGRvbWFpboILaXAt
MTAtMS0xLTaCK2lwLTEwLTEtMS02LmFwLXNvdXRoZWFzdC0yLmNvbXB1dGUuaW50
ZXJuYWwwCwYDVR0PBAQDAgLkMA0GCSqGSIb3DQEBCwUAA4IBAQB2EYPH7ZYmkwH1
p+zCfag0+iogzeSFsufcVx25A6wqUUlT0FscYMUjmdXrIBE17+DsUT4U3T4rH03w
2xVJ+n9F1+vOS0OGT/oA4GPWQgxKxcSPkrXnrQAlCrmD7e/gMJqwCdhnVBYU9DtW
2ApwvNYl9ifai7tBW5Vf3gZew5HpQFGu72E1+ixra8MM6+nylJ5gOn8i0DoGbs83
JVjExbvyG59pZ06ETodMu63dS18RdGaSJEDGqdABfHJ4j84wF9D61leecUsOfl6V
gf8HuBq9gB2pMi+BP7WqJSqQ6Jtp8axkxIg5qmqWdNmZhXKeyTGEJzFola6QqI9z
Db14bcaz
-----END CERTIFICATE-----
---
Server certificate
subject=/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=ip-10-1-1-6/emailAddress=root@ip-10-1-1-6
issuer=/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=ip-10-1-1-6/emailAddress=root@ip-10-1-1-6
---
No client certificate CA names sent
Server Temp Key: ECDH, prime256v1, 256 bits
---
SSL handshake has read 1606 bytes and written 381 bytes
---
New, TLSv1/SSLv3, Cipher is ECDHE-RSA-AES128-SHA
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
SSL-Session:
    Protocol  : TLSv1
    Cipher    : ECDHE-RSA-AES128-SHA
    Session-ID: 6FEAB749EDE9380DD71F9D7A23097E0C59CAB74D3EFC24C4DCAAF0036888609A
    Session-ID-ctx:
    Master-Key: 68DE7EAFFA574C27ED4C1430760AD6916CD2043EAC867D527CC718C2775FEC364484C87D1AA6782193AD84607BCA21AF
    Key-Arg   : None
    Krb5 Principal: None
    PSK identity: None
    PSK identity hint: None
    Start Time: 1426230730
    Timeout   : 300 (sec)
    Verify return code: 18 (self signed certificate)
---
DONE
SSL3 alert write:warning:close notify
```

##サンプルエントリー

```
dc=testcompany,dc=com
├── ou=Group
│   ├── cn=division1  (cn=division1,ou=Group,dc=testcompany,dc=com)
│   └── cn=division2
└── ou=People
     ├── uid=user1 (uid=user1,ou=People,dc=testcompany,dc=com)
     ├── uid=user2
     ├── uid=user3
     └── uid=user4
```


用語

| 略称| 正式名称 |日本語|説明|
|--------|--------|------|------|
| DN       |    distinguished name    |識別名|DITのエントリー(ノード)の一意の識別に用いる 相対識別名の場合はRDN(relative)|
|DC|domain component|ドメイン名要素|dc=company,dc=jp|
|DIT| directory information tree|ディレクトリ情報ツリー|ディレクトリサービスにおいてのツリー構造|
|olc| On-Line Configuration|オンライン設定|openldap2.4から採用された設定方法  それまでは静的ファイルslap.confで設定してるが変更された convert方法は提供されている|
