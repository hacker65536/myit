```json
{
    "Images": [
        {
            "VirtualizationType": "hvm",
            "Description": "EKS Kubernetes Worker AMI with AmazonLinux2 image (k8s: 1.11.5/2018-12-06/bin/linux/amd64, docker:18.06)",
            "Hypervisor": "xen",
            "EnaSupport": true,
            "SriovNetSupport": "simple",
            "ImageId": "ami-0eeeef929db40543c",
            "State": "available",
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda",
                    "Ebs": {
                        "SnapshotId": "snap-086c007a9cc56077d",
                        "DeleteOnTermination": true,
                        "VolumeType": "gp2",
                        "VolumeSize": 20,
                        "Encrypted": false
                    }
                }
            ],
            "Architecture": "x86_64",
            "ImageLocation": "602401143452/amazon-eks-node-1.11-v20190220",
            "RootDeviceType": "ebs",
            "OwnerId": "602401143452",
            "RootDeviceName": "/dev/xvda",
            "CreationDate": "2019-02-19T00:52:49.000Z",
            "Public": true,
            "ImageType": "machine",
            "Name": "amazon-eks-node-1.11-v20190220"
        }
    ]
}
```
