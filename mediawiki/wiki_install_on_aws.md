#wiki install on aws

#overview

![wiki structure on aws](https://raw.githubusercontent.com/hacker65536/myit/master/images/wikisystemonaws.png "wikisystem on aws")

#environment

##create security group

- sgwiki (for ec2)

| type  | protocol | portrange | source    |
|-------|----------|-----------|-----------|
| ssh   | tcp      | 22        | myIP      |
| http  | tcp      | 80        | 0.0.0.0/0 |
| https | tcp      | 443       | 0.0.0.0/0 |

- sgmysql (for mysql)

| type  | protocol | portrange | source        |
|-------|----------|-----------|---------------|
| mysql | tcp      | 3306      | 172.31.0.0/16 |

- sgredis (for redis)

| type            | protocol | portrange | source        |
|-----------------|----------|-----------|---------------|
| custom tcp rule | tcp      | 6379      | 172.31.0.0/16 |

##create ec2 instance

example

| name           | value                                       |
|----------------|---------------------------------------------|
| AMI            | Amazon Linux AMI 2014.09.1 (HVM)            |
| type           | t2.micro                                    |
| network        | 172.31.0.0/16(default VPC)                  |
| subnet         | default                                     |
| publicIP       | enable                                      |
| IAM role       | assign administrator if you create IAM role |
| strage Size    | 20GiB                                       |
| valume type    | general purpose(SSD)                        |
| tag            | wiki                                        |
| security group | use sg for ec2                              |


##create RDS

###create paramter groups (my.cnf)

- wikidbparam

| parameter group                | value       |
|--------------------------------|-------------|
| DB Parameter Group Family      | mysql5.6    |
| DB Parameter Group Name        | wikidbparam |
| DB Parameter Group Description | wikidbparam |


| paramters                | value           |
|--------------------------|-----------------|
| character_set_client     | utf8            |
| character_set_connection | utf8            |
| character_set_database   | utf8            |
| character_set_filesystem | binary          |
| character_set_results    | utf8            |
| character_set_server     | utf8            |
| collation_connection     | utf8_general_ci |


###RDS instance

example

| name                | value                         |
|---------------------|-------------------------------|
| db engine           | mysql                         |
| engine version      | 5.6.21                        |
| instance class      | db.t2.micro                   |
| Multi-AZ            | No                            |
| storage type        | enablegeneral purpose(SSD)    |
| allocated storage   | 10GB                          |
| identifier          | wiki                          |
| master username     | wikimaster                    |
| master password     | wikipasswd                    |
| VPC                 | default                       |
| subnet group        | default                       |
| avaliability zone   | default (or same az with ec2) |
| publicly accessible | no                            |
| security group      | sgmysql (use sg for mysql)    |
| database name       | wiki_db                       |
| paramter group      | wikidbparam                   |


###Redis (cache)

example

| Name                       | value                     |
|----------------------------|---------------------------|
| name                       | wikirediscache            |
| Cache Port                 | 6379                      |
| Number of Nodes            | 1                         |
| Preferred Zone(s)          | default (e.g. us-west-2a) |
| Cache Subnet Group         | default                   |
| Engine                     | redis                     |
| Engine Version             | 2.8.6                     |
| Node Type                  | cache.t2.micro(555MB)     |
| SNS Notification           | Disable                   |
| Auto Minor Version Upgrade | Yes                       |
| Security Group             | sgredis                   |
| Cache Parameter Group      | default                   |
| Maintenance Window         | No Preference             |


###ec2 settings

run command as `root`

system info
```bash
uname -a
```

    Linux ip-172-31-1-100 3.14.20-20.44.amzn1.x86_64 #1 SMP Mon Oct 6 22:52:46 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux


####timezone
```bash
cp /etc/localtime /etc/localtime.org
\cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date
```

    Wed Oct 22 17:43:08 JST 2014

####yum update
```bash
yum -y update
```

####git
```bash
yum install -y git
```

https://github.com/hacker65536/myit/blob/master/aws/rename_hostname_to_use_tag.md

####install require packages (php and apache etc)
```bash
yum install -y php55 php55-pecl-apc php55-mysqlnd php55-mbstring php55-pecl-imagick php55-intl mysql postfix mailx
```

####config httpd

`vim /etc/httpd/conf.d/vhost.conf`

```
<Virtualhost *:80>
servername wiki.hostname.com
documentroot /var/www/wiki
<Directory /var/www/wiki>
</Directory>
</Virtualhost>
```

####mail test

```bash
chkconfig postfix on
service postfix start
```

`echo "test"|mail me@mail.com`

####wiki install
```bash
cd /usr/local/src
wget "http://releases.wikimedia.org/mediawiki/1.23/mediawiki-1.23.5.tar.gz"
tar zxvf mediawiki-1.23.5.tar.gz
mv mediawiki-1.23.5 /var/www/wiki
```

####wiki configure

http://wiki.hostname.com

- cite
- renameuser
- syntaxhighlight_geshi
