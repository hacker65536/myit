

https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RequestLaunchTemplateData.html


example json
```
{
  "KernelId": "string",
  "EbsOptimized": true|false,
  "IamInstanceProfile": {
    "Arn": "string",
    "Name": "string"
  },
  "BlockDeviceMappings": [
    {
      "DeviceName": "string",
      "VirtualName": "string",
      "Ebs": {
        "Encrypted": true|false,
        "DeleteOnTermination": true|false,
        "Iops": integer,
        "KmsKeyId": "string",
        "SnapshotId": "string",
        "VolumeSize": integer,
        "VolumeType": "standard"|"io1"|"gp2"|"sc1"|"st1"
      },
      "NoDevice": "string"
    }
    ...
  ],
  "NetworkInterfaces": [
    {
      "AssociatePublicIpAddress": true|false,
      "DeleteOnTermination": true|false,
      "Description": "string",
      "DeviceIndex": integer,
      "Groups": ["string", ...],
      "Ipv6AddressCount": integer,
      "Ipv6Addresses": [
        {
          "Ipv6Address": "string"
        }
        ...
      ],
      "NetworkInterfaceId": "string",
      "PrivateIpAddress": "string",
      "PrivateIpAddresses": [
        {
          "Primary": true|false,
          "PrivateIpAddress": "string"
        }
        ...
      ],
      "SecondaryPrivateIpAddressCount": integer,
      "SubnetId": "string"
    }
    ...
  ],
  "ImageId": "string",
  "InstanceType": "t1.micro"|"t2.nano"|"t2.micro"|"t2.small"|"t2.medium"|"t2.large"|"t2.xlarge"|"t2.2xlarge"|"m1.small"|"m1.medium"|"m1.large"|"m1.xlarge"|"m3.medium"|"m3.large"|"m3.xlarge"|"m3.2xlarge"|"m4.large"|"m4.xlarge"|"m4.2xlarge"|"m4.4xlarge"|"m4.10xlarge"|"m4.16xlarge"|"m2.xlarge"|"m2.2xlarge"|"m2.4xlarge"|"cr1.8xlarge"|"r3.large"|"r3.xlarge"|"r3.2xlarge"|"r3.4xlarge"|"r3.8xlarge"|"r4.large"|"r4.xlarge"|"r4.2xlarge"|"r4.4xlarge"|"r4.8xlarge"|"r4.16xlarge"|"x1.16xlarge"|"x1.32xlarge"|"x1e.xlarge"|"x1e.2xlarge"|"x1e.4xlarge"|"x1e.8xlarge"|"x1e.16xlarge"|"x1e.32xlarge"|"i2.xlarge"|"i2.2xlarge"|"i2.4xlarge"|"i2.8xlarge"|"i3.large"|"i3.xlarge"|"i3.2xlarge"|"i3.4xlarge"|"i3.8xlarge"|"i3.16xlarge"|"hi1.4xlarge"|"hs1.8xlarge"|"c1.medium"|"c1.xlarge"|"c3.large"|"c3.xlarge"|"c3.2xlarge"|"c3.4xlarge"|"c3.8xlarge"|"c4.large"|"c4.xlarge"|"c4.2xlarge"|"c4.4xlarge"|"c4.8xlarge"|"c5.large"|"c5.xlarge"|"c5.2xlarge"|"c5.4xlarge"|"c5.9xlarge"|"c5.18xlarge"|"cc1.4xlarge"|"cc2.8xlarge"|"g2.2xlarge"|"g2.8xlarge"|"g3.4xlarge"|"g3.8xlarge"|"g3.16xlarge"|"cg1.4xlarge"|"p2.xlarge"|"p2.8xlarge"|"p2.16xlarge"|"p3.2xlarge"|"p3.8xlarge"|"p3.16xlarge"|"d2.xlarge"|"d2.2xlarge"|"d2.4xlarge"|"d2.8xlarge"|"f1.2xlarge"|"f1.16xlarge"|"m5.large"|"m5.xlarge"|"m5.2xlarge"|"m5.4xlarge"|"m5.12xlarge"|"m5.24xlarge"|"h1.2xlarge"|"h1.4xlarge"|"h1.8xlarge"|"h1.16xlarge",
  "KeyName": "string",
  "Monitoring": {
    "Enabled": true|false
  },
  "Placement": {
    "AvailabilityZone": "string",
    "Affinity": "string",
    "GroupName": "string",
    "HostId": "string",
    "Tenancy": "default"|"dedicated"|"host",
    "SpreadDomain": "string"
  },
  "RamDiskId": "string",
  "DisableApiTermination": true|false,
  "InstanceInitiatedShutdownBehavior": "stop"|"terminate",
  "UserData": "string",
  "TagSpecifications": [
    {
      "ResourceType": "customer-gateway"|"dhcp-options"|"image"|"instance"|"internet-gateway"|"network-acl"|"network-interface"|"reserved-instances"|"route-table"|"snapshot"|"spot-instances-request"|"subnet"|"security-group"|"volume"|"vpc"|"vpn-connection"|"vpn-gateway",
      "Tags": [
        {
          "Key": "string",
          "Value": "string"
        }
        ...
      ]
    }
    ...
  ],
  "ElasticGpuSpecifications": [
    {
      "Type": "string"
    }
    ...
  ],
  "SecurityGroupIds": ["string", ...],
  "SecurityGroups": ["string", ...],
  "InstanceMarketOptions": {
    "MarketType": "spot",
    "SpotOptions": {
      "MaxPrice": "string",
      "SpotInstanceType": "one-time"|"persistent",
      "BlockDurationMinutes": integer,
      "ValidUntil": timestamp,
      "InstanceInterruptionBehavior": "hibernate"|"stop"|"terminate"
    }
  },
  "CreditSpecification": {
    "CpuCredits": "string"
  }
}
```

