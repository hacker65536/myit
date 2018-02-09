
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
