
centos6 latest ?
```
aws ec2 describe-images --filters \
Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 \
Name=is-public,Values=true | \
jq -r '.Images[]|.Name,.ImageId,.Public'

CentOS Linux 6 x86_64 HVM EBS 1602-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-21e6d54b.3
ami-05cf2265
true
```


centos7 latest ?
```
aws ec2 describe-images --filters \
Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce \
Name=is-public,Values=true | \
jq -r '.Images[]|.Name,.ImageId,.Public'

CentOS Linux 7 x86_64 HVM EBS 1602-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-d7e1d2bd.3
ami-d2c924b2
true
```





```bash
 aws ec2 describe-images --filters Name=name,Values="CentOS Linux 6*" |jq -r
{
  "Images": [
    {
      "ProductCodes": [
        {
          "ProductCodeId": "6x5jmcajty9edm3f211pqjfn2",
          "ProductCodeType": "marketplace"
        }
      ],
      "Name": "CentOS Linux 6 x86_64 HVM EBS 1602-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-21e6d54b.3",
      "VirtualizationType": "hvm",
      "Hypervisor": "xen",
      "ImageOwnerAlias": "aws-marketplace",
      "ImageId": "ami-05cf2265",
      "State": "available",
      "BlockDeviceMappings": [
        {
          "DeviceName": "/dev/sda1",
          "Ebs": {
            "DeleteOnTermination": false,
            "SnapshotId": "snap-be15e226",
            "VolumeSize": 8,
            "VolumeType": "standard",
            "Encrypted": false
          }
        }
      ],
      "Architecture": "x86_64",
      "ImageLocation": "aws-marketplace/CentOS Linux 6 x86_64 HVM EBS 1602-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-21e6d54b.3",
      "RootDeviceType": "ebs",
      "OwnerId": "679593333241",
      "RootDeviceName": "/dev/sda1",
      "CreationDate": "2016-02-26T21:16:09.000Z",
      "Public": true,
      "ImageType": "machine",
      "Description": "CentOS Linux 6 x86_64 HVM EBS 1602"
    },
    {
      "ProductCodes": [
        {
          "ProductCodeId": "6x5jmcajty9edm3f211pqjfn2",
          "ProductCodeType": "marketplace"
        }
      ],
      "Name": "CentOS Linux 6 x86_64 HVM EBS 20150928_0-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-2b35794e.2",
      "VirtualizationType": "hvm",
      "Hypervisor": "xen",
      "ImageOwnerAlias": "aws-marketplace",
      "ImageId": "ami-1255b321",
      "State": "available",
      "BlockDeviceMappings": [
        {
          "DeviceName": "/dev/sda1",
          "Ebs": {
            "DeleteOnTermination": false,
            "SnapshotId": "snap-5e6e07c7",
            "VolumeSize": 8,
            "VolumeType": "standard",
            "Encrypted": false
          }
        }
      ],
      "Architecture": "x86_64",
      "ImageLocation": "aws-marketplace/CentOS Linux 6 x86_64 HVM EBS 20150928_0-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-2b35794e.2",
      "RootDeviceType": "ebs",
      "OwnerId": "679593333241",
      "RootDeviceName": "/dev/sda1",
      "CreationDate": "2015-10-13T22:57:01.000Z",
      "Public": false,
      "ImageType": "machine",
      "Description": "CentOS Linux 6 x86_64 HVM EBS 20150928_01"
    }
  ]
}

```

centos7

```
aws ec2 describe-images --filters Name=name,Values="CentOS Linux 7*" \
Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce | \
jq -r '.[][]|.Name,.ImageId'
CentOS Linux 7 x86_64 HVM EBS 1602-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-d7e1d2bd.3
ami-d2c924b2
CentOS Linux 7 x86_64 HVM EBS 20150928_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-69327e0c.2
ami-d440a6e7
```

centos6

```
 aws ec2 describe-images --filters Name=name,Values="CentOS Linux 6*" Name=product-code,Values=6x5jmcajty9edm3f211pqjfn2 |jq -r '.Images[]|.Name,.ImageId'
CentOS Linux 6 x86_64 HVM EBS 1602-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-21e6d54b.3
ami-05cf2265
CentOS Linux 6 x86_64 HVM EBS 20150928_0-74e73035-3435-48d6-88e0-89cc02ad83ee-ami-2b35794e.2
ami-1255b321
```
