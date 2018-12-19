
## kafka cli

https://docs.aws.amazon.com/cli/latest/reference/kafka/index.html

- create-cluster
- delete-cluster
- describe-cluster
- get-bootstrap-brokers
- list-clusters
- list-nodes

### tutorial 
https://docs.aws.amazon.com/msk/latest/developerguide/create-cluster.html


get subnet id from terraform that created vpc and more.

```
$ terraform output subnet_nat
subnet-06a2d2cc65904730a,
subnet-046e4a852221481c0,
subnet-0506f88aace00a7ac
```

get security group id from terraform
```
$ terraform output sec_sg
sg-0697e8daaeb72b651
```


`kafka.m5.large` is the minimum of instance type

type list

[kafka.m5.2xlarge, kafka.m5.xlarge, kafka.m5.24xlarge, kafka.m5.large, kafka.m5.4xlarge, kafka.m5.12xlarge]

```
$ cat <<'EOF' > brokernodegroupinfo.json
{
  "InstanceType": "kafka.m5.large",
  "ClientSubnets": [
    "subnet-06a2d2cc65904730a",
    "subnet-046e4a852221481c0",
    "subnet-0506f88aace00a7ac"
  ],
  "SecurityGroups": [
    "sg-0697e8daaeb72b651"
  ]
}
EOF
```

create cluster
```
$ aws kafka create-cluster --cluster-name "AWSKafkaTutorialCluster" --broker-node-group-info file://brokernodegroupinfo.json --kafka-version "1.1.1" --number-of-broker-nodes 3 --enhanced-monitoring PER_TOPIC_PER_BROKER --region us-east-1
{
    "ClusterName": "AWSKafkaTutorialCluster",
    "State": "CREATING",
    "ClusterArn": "arn:aws:kafka:us-east-1:000000000000:cluster/AWSKafkaTutorialCluster/695a012b-bcd6-4303-8881-12d2ed8c93ca-3"
}

```

list cluster ( describe cluster)

```
$ aws kafka list-clusters --region us-east-1
{
    "ClusterInfoList": [
        {
            "EncryptionInfo": {
                "EncryptionAtRest": {
                    "DataVolumeKMSKeyId": "arn:aws:kms:us-east-1:000000000000:key/62a5472d-220f-4e5b-83f6-b77efbf590db"
                }
            },
            "BrokerNodeGroupInfo": {
                "BrokerAZDistribution": "DEFAULT",
                "ClientSubnets": [
                    "subnet-06a2d2cc65904730a",
                    "subnet-046e4a852221481c0",
                    "subnet-0506f88aace00a7ac"
                ],
                "StorageInfo": {
                    "EbsStorageInfo": {
                        "VolumeSize": 1000
                    }
                },
                "SecurityGroups": [
                    "sg-0697e8daaeb72b651"
                ],
                "InstanceType": "kafka.m5.large"
            },
            "ClusterName": "AWSKafkaTutorialCluster",
            "CurrentBrokerSoftwareInfo": {
                "KafkaVersion": "1.1.1"
            },
            "CreationTime": "2018-12-19T02:12:41.726Z",
            "NumberOfBrokerNodes": 3,
            "ZookeeperConnectString": "10.0.3.7:2181,10.0.4.178:2181,10.0.5.62:2181",
            "State": "ACTIVE",
            "CurrentVersion": "K13V1IB3VIYZZH",
            "ClusterArn": "arn:aws:kafka:us-east-1:000000000000:cluster/AWSKafkaTutorialCluster/695a012b-bcd6-4303-8881-12d2ed8c93ca-3",
            "EnhancedMonitoring": "PER_TOPIC_PER_BROKER"
        }
    ]
}
```


setup client

```
$ sudo yum install -y java
```

```
$ wget ftp://apache.mirrors.tds.net/pub/apache.org/kafka/1.1.1/kafka_2.11-1.1.1.tgz
$ tar zxvf !$:t
$ cd !$:r
```

create topic
```
$ bin/kafka-topics.sh --create --zookeeper 10.0.3.7:2181,10.0.4.178:2181,10.0.5.62:2181 --replication-factor 3 --partitions 1 --topic AWSKafkaTutorialTopic
Created topic "AWSKafkaTutorialTopic".
```

get bootstrap brokers
```
$ aws kafka get-bootstrap-brokers --region us-east-1 --cluster-arn arn:aws:kafka:us-east-1:000000000000:cluster/AWSKafkaTutorialCluster/695a012b-bcd6-4303-8881-12d2ed8c93ca-3
{
    "BootstrapBrokerString": "10.0.4.43:9092,10.0.3.223:9092,10.0.5.117:9092"
}
```


producer
```
$ bin/kafka-console-producer.sh --broker-list 10.0.4.43:9092,10.0.3.223:9092,10.0.5.117:9092 --topic AWSKafkaTutorialTopic
>hello managed streaming for kafka
>hello managed streaming for kafak 2
>hello managed streaming for kafka 3
>hello managed streaming for kafak 4
>

```

consumer
```
$ bin/kafka-console-consumer.sh --bootstrap-server 10.0.4.43:9092,10.0.3.223:9092,10.0.5.117:9092 --topic AWSKafkaTutorialTopic --from-beginning
hello managed streaming for kafka
hello managed streaming for kafak 2
hello managed streaming for kafka 3
hello managed streaming for kafak 4
```
