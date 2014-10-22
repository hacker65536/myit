#wiki install on aws

#overview

#deploy

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

| resource       | value                                       |
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

| resource            | value                         |
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
