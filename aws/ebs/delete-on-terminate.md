
```
$ aws ec2 describe-instance-attribute --instance-id  i-00000000000000000 --attribute blockDeviceMapping 
{
    "InstanceId": "i-00000000000000000",
    "BlockDeviceMappings": [
        {
            "DeviceName": "/dev/sda1",
            "Ebs": {
                "Status": "attached",
                "DeleteOnTermination": false,
                "VolumeId": "vol-0221e40f176b603b4",
                "AttachTime": "2019-06-11T07:32:38.000Z"
            }
        }
    ]
}
```

```
$ cat vol.json
[
        {
                "DeviceName": "/dev/sda1",
                "Ebs": {
                        "DeleteOnTermination": true
                }
        }
]
```

```
$ aws ec2 modify-instance-attribute --instance-id i-00000000000000000 --block-device-mappings file://vol.json 
```


```
$  aws ec2 describe-instance-attribute --instance-id  i-00000000000000000 --attribute blockDeviceMapping 
{
    "InstanceId": "i-00000000000000000",
    "BlockDeviceMappings": [
        {
            "DeviceName": "/dev/sda1",
            "Ebs": {
                "Status": "attached",
                "DeleteOnTermination": true,
                "VolumeId": "vol-0221e40f176b603b4",
                "AttachTime": "2019-06-11T07:32:38.000Z"
            }
        }
    ]
}
```
