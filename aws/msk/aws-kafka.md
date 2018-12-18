
## kafka cli

https://docs.aws.amazon.com/cli/latest/reference/kafka/index.html

- create-cluster
- delete-cluster
- describe-cluster
- get-bootstrap-brokers
- list-clusters
- list-nodes

### tutorial 

```
$ aws kafka list-clusters --region us-east-1
{
    "ClusterInfoList": [
        {
            "EncryptionInfo": {
                "EncryptionAtRest": {
                    "DataVolumeKMSKeyId": "arn:aws:kms:us-east-1:00000000000:key/62a5472d-220f-4e5b-83f6                                                    -b77efbf590db"
                }
            },
            "BrokerNodeGroupInfo": {
                "BrokerAZDistribution": "DEFAULT",
                "ClientSubnets": [
                    "subnet-01ad79740c7fee660",
                    "subnet-0a58d7ad670064788",
                    "subnet-03c40c593b8b5e512"
                ],
                "StorageInfo": {
                    "EbsStorageInfo": {
                        "VolumeSize": 1000
                    }
                },
                "InstanceType": "kafka.m5.large"
            },
            "ClusterName": "kafkatest",
            "CurrentBrokerSoftwareInfo": {
                "KafkaVersion": "1.1.1"
            },
            "CreationTime": "2018-12-18T03:46:39.486Z",
            "NumberOfBrokerNodes": 3,
            "ZookeeperConnectString": "10.0.2.150:2181,10.0.0.211:2181,10.0.1.172:2181",
            "State": "ACTIVE",
            "CurrentVersion": "K13V1IB3VIYZZH",
            "ClusterArn": "arn:aws:kafka:us-east-1:00000000000:cluster/kafkatest/34bb4335-effd-4323-bf41                                                    -eca034cf1dbd-3",
            "EnhancedMonitoring": "DEFAULT"
        }
    ]
}
```

```
$ aws kafka list-nodes --cluster-arn arn:aws:kafka:us-east-1:000000000:cluster/kafkatest/34bb4335-effd-4323-bf41-eca034cf1dbd-3 --region us-east-1
{
    "NodeInfoList": [
        {
            "AddedToClusterTime": "2018-12-18T03:54:25.268Z",
            "NodeType": "BROKER",
            "BrokerNodeInfo": {
                "AttachedENIId": "eni-071add57baf4cfac8",
                "CurrentBrokerSoftwareInfo": {
                    "KafkaVersion": "1.1.1"
                },
                "BrokerId": "3",
                "ClientVpcIpAddress": "10.0.1.72",
                "ClientSubnet": "subnet-0a58d7ad670064788"
            },
            "NodeARN": "arn:aws:kafka:us-east-1:000000000:broker/kafkatest/34bb4335-effd-4323-bf41-eca034cf1dbd-3/251a1ee6-c237-4489-942c-0bb59048cec8",
            "InstanceType": "m5.large"
        },
        {
            "AddedToClusterTime": "2018-12-18T03:54:25.227Z",
            "NodeType": "BROKER",
            "BrokerNodeInfo": {
                "AttachedENIId": "eni-0fa183ffef177a135",
                "CurrentBrokerSoftwareInfo": {
                    "KafkaVersion": "1.1.1"
                },
                "BrokerId": "1",
                "ClientVpcIpAddress": "10.0.2.211",
                "ClientSubnet": "subnet-03c40c593b8b5e512"
            },
            "NodeARN": "arn:aws:kafka:us-east-1:000000000:broker/kafkatest/34bb4335-effd-4323-bf41-eca034cf1dbd-3/6d57f9e2-03f0-4165-8c7d-42b9799c55c7",
            "InstanceType": "m5.large"
        },
        {
            "AddedToClusterTime": "2018-12-18T03:54:25.252Z",
            "NodeType": "BROKER",
            "BrokerNodeInfo": {
                "AttachedENIId": "eni-0080bc57619c82cf2",
                "CurrentBrokerSoftwareInfo": {
                    "KafkaVersion": "1.1.1"
                },
                "BrokerId": "2",
                "ClientVpcIpAddress": "10.0.0.81",
                "ClientSubnet": "subnet-01ad79740c7fee660"
            },
            "NodeARN": "arn:aws:kafka:us-east-1:000000000:broker/kafkatest/34bb4335-effd-4323-bf41-eca034cf1dbd-3/8b14fbeb-545b-4db9-a8f3-832acfd3145d",
            "InstanceType": "m5.large"
        }
    ]
}
```
