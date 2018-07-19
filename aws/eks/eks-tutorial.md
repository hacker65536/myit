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
aws-cli/1.15.61 Python/2.7.14 Linux/4.14.33-59.37.amzn2.x86_64 botocore/1.10.60
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

if using cross account add following
https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html
```console
$ aws configure --profile default set role_arn <arn:aws:iam:000000000000:role/ROLE_NAME>
$ aws configure --profile default set source_profile <default>
$ aws configure --profile default set role_session_name <SESSION_NAME>
```
```console
$ aws sts get-caller-identity # --query 'Account'
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
    "StackId": "arn:aws:cloudformation:us-west-2:000000000000:stack/ekstmp/b90e07a0-8b02-11e8-83cb-503ac9316861"
}
```

show list of resources
```console
$ aws cloudformation describe-stack-resources \
> --stack-name ${myenv} | \
> jq -c -S '.[][]| [.ResourceType,.PhysicalResourceId]'
["AWS::EC2::SecurityGroup","sg-8a5c38fa"]
["AWS::EC2::InternetGateway","igw-d73d19b1"]
["AWS::EC2::Route","ekstm-Route-SM139PSVYR5Q"]
["AWS::EC2::RouteTable","rtb-b4be76cf"]
["AWS::EC2::Subnet","subnet-e268289b"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-e8b71095"]
["AWS::EC2::Subnet","subnet-41c4a60a"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-f3b0178e"]
["AWS::EC2::Subnet","subnet-2bc29071"]
["AWS::EC2::SubnetRouteTableAssociation","rtbassoc-d9a700a4"]
["AWS::EC2::VPC","vpc-ff24ce87"]
["AWS::EC2::VPCGatewayAttachment","ekstm-VPCGa-GD97KJ7Y3Q8T"]
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
$ echo $role
arn:aws:iam::000000000000:role/ekstmp-role
```

```console
$ subnetids=$(aws cloudformation describe-stack-resources --stack-name ${myenv} --query 'StackResources[?ResourceType==`AWS::EC2::Subnet`]' | jq -r 'map(.PhysicalResourceId)|@csv' |tr -d '"')
$ echo $subnetids
subnet-e268289b,subnet-41c4a60a,subnet-2bc29071
```

```console
$ sg=$(aws cloudformation describe-stack-resources --stack-name ${myenv} --query 'StackResources[?ResourceType==`AWS::EC2::SecurityGroup`]' | jq -r '.[].PhysicalResourceId')
$ echo $sg
sg-8a5c38fa
```
```console
$ vpcid=$(aws cloudformation describe-stack-resources --stack-name ${myenv} --query 'StackResources[?ResourceType==`AWS::EC2::VPC`]' | jq -r '.[].PhysicalResourceId')
$ echo $vpcid
vpc-ff24ce87
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
                "subnet-e268289b",
                "subnet-41c4a60a",
                "subnet-2bc29071"
            ],
            "vpcId": "vpc-ff24ce87",
            "securityGroupIds": [
                "sg-8a5c38fa"
            ]
        },
        "version": "1.10",
        "arn": "arn:aws:eks:us-west-2:000000000000:cluster/ekstmp",
        "createdAt": 1531971069.818
    }
}
```

```console
$ aws eks describe-cluster --name ${myenv} --query cluster.status
"CREATING"
```
wait a bit
```console
$ aws eks describe-cluster --name ${myenv} --query cluster.status
"ACTIVE"
```
```console
$ endp=$(aws eks describe-cluster --name ${myenv} --query cluster.endpoint| jq -r .)
$ echo $endp
"https://7BA864A09EED630B9D611FCF9CAB689B.yl4.us-west-2.eks.amazonaws.com"
```

```console
$ cert=$(aws eks describe-cluster --name ${myenv} --query cluster.certificateAuthority.data | jq -r .)
$ echo $cert
LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2l
--snip--
wVFNxUER6aWRvT0RXMGc0MGVTR0dsMGxNaGpmdC9TOD0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
```


```
$ rolearn=$(aws iam get-role --role-name ${myenv}-role --query 'Role.Arn' | jq -r .)
$ echo $rolearn
arn:aws:iam::000000000000:role/ekstmp-role
```

```console
$ mkdir -p ~/.kube
```
```console
$ touch !$/config-${myenv}
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

```console
$ cat <<EOF > !$
apiVersion: v1
clusters:
- cluster:
    server: $endp
    certificate-authority-data: $cert
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
        - "${myenv}"
        # - "-r"
        # - "<role-arn>"
      # env:
        # - name: AWS_PROFILE
        #   value: "<aws-profile>"
