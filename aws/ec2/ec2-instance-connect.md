

target
--

```console
[ec2-user@ip-172-31-13-102 ~]$ sudo yum list installed "ec2-instance*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Installed Packages
ec2-instance-connect.noarch        1.1-9.amzn2              
```

`$ aws iam get-role-policy --role-name amitest-ec2-role --policy-name test_policy`
```json
{
    "RoleName": "amitest-ec2-role",
    "PolicyDocument": {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "ec2-instance-connect:SendSSHPublicKey",
                "Resource": "*",
                "Effect": "Allow",
                "Condition": {
                    "StringEquals": {
                        "ec2:osuser": "ec2-user"
                    }
                },
                "Sid": "vpc2"
            }
        ]
    },
    "PolicyName": "test_policy"
}
```


host
--
```console
[ec2-user@ip-172-31-9-227]$ ssh-keygen -t rsa -f newkey -N "" -C ""
```


```console
[ec2-user@ip-172-31-9-227]$ aws --region us-east-2  ec2-instance-connect send-ssh-public-key --instance-id i-0a41175105a58939d --ssh-public-key file://newkey.pub --availability-zone us-east-2a --instance-os-user ec2-user
{
    "RequestId": "0a9c2195-4d8b-41c6-9869-2b23c31492e6",
    "Success": true
}
```


```console
[ec2-user@ip-172-31-9-227]$ ssh -i newkey -l ec2-user 172.31.13.102
Last login: Fri Jul 19 07:04:29 2019 from ip-172-31-9-227.us-east-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
No packages needed for security; 6 packages available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-13-102 ~]$
```


log
--

```console
$ aws --region us-east-2 cloudtrail lookup-events --lookup-attributes AttributeKey=EventSource,AttributeValue=ec2-instance-connect.amazonaws.com| jq -rc '.[][]|[.Username,.EventTime,.EventName]'
["username",1563520079,"SendSSHPublicKey"]
["username",1563519843,"SendSSHPublicKey"]
["username",1563519833,"SendSSHPublicKey"]
```
