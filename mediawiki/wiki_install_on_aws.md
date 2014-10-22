#wiki install on aws

#overview

#deploy

##create security group

- sg for ec2

|type|protocol|portrange|source|
|---|---|---|---|
|ssh|tcp|22|myIP|
|http|tcp|80|0.0.0.0/0|
|https|tcp|443|0.0.0.0/0|

- sg for mysql

|type|protocol|portrange|source|
|---|---|---|---|
|mysql|tcp|3306|172.31.0.0/16|

- sg for redis

|type|protocol|portrange|source|
|---|---|---|---|
|custom tcp rule|tcp|6379|172.31.0.0/16|

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
