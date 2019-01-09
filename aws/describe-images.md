

```
$ aws ec2 describe-images --filters Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 Name=is-public,Values=true | jq -rc '.Images | sort_by(.CreationDate) | reverse |.[]|[.Description,.CreationDate]'
["CentOS Linux 6 x86_64 HVM EBS ENA 1805_01","2018-06-13T15:55:40.000Z"]
["CentOS Linux 6 x86_64 HVM EBS ENA 1804_2","2018-05-17T22:08:13.000Z"]
["CentOS Linux 6 x86_64 HVM EBS 1801_01","2018-01-12T20:37:34.000Z"]
["CentOS Linux 6 x86_64 HVM EBS 1704_01","2017-05-10T18:53:42.000Z"]
["CentOS Linux 6 x86_64 HVM EBS 1602","2016-02-26T21:16:09.000Z"]
```

```
$ aws ec2 describe-images --filters Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce Name=is-public,Values=true | jq -rc '.Images | sort_by(.CreationDate) | reverse |.[]|[.Description,.CreationDate]'
["CentOS Linux 7 x86_64 HVM EBS ENA 1805_01","2018-06-13T15:58:14.000Z"]
["CentOS Linux 7 x86_64 HVM EBS ENA 1804_2","2018-05-17T09:30:44.000Z"]
["CentOS Linux 7 x86_64 HVM EBS ENA 1803_01","2018-04-04T00:11:39.000Z"]
["CentOS Linux 7 x86_64 HVM EBS 1708_11.01","2017-12-05T14:49:18.000Z"]
```
```
$ aws ec2 describe-images --filters Name=owner-id,Values=137112412989 Name=is-public,Values=true Name=virtualization-type,Values=hvm Name=root-device-type,Values=ebs Name=block-device-mapping.volume-type,Values=gp2 | jq '.[] | sort_by(.CreationDate) | reverse | .[] | select(  (.Name | (contains("amzn2")|not)) and (.Name | (contains("rc")|not))  and (.Description|(contains("NAT")|not)) )'| jq -rc '[.Description,.CreationDate]'
["Amazon Linux AMI 2018.03.0.20181129 x86_64 HVM gp2","2018-11-28T21:08:10.000Z"]
["Amazon Linux AMI 2018.03.0.20181116 x86_64 HVM gp2","2018-11-17T00:54:52.000Z"]
["Amazon Linux AMI 2018.03.0.20180811 x86_64 HVM GP2","2018-08-11T02:29:45.000Z"]
["Amazon Linux AMI 2018.03.0.20180622 x86_64 HVM GP2","2018-06-22T22:27:00.000Z"]
["Amazon Linux AMI 2018.03.0.20180508 x86_64 HVM GP2","2018-05-08T18:06:57.000Z"]
["Amazon Linux AMI 2018.03.0.20180412 x86_64 HVM GP2","2018-04-13T00:32:56.000Z"]
["Amazon Linux AMI 2017.09.1-testlongids.20180307 x86_64 HVM GP2","2018-03-07T07:11:48.000Z"]
["Amazon Linux AMI 2017.09.1.20180307 x86_64 HVM GP2","2018-03-07T06:59:59.000Z"]
["Amazon Linux AMI 2017.09.1.20180115 x86_64 HVM GP2","2018-01-15T19:13:58.000Z"]
["Amazon Linux AMI 2017.09.1.20180108 x86_64 HVM GP2","2018-01-08T18:43:49.000Z"]
["Amazon Linux AMI 2017.09.1.20180103 x86_64 HVM GP2","2018-01-03T19:04:49.000Z"]
["Amazon Linux AMI 2017.09.1.20171120 x86_64 HVM GP2","2017-11-20T22:24:53.000Z"]
["Amazon Linux AMI 2017.09.1.20171103 x86_64 HVM GP2","2017-11-03T23:21:54.000Z"]
["Amazon Linux AMI 2017.09.0.20170930 x86_64 HVM GP2","2017-10-01T09:07:03.000Z"]
["Amazon Linux AMI 2017.03.1.20170812 x86_64 HVM GP2","2017-08-13T02:35:51.000Z"]
["Amazon Linux AMI 2017.03.1.20170623 x86_64 HVM GP2","2017-06-23T23:30:48.000Z"]
["Amazon Linux AMI 2017.03.1.20170617 x86_64 HVM GP2","2017-06-17T21:56:55.000Z"]
["Amazon Linux AMI 2017.03.0.20170417 x86_64 HVM GP2","2017-04-17T08:14:47.000Z"]
["Amazon Linux AMI 2017.03.0.20170401 x86_64 HVM GP2","2017-04-02T05:52:50.000Z"]
["Amazon Linux AMI 2016.09.1.20170119 x86_64 HVM GP2","2017-01-20T23:39:56.000Z"]
["Amazon Linux AMI 2016.09.1.20161221 x86_64 HVM GP2","2016-12-20T23:24:47.000Z"]
["Amazon Linux AMI 2016.09.0.20161028 x86_64 HVM GP2","2016-10-29T00:50:47.000Z"]
["Amazon Linux AMI 2016.09.0.20160923 x86_64 HVM GP2","2016-09-23T10:13:23.000Z"]
["Amazon Linux AMI 2016.03.3 x86_64 HVM GP2","2016-06-22T09:19:44.000Z"]
["Amazon Linux AMI 2016.03.2 x86_64 HVM GP2","2016-06-03T23:15:58.000Z"]
["Amazon Linux AMI 2016.03.1 x86_64 HVM GP2","2016-04-30T00:32:29.000Z"]
["Amazon Linux AMI 2016.03.0 x86_64 HVM GP2","2016-03-16T23:43:04.000Z"]
["Amazon Linux AMI 2015.09.2 x86_64 HVM GP2","2016-02-10T22:15:47.000Z"]
["Amazon Linux AMI 2015.09.1 x86_64 HVM GP2","2015-10-29T18:09:44.000Z"]
["Amazon Linux AMI 2015.09.0 x86_64 HVM GP2","2015-09-16T16:55:15.000Z"]
["Amazon Linux AMI 2015.03.1 x86_64 HVM GP2","2015-08-18T18:16:30.000Z"]
["Amazon Linux AMI 2015.03.0 x86_64 HVM GP2","2015-03-18T16:30:30.000Z"]
["Amazon Linux AMI 2014.09.2 x86_64 HVM GP2","2015-01-27T23:31:43.000Z"]
["Amazon Linux AMI 2014.09.1 x86_64 HVM GP2","2014-10-08T02:10:27.000Z"]
["Amazon Linux AMI 2014.09.0 x86_64 HVM GP2","2014-09-18T21:42:12.000Z"]
["Amazon Linux AMI 2014.03.2 x86_64 HVM GP2","2014-06-13T17:06:56.000Z"]
```
```
$ aws ec2 describe-images --filters Name=owner-id,Values=137112412989 Name=is-public,Values=true Name=virtualization-type,Values=hvm Name=root-device-type,Values=ebs Name=block-device-mapping.volume-type,Values=gp2 | jq -rc '.[] | sort_by(.CreationDate) | reverse | .[]|select( ( .Name | contains("amzn2"))  and (.Description | contains("Candidate")|not ) and (.Description | contains("Beta")|not)) |[.Description,.CreationDate]'
["Amazon Linux 2 LTS Arm64 AMI 2.0.20181114.1 arm64 HVM gp2","2018-11-27T03:53:22.000Z"]
["Amazon Linux 2 AMI 2.0.20181114 x86_64 HVM gp2","2018-11-14T09:06:55.000Z"]
["Amazon Linux 2 AMI 2.0.20181024 x86_64 HVM gp2","2018-10-24T21:06:50.000Z"]
["Amazon Linux 2 AMI 2.0.20181008 x86_64 HVM gp2","2018-10-08T01:32:44.000Z"]
["Amazon Linux 2 AMI 2.0.20180924 x86_64 HVM gp2","2018-09-26T19:29:06.000Z"]
["Amazon Linux 2 AMI 2.0.20180810 x86_64 HVM gp2","2018-08-11T03:42:08.000Z"]
["Amazon Linux 2 AMI 2.0.20180622.1 x86_64 HVM gp2","2018-06-22T23:18:05.000Z"]
```





