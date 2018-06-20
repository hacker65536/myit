https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html


preparation
----------
- jq 
- aws-cli (1.15.32+)

install jq
```console
$ sudo yum install -y jq
```
install pip
```console
$ sudo yum install -y python-pip 
```
install latest awscli
```console
$ pip install --user -U awscli
```
configure path
```console
$ echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
$ bash -l
```
show version of awscli
```console
$ aws --version
aws-cli/1.15.41 Python/2.7.14 Linux/4.14.33-59.37.amzn2.x86_64 botocore/1.10.41
```

aws configure (create user permitted to do operation needed privileges of admin)
```console
$ aws configure --profile default set aws_access_key_id <AWS_ACCESS_KEY_ID>
$ aws configure --profile default set aws_secret_access_key <AWS_SECRET_ACCESS_KEY>
$ aws configure --profile default set region us-west-2
```

```console
$ aws configure list --profile default
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                  default           manual    --profile
access_key     ****************AAAA shared-credentials-file
secret_key     ****************BBBB shared-credentials-file
    region                us-west-2      config-file    ~/.aws/config
```

if using cross account  
https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html
```console
$ aws configure --profile default set role_arn <arn:aws:iam:000000000000:role/ROLE_NAME>
$ aws configure --profile default set source_profile <default>
$ aws configure --profile default set role_session_name <MYNAME>
```
```console
$ aws sts get-caller-identity --query 'Account'
"000000000000"
```



create role for eks
```console
$ role_name=eks-test-role
$ trust_relationship=$(echo '{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "eks.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
' | jq -c -M .)
$ aws iam create-role --role-name "${role_name}" --assume-role-policy-document "${trust_relationship}"
{
    "Role": {
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Action": "sts:AssumeRole",
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                }
            }
        },
        "RoleId": "AROAIGE2KTOJWTX7R43PI",
        "CreateDate": "2018-06-15T10:52:48.282Z",
        "RoleName": "eks-test-role",
        "Path": "/",
        "Arn": "arn:aws:iam::000000000000:role/eks-test-role"
    }
}
$ aws iam attach-role-policy !:3 !:4 --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
$ ^Cluster^Service
```


create vpc for eks
```console
$ aws cloudformation create-stack \
--stack-name ekstest \
--template-url https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/amazon-eks-vpc-sample.yaml
{
    "StackId": "arn:aws:cloudformation:us-west-2:000000000000:stack/ekstest/87a4a900-7075-11e8-9253-50a686be73f2"
}
```

show list of resources
```console
$ aws cloudformation describe-stack-resources --stack-name ekstest | jq -c -S '.[][]| [.ResourceType,.PhysicalResourceId]'
["AWS::EC2::SecurityGroup","sg-db2271aa"]
["AWS::EC2::InternetGateway","igw-7b8dd81d"]
["AWS::EC2::Route","ekste-Route-ITPQIUOCMT6C"]
["AWS::EC2::RouteTable","rtb-1497716f"]
["AWS::EC2::Subnet","subnet-b8e58bc1"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-9d041ee7"]
["AWS::EC2::Subnet","subnet-2e8e0565"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-12071d68"]
["AWS::EC2::Subnet","subnet-d2cf8b88"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-eb011b91"]
["AWS::EC2::VPC","vpc-f4d6c28d"]
["AWS::EC2::VPCGatewayAttachment","ekste-VPCGa-1DH1ZA6ROGXVS"]
```

install kubectl for eks
```console
$ curl -SsL -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/kubectl
$ chmod +x !$:t
$ mv !$ $HOME/bin/ 
$ echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
$ bash -l
$ kubectl version --short --client
Client Version: v1.10.3
```

install heptio-authenticator-aws for eks
```console
$ curl -SsL -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws
$ chmod +x !$:t
$ mv !$ $HOME/bin/
