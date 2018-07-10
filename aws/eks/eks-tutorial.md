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
$ aws configure --profile default set role_session_name <SESSION_NAME>
```
```console
$ aws sts get-caller-identity --query 'Account'
{
    "Account": "000000000000",
    "UserId": "AWOBJKF2PW5EU64TL3LQA:MYNAME",
    "Arn": "arn:aws:sts::000000000000:assumed-role/ROLE_NAME/SESSION_NAME"
}
```



create role for eks
```console
$ myenv=ekstmp
$ trust_relationship=$(echo '{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "eks.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
' | jq -c -M .)
$ aws iam create-role --role-name "${myenv}-role" --assume-role-policy-document "${trust_relationship}"
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
        "Arn": "arn:aws:iam::000000000000:role/ekstmp-role"
    }
}
$ aws iam attach-role-policy !:3 !:4 --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
$ ^Cluster^Service
```


create vpc from cf for eks
```console
$ aws cloudformation create-stack \
--stack-name ${myenv} \
--template-url https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/amazon-eks-vpc-sample.yaml
{
    "StackId": "arn:aws:cloudformation:us-west-2:000000000000:stack/ekstmp/87a4a900-7075-11e8-9253-50a686be73f2"
}
```

show list of resources
```console
$ aws cloudformation describe-stack-resources \
--stack-name ${myenv} | \
jq -c -S '.[][]| [.ResourceType,.PhysicalResourceId]'
["AWS::EC2::SecurityGroup","sg-08390e79"]
["AWS::EC2::InternetGateway","igw-020a5c64"]
["AWS::EC2::Route","ekstm-Route-7N3YKKHA2V8J"]
["AWS::EC2::RouteTable","rtb-47fe123c"]
["AWS::EC2::Subnet","subnet-c56802bc"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-ed43ae90"]
["AWS::EC2::Subnet","subnet-256cf86e"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-dd46aba0"]
["AWS::EC2::Subnet","subnet-cbaced91"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-2b42af56"]
["AWS::EC2::VPC","vpc-94e3f3ed"]
["AWS::EC2::VPCGatewayAttachment","ekstm-VPCGa-AONQ2OFW94FS"]
```

install kubectl for eks
```console
$ curl -SsL -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/kubectl
$ chmod +x !$:t
$ mv !$ $HOME/.local/bin/
$ kubectl version --short --client
Client Version: v1.10.3
```

install heptio-authenticator-aws for eks
```console
$ curl -SsL -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws
$ chmod +x !$:t
$ mv !$ $HOME/.local/bin/
$ heptio-authenticator-aws help
A tool to authenticate to Kubernetes using AWS IAM credentials

Usage:
  heptio-authenticator-aws [command]

Available Commands:
  help        Help about any command
  init        Pre-generate certificate, private key, and kubeconfig files for the server.
  server      Run a webhook validation server suitable that validates tokens using AWS IAM
  token       Authenticate using AWS IAM and get token for Kubernetes
  verify      Verify a token for debugging purpose

Flags:
  -i, --cluster-id ID     Specify the cluster ID, a unique-per-cluster identifier for your heptio-authenticator-aws installation.
  -c, --config filename   Load configuration from filename
  -h, --help              help for heptio-authenticator-aws

Use "heptio-authenticator-aws [command] --help" for more information about a command.
```

create eks cluster 
```console
$ role=$(aws iam get-role --role-name "${myenv}-role" --query Role.Arn | jq -r .)
$ subnetids=$(aws cloudformation describe-stack-resources --stack-name ${myenv} --query 'StackResources[?ResourceType==`AWS::EC2::Subnet`]' | jq -r 'map(.PhysicalResourceId)|@csv' |tr -d '"')
$ sg=$(aws cloudformation describe-stack-resources --stack-name ${myenv} --query 'StackResources[?ResourceType==`AWS::EC2::SecurityGroup`]' | jq -r '.[].PhysicalResourceId')
```
```console
$ aws eks create-cluster --name ${myenv} --role-arn "$role" --resources-vpc-config subnetIds=${subnetids},securityGroupIds=$sg
{
    "cluster": {
        "status": "CREATING",
        "name": "ekstmp",
        "certificateAuthority": {},
        "roleArn": "arn:aws:iam::000000000000:role/ekstmp-role",
        "resourcesVpcConfig": {
            "subnetIds": [
                "subnet-c56802bc",
                "subnet-256cf86e",
                "subnet-cbaced91"
            ],
            "vpcId": "vpc-94e3f3ed",
            "securityGroupIds": [
                "sg-08390e79"
            ]
        },
        "version": "1.10",
        "arn": "arn:aws:eks:us-west-2:000000000000:cluster/ekstmp",
        "createdAt": 1529560916.597
    }
}
```
```console
$ aws eks describe-cluster --name ${myenv} --query cluster.status
"ACTIVE"
```
```console
$ aws eks describe-cluster --name ${myenv} --query cluster.endpoint
"https://2CA0A15B60C0B8EBCDA1E41E9493E030.sk1.us-west-2.eks.amazonaws.com"
```

```console
$ aws eks describe-cluster --name ${myenv} --query cluster.certificateAuthority.data
"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnp
--snip--uWHBvR2FWVXcvY043V1ZVN2NRaQptSitIaEROc2ppdmxXRVdVU1BLcnFQVUNYWWwxQlBCN3RZVVNBMG9zNWxqTDJ0dWhUa3lTMVJvVURwWT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
```



```
$ aws iam get-role --role-name ${myenv}-role --query 'Role.Arn'
"arn:aws:iam::000000000000:role/ekstmp-role"
```

```yaml
apiVersion: v1
clusters:
- cluster:
    server: <endpoint-url>
    certificate-authority-data: <base64-encoded-ca-cert>
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: heptio-authenticator-aws
      args:
        - "token"
        - "-i"
        - "<cluster-name>"
        # - "-r"
        # - "<role-arn>"
      # env:
        # - name: AWS_PROFILE
        #   value: "<aws-profile>"
```