https://wiki.centos.org/Cloud/AWS


| CentOS Version/Marketplace Link | Includes Updates | Virtualization Type | Product Code              |
|---------------------------------|------------------|---------------------|---------------------------|
| [CentOS-7 x86_64](https://aws.amazon.com/marketplace/pp/B00O7WM7QW)                 | Yes              | HVM                 | aw0evgkw8e5c1q413zgy5pjce |
| [CentOS-6 x86_64](https://aws.amazon.com/marketplace/pp/B00NQAYLWO)                 | Yes              | HVM                 | 6x5jmcajty9edm3f211pqjfn2 |


centos6 latest ?
-------------------
```
$ aws ec2 describe-images --filters \
Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 \
Name=is-public,Values=true | \
jq '.Images | sort_by(.CreationDate) | reverse | .[0]'

{
  "ProductCodes": [
    {
      "ProductCodeId": "6x5jmcajty9edm3f211pqjfn2",
      "ProductCodeType": "marketplace"
    }
  ],
  "Description": "CentOS Linux 6 x86_64 HVM EBS 1801_01",
  "VirtualizationType": "hvm",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "aws-marketplace",
  "EnaSupport": false,
  "ImageId": "ami-ff48629a",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/sda1",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": false,
        "VolumeType": "standard",
        "VolumeSize": 8,
        "SnapshotId": "snap-003162521aa57790e"
      }
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "aws-marketplace/CentOS Linux 6 x86_64 HVM EBS 1801_01-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-5d381c27.4",
  "RootDeviceType": "ebs",
  "OwnerId": "679593333241",
  "RootDeviceName": "/dev/sda1",
  "CreationDate": "2018-01-12T20:36:14.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CentOS Linux 6 x86_64 HVM EBS 1801_01-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-5d381c27.4"
}
```

image-id
```
$ aws ec2 describe-images --filters \
Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 \
Name=is-public,Values=true | \
jq -r '.Images | sort_by(.CreationDate) | reverse | .[0].ImageId'
ami-ff48629a
```



centos7 latest ?
-------------------
```
$ aws ec2 describe-images --filters \
Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce \
Name=is-public,Values=true | \
jq '.Images | sort_by(.CreationDate) | reverse | .[0]'
{
  "ProductCodes": [
    {
      "ProductCodeId": "aw0evgkw8e5c1q413zgy5pjce",
      "ProductCodeType": "marketplace"
    }
  ],
  "Description": "CentOS Linux 7 x86_64 HVM EBS 1801_01",
  "VirtualizationType": "hvm",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "aws-marketplace",
  "EnaSupport": false,
  "ImageId": "ami-e1496384",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/sda1",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": false,
        "VolumeType": "standard",
        "VolumeSize": 8,
        "SnapshotId": "snap-0f775b27dfa51f95d"
      }
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "aws-marketplace/CentOS Linux 7 x86_64 HVM EBS 1801_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-0a537770.4",
  "RootDeviceType": "ebs",
  "OwnerId": "679593333241",
  "RootDeviceName": "/dev/sda1",
  "CreationDate": "2018-01-12T20:37:06.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CentOS Linux 7 x86_64 HVM EBS 1801_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-0a537770.4"
}
```


image-id
```
$ aws ec2 describe-images --filters \
Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce \
Name=is-public,Values=true | \
jq -r '.Images | sort_by(.CreationDate) | reverse | .[0].ImageId'
ami-e1496384
```


amazon linux latest
---------------
```
$ aws ec2 describe-images --filters \
Name=owner-id,Values=137112412989 \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs \
Name=block-device-mapping.volume-type,Values=gp2 | \
jq '.[] | sort_by(.CreationDate) | reverse | .[] | select(  (.Name | (contains("amzn2")|not)) and (.Name | (contains("rc")|not))  )' | \
jq -s -r '.[0]'
{
  "VirtualizationType": "hvm",
  "Description": "Amazon Linux AMI 2017.09.1.20180115 x86_64 HVM GP2",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "amazon",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-f63b1193",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "SnapshotId": "snap-0da722d3235fa8c7c"
      }
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "amazon/amzn-ami-hvm-2017.09.1.20180115-x86_64-gp2",
  "RootDeviceType": "ebs",
  "OwnerId": "137112412989",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2018-01-15T19:14:52.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "amzn-ami-hvm-2017.09.1.20180115-x86_64-gp2"
}
```

image id
```
$ aws ec2 describe-images --filters \
Name=owner-id,Values=137112412989 \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs \
Name=block-device-mapping.volume-type,Values=gp2 | \
jq '.[] | sort_by(.CreationDate) | reverse | .[] | select(  (.Name | (contains("amzn2")|not)) and (.Name | (contains("rc")|not))  )' | \
jq -s -r '.[0].ImageId'
ami-f63b1193
```

amazon linux 2 Candidate
--------------
```
$ aws ec2 describe-images --filters \
Name=owner-id,Values=137112412989 \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs \
Name=block-device-mapping.volume-type,Values=gp2 | \
jq '.[] | sort_by(.CreationDate) | reverse | .[] | select( .Name | contains("amzn2") )' | \
jq -s -r '.[0]'
{
  "VirtualizationType": "hvm",
  "Description": "Amazon Linux 2 LTS Candidate AMI 2017.12.0.20180115 x86_64 HVM GP2",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "amazon",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-710e2414",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "SnapshotId": "snap-0848a83c5d862ba5d"
      }
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "amazon/amzn2-ami-hvm-2017.12.0.20180115-x86_64-gp2",
  "RootDeviceType": "ebs",
  "OwnerId": "137112412989",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2018-01-16T19:06:49.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "amzn2-ami-hvm-2017.12.0.20180115-x86_64-gp2"
}
```

image id
```
$ aws ec2 describe-images --filters \
Name=owner-id,Values=137112412989 \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs \
Name=block-device-mapping.volume-type,Values=gp2 | \
jq '.[] | sort_by(.CreationDate) | reverse | .[] | select( .Name | contains("amzn2") )' | \
jq -s -r '.[0].ImageId'
ami-710e2414
```

amazonlinux 2 GA
--------------
```console
$  aws ec2 describe-images \
--filters \
Name=owner-id,Values=137112412989 \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs \
| jq  \
'.[] | sort_by(.CreationDate) | reverse | .[] | select( (.Name | contains("amzn2"))  and (.Description | (contains("Candidate")|not)))' | \
jq -s
[
  {
    "Architecture": "x86_64",
    "CreationDate": "2018-06-22T23:29:16.000Z",
    "ImageId": "ami-37efa14f",
    "ImageLocation": "amazon/amzn2-ami-minimal-hvm-2.0.20180622.1-x86_64-ebs",
    "ImageType": "machine",
    "Public": true,
    "OwnerId": "137112412989",
    "State": "available",
    "BlockDeviceMappings": [
      {
        "DeviceName": "/dev/xvda",
        "Ebs": {
          "Encrypted": false,
          "DeleteOnTermination": true,
          "SnapshotId": "snap-04e358335dc927649",
          "VolumeSize": 2,
          "VolumeType": "standard"
        }
      }
    ],
    "Description": "Amazon Linux 2 AMI 2.0.20180622.1 x86_64 Minimal HVM ebs",
    "EnaSupport": true,
    "Hypervisor": "xen",
    "ImageOwnerAlias": "amazon",
    "Name": "amzn2-ami-minimal-hvm-2.0.20180622.1-x86_64-ebs",
    "RootDeviceName": "/dev/xvda",
    "RootDeviceType": "ebs",
    "SriovNetSupport": "simple",
    "VirtualizationType": "hvm"
  },
  {
    "Architecture": "x86_64",
    "CreationDate": "2018-06-22T23:18:05.000Z",
    "ImageId": "ami-a9d09ed1",
    "ImageLocation": "amazon/amzn2-ami-hvm-2.0.20180622.1-x86_64-gp2",
    "ImageType": "machine",
    "Public": true,
    "OwnerId": "137112412989",
    "State": "available",
    "BlockDeviceMappings": [
      {
        "DeviceName": "/dev/xvda",
        "Ebs": {
          "Encrypted": false,
          "DeleteOnTermination": true,
          "SnapshotId": "snap-016137d6e1416028c",
          "VolumeSize": 8,
          "VolumeType": "gp2"
        }
      }
    ],
    "Description": "Amazon Linux 2 AMI 2.0.20180622.1 x86_64 HVM gp2",
    "EnaSupport": true,
    "Hypervisor": "xen",
    "ImageOwnerAlias": "amazon",
    "Name": "amzn2-ami-hvm-2.0.20180622.1-x86_64-gp2",
    "RootDeviceName": "/dev/xvda",
    "RootDeviceType": "ebs",
    "SriovNetSupport": "simple",
    "VirtualizationType": "hvm"
  },
  {
    "Architecture": "x86_64",
    "CreationDate": "2018-06-22T23:14:22.000Z",
    "ImageId": "ami-bdd09ec5",
    "ImageLocation": "amazon/amzn2-ami-hvm-2.0.20180622.1-x86_64-ebs",
    "ImageType": "machine",
    "Public": true,
    "OwnerId": "137112412989",
    "State": "available",
    "BlockDeviceMappings": [
      {
        "DeviceName": "/dev/xvda",
        "Ebs": {
          "Encrypted": false,
          "DeleteOnTermination": true,
          "SnapshotId": "snap-0a804dc9dd7c09d1e",
          "VolumeSize": 8,
          "VolumeType": "standard"
        }
      }
    ],
    "Description": "Amazon Linux 2 AMI 2.0.20180622.1 x86_64 HVM ebs",
    "EnaSupport": true,
    "Hypervisor": "xen",
    "ImageOwnerAlias": "amazon",
    "Name": "amzn2-ami-hvm-2.0.20180622.1-x86_64-ebs",
    "RootDeviceName": "/dev/xvda",
    "RootDeviceType": "ebs",
    "SriovNetSupport": "simple",
    "VirtualizationType": "hvm"
  }
]
```
