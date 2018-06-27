
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
$  aws ec2 describe-images --filters Name=owner-id,Values=137112412989 Name=is-public,Values=true Name=virtualization-type,Values=hvm Name=root-device-type,Values=ebs  | jq  '.[] | sort_by(.CreationDate) | reverse | .[] | select( (.Name | contains("amzn2"))  and (.Description | (contains("Candidate")|not)))' | jq -s
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