EOF
```

```console
$ export KUBECONFIG=$KUBECONFIG:~/.kube/config-ekstmp
$ echo $KUBECONFIG
:/home/ec2-user/.kube/config-ekstmp
```


```console
$ kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   19d
```

get ami-id(eks optimize)
```console
$ aws ec2 describe-images --image-id ami-73a6e20b
{
    "Images": [
        {
            "VirtualizationType": "hvm",
            "Description": "Kubernetes Worker AMI with AmazonLinux2 image",
            "Hypervisor": "xen",
            "EnaSupport": true,
            "SriovNetSupport": "simple",
            "ImageId": "ami-73a6e20b",
            "State": "available",
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda",
                    "Ebs": {
                        "Encrypted": false,
                        "DeleteOnTermination": true,
                        "VolumeType": "gp2",
                        "VolumeSize": 20,
                        "SnapshotId": "snap-01d7262bcf617a3b2"
                    }
                }
            ],
            "Architecture": "x86_64",
            "ImageLocation": "602401143452/eks-worker-v20",
            "RootDeviceType": "ebs",
            "OwnerId": "602401143452",
            "RootDeviceName": "/dev/xvda",
            "CreationDate": "2018-06-04T06:02:17.000Z",
            "Public": true,
            "ImageType": "machine",
            "Name": "eks-worker-v20"
        }
    ]
}
```
```console
$ ami=$(aws ec2 describe-images --filters Name=owner-id,Values=602401143452 Name=is-public,Values=true Name=virtualization-type,Values=hvm Name=root-device-type,Values=ebs Name=name,Values=*eks-worker* | jq  '.[] | sort_by(.CreationDate) | reverse | .[] | select( (.Description | (contains("Candidate")|not)) and   (.Description | (contains("Minimal")|not))  )' | jq -s -r '.[0].ImageId')
$ echo $ami
ami-73a6e20b
```
create key pair
```console
$ aws ec2 create-key-pair --key-name ${myenv}-key | jq .KeyMaterial -r > ${myenv}-key_pair
$ chmod 600 !$
```

parameters

```console
$ params=$(cat <<EOF | jq -r -c '.'
[
  {
    "ParameterKey": "ClusterName",
    "ParameterValue": "${myenv}"
  },
  {
    "ParameterKey": "ClusterControlPlaneSecurityGroup",
    "ParameterValue": "${sg}"
  },
  {
    "ParameterKey": "NodeGroupName",
    "ParameterValue": "${myenv}-nodes"
  },
  {
    "ParameterKey": "NodeImageId",
    "ParameterValue": "${ami}"
  },
  {
    "ParameterKey": "KeyName",
    "ParameterValue": "${myenv}-key"
  },
  {
    "ParameterKey": "VpcId",
    "ParameterValue": "${vpcid}"
  },
  {
    "ParameterKey": "Subnets",
    "ParameterValue": "${subnetids}"
  }
]
EOF
)
```

```console
$ aws cloudformation create-stack \
--stack-name ${myenv}-worker-nodes \
--parameters ${params} \
--capabilities CAPABILITY_IAM \
--template-url https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/amazon-eks-nodegroup.yaml
```

```console
$ aws cloudformation describe-stack-resources \
> --stack-name ${myenv}-worker-nodes | \
> jq -c -S '.[][]| [.ResourceType,.PhysicalResourceId]'
["AWS::EC2::SecurityGroupIngress","ClusterControlPlaneSecurityGroupIngress"]
["AWS::EC2::SecurityGroupEgress","ekstmp-worker-nodes-ControlPlaneEgressToNodeSecurityGroup-CKW309EGGR2D"]
["AWS::AutoScaling::AutoScalingGroup","ekstmp-worker-nodes-NodeGroup-1XG3M5O6E1S9Z"]
["AWS::IAM::InstanceProfile","ekstmp-worker-nodes-NodeInstanceProfile-2W489MWFNHXY"]
["AWS::IAM::Role","ekstmp-worker-nodes-NodeInstanceRole-1M2DZNMD8XSGY"]
["AWS::AutoScaling::LaunchConfiguration","ekstmp-worker-nodes-NodeLaunchConfig-F4RK5O8S5GXX"]
["AWS::EC2::SecurityGroup","sg-a9bc25d9"]
["AWS::EC2::SecurityGroupIngress","NodeSecurityGroupFromControlPlaneIngress"]
["AWS::EC2::SecurityGroupIngress","NodeSecurityGroupIngress"]
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: <ARN of instance role (not instance profile)>
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
```        

```console
$ kubectl apply -f aws-auth-cm.yaml
configmap "aws-auth" created
```