or 

get-launch-template-data
```
$ aws ec2 get-launch-template-data --instance-id i-xxxxxxxxxxxx
{
    "LaunchTemplateData": {
        "Monitoring": {},
        "ImageId": "ami-xxxxxxx",
        "KeyName": "xxxxxxx",
        "BlockDeviceMappings": [
            {
                "DeviceName": "/dev/sda1",
                "Ebs": {
                    "DeleteOnTermination": true
                }
            }
        ],
        "EbsOptimized": true,
        "Placement": {
            "Tenancy": "default",
            "GroupName": "",
            "AvailabilityZone": "us-east-2a"
        },
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::xxxxxxx:instance-profile/xxxxxxx"
        },
        "InstanceType": "c4.large",
        "NetworkInterfaces": [
            {
                "Description": "",
                "NetworkInterfaceId": "eni-xxxxxxx",
                "PrivateIpAddresses": [
                    {
                        "Primary": true,
                        "PrivateIpAddress": "172.31.0.144"
                    }
                ],
                "SubnetId": "subnet-xxxxxxx",
                "Groups": [
                    "sg-xxxxxxx"
                ],
                "Ipv6Addresses": [],
                "PrivateIpAddress": "172.31.0.144"
            }
        ]
    }
}


```

create  
template name bust be between 3 and 125 characters,  and may contain letters, numbers, and the following characters: ( ) . / _.
```
$ aws ec2 create-launch-template --launch-template-name my_template --launch-template-data file://template.json
{
    "LaunchTemplate": {
        "LatestVersionNumber": 1,
        "LaunchTemplateId": "lt-xxxxxxxxxx",
        "LaunchTemplateName": "my_template",
        "DefaultVersionNumber": 1,
        "CreatedBy": "arn:aws:sts::xxxxxxxxxx:assumed-role/XXXXX/botocore-session-xxxxxxxxxx",
        "CreateTime": "2018-02-06T09:38:39.000Z"
    }
}

```

describe
```
$ aws ec2 describe-launch-templates
{
    "LaunchTemplates": [
        {
            "LatestVersionNumber": 3,
            "LaunchTemplateId": "lt-xxxxxxxxxxxxxx",
            "LaunchTemplateName": "my-template",
            "DefaultVersionNumber": 1,
            "CreatedBy": "arn:aws:sts::-----------------------",
            "CreateTime": "2018-01-30T02:12:50.000Z"
        }
    ]
}
```

update 
```
$ aws ec2 create-launch-template-version --launch-template-name my_template --launch-template-data file://template.json
```


specify default version
```
$ aws ec2 modify-launch-template --launch-template-name my_template --default-version 2
```

run-instance
```
$ aws ec2 run-instances --launch-template LaunchTemplateName=my_template,Version=5 --image-id ami-710e2414
```
