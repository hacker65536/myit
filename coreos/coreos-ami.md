```
$ aws ec2 describe-images \
--filters "Name=description,Values=CoreOS Container Linux stable*" \
Name=is-public,Values=true \
Name=virtualization-type,Values=hvm \
Name=root-device-type,Values=ebs | \
jq  '.[] | sort_by(.CreationDate) | reverse |.[0,1,2,3]'
```

```json
{
  "ProductCodes": [
    {
      "ProductCodeId": "ryg425ue2hwnsok9ccfastg4",
      "ProductCodeType": "marketplace"
    }
  ],
  "Description": "CoreOS Container Linux stable 1967.6.0 (HVM)",
  "VirtualizationType": "hvm",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "aws-marketplace",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-0c7e2d386ff2156d1",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "SnapshotId": "snap-0dbf46be7f456191d",
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "Encrypted": false
      }
    },
    {
      "DeviceName": "/dev/xvdb",
      "VirtualName": "ephemeral0"
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "aws-marketplace/CoreOS-stable-1967.6.0-hvm-0d1e0bd0-eaea-4397-9a3a-c56f861d2a14-ami-0089347d530e1f3e6.4",
  "RootDeviceType": "ebs",
  "OwnerId": "679593333241",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2019-02-13T09:59:53.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CoreOS-stable-1967.6.0-hvm-0d1e0bd0-eaea-4397-9a3a-c56f861d2a14-ami-0089347d530e1f3e6.4"
}
{
  "VirtualizationType": "hvm",
  "Description": "CoreOS Container Linux stable 1967.6.0 (HVM)",
  "Hypervisor": "xen",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-0089347d530e1f3e6",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "SnapshotId": "snap-00a72ecfcb6c3cf01",
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "Encrypted": false
      }
    },
    {
      "DeviceName": "/dev/xvdb",
      "VirtualName": "ephemeral0"
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "595879546273/CoreOS-stable-1967.6.0-hvm",
  "RootDeviceType": "ebs",
  "OwnerId": "595879546273",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2019-02-12T22:20:29.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CoreOS-stable-1967.6.0-hvm"
}
{
  "VirtualizationType": "hvm",
  "Description": "CoreOS Container Linux stable 1967.5.0 (HVM)",
  "Hypervisor": "xen",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-0c6731558e5ca73f6",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "SnapshotId": "snap-0422652290a861f77",
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "Encrypted": false
      }
    },
    {
      "DeviceName": "/dev/xvdb",
      "VirtualName": "ephemeral0"
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "595879546273/CoreOS-stable-1967.5.0-hvm",
  "RootDeviceType": "ebs",
  "OwnerId": "595879546273",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2019-02-11T19:19:38.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CoreOS-stable-1967.5.0-hvm"
}
{
  "ProductCodes": [
    {
      "ProductCodeId": "ryg425ue2hwnsok9ccfastg4",
      "ProductCodeType": "marketplace"
    }
  ],
  "Description": "CoreOS Container Linux stable 1967.4.0 (HVM)",
  "VirtualizationType": "hvm",
  "Hypervisor": "xen",
  "ImageOwnerAlias": "aws-marketplace",
  "EnaSupport": true,
  "SriovNetSupport": "simple",
  "ImageId": "ami-04e5e7c8813c46e4d",
  "State": "available",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "SnapshotId": "snap-0a539b0c1b8791885",
        "DeleteOnTermination": true,
        "VolumeType": "gp2",
        "VolumeSize": 8,
        "Encrypted": false
      }
    },
    {
      "DeviceName": "/dev/xvdb",
      "VirtualName": "ephemeral0"
    }
  ],
  "Architecture": "x86_64",
  "ImageLocation": "aws-marketplace/CoreOS-stable-1967.4.0-hvm-0d1e0bd0-eaea-4397-9a3a-c56f861d2a14-ami-03b89dc7d999dd591.4",
  "RootDeviceType": "ebs",
  "OwnerId": "679593333241",
  "RootDeviceName": "/dev/xvda",
  "CreationDate": "2019-01-30T10:23:04.000Z",
  "Public": true,
  "ImageType": "machine",
  "Name": "CoreOS-stable-1967.4.0-hvm-0d1e0bd0-eaea-4397-9a3a-c56f861d2a14-ami-03b89dc7d999dd591.4"
}
```
