# eks quick start

https://github.com/aws-quickstart/quickstart-amazon-eks

https://s3.amazonaws.com/aws-quickstart/quickstart-amazon-eks/doc/amazon-eks-architecture.pdf

deploy new vpc and workload

https://fwd.aws/6dEQ7


inspect
--

### list
```console
$ aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE \
--query "StackSummaries[?contains(StackName,\`Amazon-EKS\`)].StackName" | \
jq .
[
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9",
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z",
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE-EKSControlPlane-2ZZEBOGHB5X7W",
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE-FunctionStack-1CYLDUEP43ABS",
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z",
  "Amazon-EKS-EKSStack-1U9I2DE9P7PAE",
  "Amazon-EKS-VPCStack-19TTUKX3BANWI",
  "Amazon-EKS"
]
```

### stack resources

`Amazon-EKS`
```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::CloudFormation::Stack","EKSStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE/3c38eac0-4082-11e9-b718-0aa1af63e98c"
"AWS::CloudFormation::Stack","VPCStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-VPCStack-19TTUKX3BANWI/a714fc40-4081-11e9-8247-0af7a73fd784"```
```


| type | LogicalResourceId | PhysicalResourceId |
|----------------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| AWS::CloudFormation::Stack | EKSStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE/3c38eac0-4082-11e9-b718-0aa1af63e98c |
| AWS::CloudFormation::Stack | VPCStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-VPCStack-19TTUKX3BANWI/a714fc40-4081-11e9-8247-0af7a73fd784 |



`Amazon-EKS-VPCStack-19TTUKX3BANWI`

```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-VPCStack-19TTUKX3BANWI --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::EC2::DHCPOptions","DHCPOptions","dopt-03054c985d4f44973"
"AWS::EC2::InternetGateway","InternetGateway","igw-0eb7079860bd21d52"
"AWS::EC2::EIP","NAT1EIP","3.93.204.101"
"AWS::EC2::EIP","NAT2EIP","35.153.32.44"
"AWS::EC2::EIP","NAT3EIP","34.236.210.128"
"AWS::EC2::NatGateway","NATGateway1","nat-03787e4780ff6bca7"
"AWS::EC2::NatGateway","NATGateway2","nat-0dea540f648250c5c"
"AWS::EC2::NatGateway","NATGateway3","nat-072da459994b5b337"
"AWS::EC2::Subnet","PrivateSubnet1A","subnet-082e42f5784fa1ce2"
"AWS::EC2::Route","PrivateSubnet1ARoute","Amazo-Priva-1BMLOJPMC6XL9"
"AWS::EC2::RouteTable","PrivateSubnet1ARouteTable","rtb-0ff4bd38995624f70"
"AWS::EC2::SubnetRouteTableAssociation","PrivateSubnet1ARouteTableAssociation","rtbassoc-077f0c836fbb3a6ea"
"AWS::EC2::Subnet","PrivateSubnet2A","subnet-0bcb127bc264d9369"
"AWS::EC2::Route","PrivateSubnet2ARoute","Amazo-Priva-HS2PG3ES5PJJ"
"AWS::EC2::RouteTable","PrivateSubnet2ARouteTable","rtb-0e5d5a8d1a20feffa"
"AWS::EC2::SubnetRouteTableAssociation","PrivateSubnet2ARouteTableAssociation","rtbassoc-07d3f37975434ad01"
"AWS::EC2::Subnet","PrivateSubnet3A","subnet-01bedd8ef71f211df"
"AWS::EC2::Route","PrivateSubnet3ARoute","Amazo-Priva-37F64T7FTVLU"
"AWS::EC2::RouteTable","PrivateSubnet3ARouteTable","rtb-07314262544ed0f61"
"AWS::EC2::SubnetRouteTableAssociation","PrivateSubnet3ARouteTableAssociation","rtbassoc-0903dc9b3f7e45753"
"AWS::EC2::Subnet","PublicSubnet1","subnet-0e83fc7644eadbc5d"
"AWS::EC2::SubnetRouteTableAssociation","PublicSubnet1RouteTableAssociation","rtbassoc-05fa03ec4bf315c24"
"AWS::EC2::Subnet","PublicSubnet2","subnet-0fbf99e997fdd9f05"
"AWS::EC2::SubnetRouteTableAssociation","PublicSubnet2RouteTableAssociation","rtbassoc-0519315cfc2bfea52"
"AWS::EC2::Subnet","PublicSubnet3","subnet-0ab1be0cf9e9dbd2b"
"AWS::EC2::SubnetRouteTableAssociation","PublicSubnet3RouteTableAssociation","rtbassoc-02f00b038a288ba4a"
"AWS::EC2::Route","PublicSubnetRoute","Amazo-Publi-5WQ1OD5PW3XF"
"AWS::EC2::RouteTable","PublicSubnetRouteTable","rtb-04d5d4501bec89903"
"AWS::EC2::VPCEndpoint","S3VPCEndpoint","vpce-0f796087cbd9c9352"
"AWS::EC2::VPC","VPC","vpc-069a4239e50588a0d"
"AWS::EC2::VPCDHCPOptionsAssociation","VPCDHCPOptionsAssociation","Amazo-VPCDH-VZ010BUV7GA1"
"AWS::EC2::VPCGatewayAttachment","VPCGatewayAttachment","Amazo-VPCGa-3QWPWDEU2V27"
```
| type | LogicalResourceId | PhysicalResourceId |
|---------------------------------------|--------------------------------------|----------------------------|
| AWS::EC2::DHCPOptions | DHCPOptions | dopt-03054c985d4f44973 |
| AWS::EC2::InternetGateway | InternetGateway | igw-0eb7079860bd21d52 |
| AWS::EC2::EIP | NAT1EIP | 3.93.204.101 |
| AWS::EC2::EIP | NAT2EIP | 35.153.32.44 |
| AWS::EC2::EIP | NAT3EIP | 34.236.210.128 |
| AWS::EC2::NatGateway | NATGateway1 | nat-03787e4780ff6bca7 |
| AWS::EC2::NatGateway | NATGateway2 | nat-0dea540f648250c5c |
| AWS::EC2::NatGateway | NATGateway3 | nat-072da459994b5b337 |
| AWS::EC2::Subnet | PrivateSubnet1A | subnet-082e42f5784fa1ce2 |
| AWS::EC2::Route | PrivateSubnet1ARoute | Amazo-Priva-1BMLOJPMC6XL9 |
| AWS::EC2::RouteTable | PrivateSubnet1ARouteTable | rtb-0ff4bd38995624f70 |
| AWS::EC2::SubnetRouteTableAssociation | PrivateSubnet1ARouteTableAssociation | rtbassoc-077f0c836fbb3a6ea |
| AWS::EC2::Subnet | PrivateSubnet2A | subnet-0bcb127bc264d9369 |
| AWS::EC2::Route | PrivateSubnet2ARoute | Amazo-Priva-HS2PG3ES5PJJ |
| AWS::EC2::RouteTable | PrivateSubnet2ARouteTable | rtb-0e5d5a8d1a20feffa |
| AWS::EC2::SubnetRouteTableAssociation | PrivateSubnet2ARouteTableAssociation | rtbassoc-07d3f37975434ad01 |
| AWS::EC2::Subnet | PrivateSubnet3A | subnet-01bedd8ef71f211df |
| AWS::EC2::Route | PrivateSubnet3ARoute | Amazo-Priva-37F64T7FTVLU |
| AWS::EC2::RouteTable | PrivateSubnet3ARouteTable | rtb-07314262544ed0f61 |
| AWS::EC2::SubnetRouteTableAssociation | PrivateSubnet3ARouteTableAssociation | rtbassoc-0903dc9b3f7e45753 |
| AWS::EC2::Subnet | PublicSubnet1 | subnet-0e83fc7644eadbc5d |
| AWS::EC2::SubnetRouteTableAssociation | PublicSubnet1RouteTableAssociation | rtbassoc-05fa03ec4bf315c24 |
| AWS::EC2::Subnet | PublicSubnet2 | subnet-0fbf99e997fdd9f05 |
| AWS::EC2::SubnetRouteTableAssociation | PublicSubnet2RouteTableAssociation | rtbassoc-0519315cfc2bfea52 |
| AWS::EC2::Subnet | PublicSubnet3 | subnet-0ab1be0cf9e9dbd2b |
| AWS::EC2::SubnetRouteTableAssociation | PublicSubnet3RouteTableAssociation | rtbassoc-02f00b038a288ba4a |
| AWS::EC2::Route | PublicSubnetRoute | Amazo-Publi-5WQ1OD5PW3XF |
| AWS::EC2::RouteTable | PublicSubnetRouteTable | rtb-04d5d4501bec89903 |
| AWS::EC2::VPCEndpoint | S3VPCEndpoint | vpce-0f796087cbd9c9352 |
| AWS::EC2::VPC | VPC | vpc-069a4239e50588a0d |
| AWS::EC2::VPCDHCPOptionsAssociation | VPCDHCPOptionsAssociation | Amazo-VPCDH-VZ010BUV7GA1 |
| AWS::EC2::VPCGatewayAttachment | VPCGatewayAttachment | Amazo-VPCGa-3QWPWDEU2V27 |



`Amazon-EKS-EKSStack-1U9I2DE9P7PAE`
```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::CloudFormation::Stack","BastionStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z/e620a2b0-4084-11e9-88e6-0ecfb0c7c934"
"AWS::EC2::SecurityGroup","ControlPlaneSecurityGroup","sg-045408928a20a97a0"
"Custom::DeleteBucketContents","DeleteBucketContents","2019/03/07/[$LATEST]aea9e87729c04597b97b07689e288d78"
"Custom::CfnStackAssumeRole","EKSControlPlane","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-EKSControlPlane-2ZZEBOGHB5X7W/dce17500-4082-11e9-a295-0e639cbb91d4"
"AWS::CloudFormation::Stack","FunctionStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-FunctionStack-1CYLDUEP43ABS/b3371b10-4082-11e9-b63e-0a583df6bf38"
"AWS::CloudFormation::Stack","IamStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z/508c7820-4082-11e9-88e6-0ecfb0c7c934"
"AWS::KMS::Key","KmsKey","45bd9949-15c2-476c-b790-d14ed7812574"
"AWS::S3::Bucket","KubeConfigBucket","amazon-eks-eksstack-1u9i2de9p7pa-kubeconfigbucket-x9yoy5cntfgc"
"AWS::S3::Bucket","LambdaZipsBucket","amazon-eks-eksstack-1u9i2de9p7pa-lambdazipsbucket-77tpgq4ryyx8"
"AWS::CloudFormation::Stack","NodeGroupStack","arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9/e6225060-4084-11e9-a351-12926a34023c"
```

| type | LogicalResourceId | PhysicalResourceId |
|------------------------------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| AWS::CloudFormation::Stack | BastionStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z/e620a2b0-4084-11e9-88e6-0ecfb0c7c934 |
| AWS::EC2::SecurityGroup | ControlPlaneSecurityGroup | sg-045408928a20a97a0 |
| Custom::DeleteBucketContents | DeleteBucketContents | 2019/03/07/[$LATEST]aea9e87729c04597b97b07689e288d78 |
| Custom::CfnStackAssumeRole | EKSControlPlane | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-EKSControlPlane-2ZZEBOGHB5X7W/dce17500-4082-11e9-a295-0e639cbb91d4 |
| AWS::CloudFormation::Stack | FunctionStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-FunctionStack-1CYLDUEP43ABS/b3371b10-4082-11e9-b63e-0a583df6bf38 |
| AWS::CloudFormation::Stack | IamStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z/508c7820-4082-11e9-88e6-0ecfb0c7c934 |
| AWS::KMS::Key | KmsKey | 45bd9949-15c2-476c-b790-d14ed7812574 |
| AWS::S3::Bucket | KubeConfigBucket | amazon-eks-eksstack-1u9i2de9p7pa-kubeconfigbucket-x9yoy5cntfgc |
| AWS::S3::Bucket | LambdaZipsBucket | amazon-eks-eksstack-1u9i2de9p7pa-lambdazipsbucket-77tpgq4ryyx8 |
| AWS::CloudFormation::Stack | NodeGroupStack | arn:aws:cloudformation:us-east-1:000000000000:stack/Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9/e6225060-4084-11e9-a351-12926a34023c |


`Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z`

```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::IAM::Role","BastionRole","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamS-BastionRole-P5QGSALQVOC"
"AWS::IAM::Role","CleanupLoadBalancersRole","Amazon-EKS-EKSStack-1U9I2-CleanupLoadBalancersRole-1QT75X8TOUXI"
"AWS::IAM::Policy","ControlPlanePassRole","Amazo-Cont-RMA6FD3ELN7G"
"AWS::IAM::Role","ControlPlaneProvisionRole","Amazon-EKS-EKSStack-1U9I2-ControlPlaneProvisionRol-C44IN93IHTU5"
"AWS::IAM::Role","ControlPlaneRole","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-ControlPlaneRole-107UA40Y9WHX2"
"AWS::IAM::Role","CopyZipsRole","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Iam-CopyZipsRole-CTN3QK3Z9ZC"
"AWS::IAM::Role","DeleteBucketContentsRole","Amazon-EKS-EKSStack-1U9I2-DeleteBucketContentsRole-55JMRR7UEBL6"
"AWS::IAM::Role","KubeConfigUploadRole","Amazon-EKS-EKSStack-1U9I2DE9P-KubeConfigUploadRole-1KWZ9BSJ6S4BZ"
"AWS::IAM::Role","LambdaCleanUpFunctionRole","Amazon-EKS-EKSStack-1U9I2-LambdaCleanUpFunctionRol-1RJTWPPNTGP6P"
"AWS::IAM::InstanceProfile","NodeInstanceProfile","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z-NodeInstanceProfile-1TQX359QGWM8R"
"AWS::IAM::Role","NodeInstanceRole","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeInstanceRole-1WK9H3BST9J9Y"
"AWS::IAM::Role","QuickStartStackMakerRole","Amazon-EKS-EKSStack-1U9I2-QuickStartStackMakerRole-LZJ8S61AEEOJ"
```
| type | LogicalResourceId | PhysicalResourceId |
|---------------------------|---------------------------|--------------------------------------------------------------------------------------------|
| AWS::IAM::Role | BastionRole | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamS-BastionRole-P5QGSALQVOC |
| AWS::IAM::Role | CleanupLoadBalancersRole | Amazon-EKS-EKSStack-1U9I2-CleanupLoadBalancersRole-1QT75X8TOUXI |
| AWS::IAM::Policy | ControlPlanePassRole | Amazo-Cont-RMA6FD3ELN7G |
| AWS::IAM::Role | ControlPlaneProvisionRole | Amazon-EKS-EKSStack-1U9I2-ControlPlaneProvisionRol-C44IN93IHTU5 |
| AWS::IAM::Role | ControlPlaneRole | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-ControlPlaneRole-107UA40Y9WHX2 |
| AWS::IAM::Role | CopyZipsRole | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Iam-CopyZipsRole-CTN3QK3Z9ZC |
| AWS::IAM::Role | DeleteBucketContentsRole | Amazon-EKS-EKSStack-1U9I2-DeleteBucketContentsRole-55JMRR7UEBL6 |
| AWS::IAM::Role | KubeConfigUploadRole | Amazon-EKS-EKSStack-1U9I2DE9P-KubeConfigUploadRole-1KWZ9BSJ6S4BZ |
| AWS::IAM::Role | LambdaCleanUpFunctionRole | Amazon-EKS-EKSStack-1U9I2-LambdaCleanUpFunctionRol-1RJTWPPNTGP6P |
| AWS::IAM::InstanceProfile | NodeInstanceProfile | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-IamStack-1W9E0EIXHYJ3Z-NodeInstanceProfile-1TQX359QGWM8R |
| AWS::IAM::Role | NodeInstanceRole | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeInstanceRole-1WK9H3BST9J9Y |
| AWS::IAM::Role | QuickStartStackMakerRole | Amazon-EKS-EKSStack-1U9I2-QuickStartStackMakerRole-LZJ8S61AEEOJ |

`Amazon-EKS-EKSStack-1U9I2DE9P7PAE-EKSControlPlane-2ZZEBOGHB5X7W`

```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE-EKSControlPlane-2ZZEBOGHB5X7W --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"Custom::CleanupLoadBalancers","CleanupLoadBalancers","2019/03/07/[$LATEST]ac1a6e0e16724202ac39df4bcecc1836"
"AWS::EKS::Cluster","EKS","EKS-pRgA2E3cq9ae"
"Custom::KubeManifest","EksNodeUser","2019/03/07/[$LATEST]07821318a934489d96c801d5f744f6cb"
"Custom::ConfigToS3","KubeConfigToS3","2019/03/07/[$LATEST]9eca2606a0c74f8d80acd7e5d21931d8"
```

| type | LogicalResourceId | PhysicalResourceId |
|------------------------------|----------------------|------------------------------------------------------|
| Custom::CleanupLoadBalancers | CleanupLoadBalancers | 2019/03/07/[$LATEST]ac1a6e0e16724202ac39df4bcecc1836 |
| AWS::EKS::Cluster | EKS | EKS-pRgA2E3cq9ae |
| Custom::KubeManifest | EksNodeUser | 2019/03/07/[$LATEST]07821318a934489d96c801d5f744f6cb |
| Custom::ConfigToS3 | KubeConfigToS3 | 2019/03/07/[$LATEST]9eca2606a0c74f8d80acd7e5d21931d8 |


`Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9`
```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9 --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::EC2::SecurityGroupIngress","ClusterControlPlaneSecurityGroupIngress","ClusterControlPlaneSecurityGroupIngress"
"AWS::EC2::SecurityGroupEgress","ControlPlaneEgressToNodeSecurityGroup","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-ControlPlaneEgressToNodeSecurityGroup-1CY0505L88579"
"AWS::EC2::SecurityGroupEgress","ControlPlaneEgressToNodeSecurityGroupOn443","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-ControlPlaneEgressToNodeSecurityGroupOn443-XYTQQWPCBWWI"
"AWS::AutoScaling::AutoScalingGroup","NodeGroup","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-NodeGroup-WDG9MUEJHAQF"
"AWS::AutoScaling::LaunchConfiguration","NodeLaunchConfig","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-NodeLaunchConfig-VTE8GC60KXZH"
"AWS::EC2::SecurityGroup","NodeSecurityGroup","sg-04d4958b31ae55ca6"
"AWS::EC2::SecurityGroupIngress","NodeSecurityGroupFromControlPlaneIngress","NodeSecurityGroupFromControlPlaneIngress"
"AWS::EC2::SecurityGroupIngress","NodeSecurityGroupFromControlPlaneOn443Ingress","NodeSecurityGroupFromControlPlaneOn443Ingress"
"AWS::EC2::SecurityGroupIngress","NodeSecurityGroupIngress","NodeSecurityGroupIngress"
```

| type | LogicalResourceId | PhysicalResourceId |
|---------------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| AWS::EC2::SecurityGroupIngress | ClusterControlPlaneSecurityGroupIngress | ClusterControlPlaneSecurityGroupIngress |
| AWS::EC2::SecurityGroupEgress | ControlPlaneEgressToNodeSecurityGroup | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-ControlPlaneEgressToNodeSecurityGroup-1CY0505L88579 |
| AWS::EC2::SecurityGroupEgress | ControlPlaneEgressToNodeSecurityGroupOn443 | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-ControlPlaneEgressToNodeSecurityGroupOn443-XYTQQWPCBWWI |
| AWS::AutoScaling::AutoScalingGroup | NodeGroup | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-NodeGroup-WDG9MUEJHAQF |
| AWS::AutoScaling::LaunchConfiguration | NodeLaunchConfig | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-NodeGroupStack-1CBPCE7DTOUZ9-NodeLaunchConfig-VTE8GC60KXZH |
| AWS::EC2::SecurityGroup | NodeSecurityGroup | sg-04d4958b31ae55ca6 |
| AWS::EC2::SecurityGroupIngress | NodeSecurityGroupFromControlPlaneIngress | NodeSecurityGroupFromControlPlaneIngress |
| AWS::EC2::SecurityGroupIngress | NodeSecurityGroupFromControlPlaneOn443Ingress | NodeSecurityGroupFromControlPlaneOn443Ingress |
| AWS::EC2::SecurityGroupIngress | NodeSecurityGroupIngress | NodeSecurityGroupIngress |


`Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z`

```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::AutoScaling::AutoScalingGroup","BastionAutoScalingGroup","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionAutoScalingGroup-XD587NMF0T6P"
"AWS::IAM::Policy","BastionHostPolicy","Amazo-Bast-KB22Z8VOAE9Y"
"AWS::IAM::InstanceProfile","BastionHostProfile","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionHostProfile-9DI94ZS6ZDGV"
"AWS::AutoScaling::LaunchConfiguration","BastionLaunchConfiguration","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionLaunchConfiguration-4VJ4QLA9MYJ3"
"AWS::Logs::LogGroup","BastionMainLogGroup","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionMainLogGroup-1NS8EZ4VS4RUB"
"AWS::EC2::SecurityGroup","BastionSecurityGroup","sg-0fa1f5209b3486e9f"
"AWS::EC2::EIP","EIP1","52.205.120.71"
"AWS::Logs::MetricFilter","SSHMetricFilter","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-SSHMetricFilter-1BOB6QW306XZM"
```

| type | LogicalResourceId | PhysicalResourceId |
|---------------------------------------|----------------------------|------------------------------------------------------------------------------------------------------|
| AWS::AutoScaling::AutoScalingGroup | BastionAutoScalingGroup | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionAutoScalingGroup-XD587NMF0T6P |
| AWS::IAM::Policy | BastionHostPolicy | Amazo-Bast-KB22Z8VOAE9Y |
| AWS::IAM::InstanceProfile | BastionHostProfile | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionHostProfile-9DI94ZS6ZDGV |
| AWS::AutoScaling::LaunchConfiguration | BastionLaunchConfiguration | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionLaunchConfiguration-4VJ4QLA9MYJ3 |
| AWS::Logs::LogGroup | BastionMainLogGroup | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-BastionMainLogGroup-1NS8EZ4VS4RUB |
| AWS::EC2::SecurityGroup | BastionSecurityGroup | sg-0fa1f5209b3486e9f |
| AWS::EC2::EIP | EIP1 | 52.205.120.71 |
| AWS::Logs::MetricFilter | SSHMetricFilter | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-BastionStack-1CWZ8802RHT4Z-SSHMetricFilter-1BOB6QW306XZM |

`Amazon-EKS-EKSStack-1U9I2DE9P7PAE-FunctionStack-1CYLDUEP43ABS`
```console
$ aws cloudformation describe-stack-resources --stack-name Amazon-EKS-EKSStack-1U9I2DE9P7PAE-FunctionStack-1CYLDUEP43ABS --query 'StackResources[].[ResourceType,LogicalResourceId,PhysicalResourceId]' | sed -e 's/[0-9]\{12\}/000000000000/g' | jq -rc '.[]|@csv' | sed -e '1s/^/"type","LogicalResourceId","PhysicalResourceId"\n/'
"type","LogicalResourceId","PhysicalResourceId"
"AWS::Lambda::Function","CleanupLoadBalancersLambda","Amazon-EKS-EKSStack-1U9I2-CleanupLoadBalancersLamb-1RWUIRLTJEFGW"
"AWS::EC2::SecurityGroupIngress","ClusterControlPlaneSecurityGroupIngress","ClusterControlPlaneSecurityGroupIngress"
"Custom::CopyZips","CopyZips","2019/03/07/[$LATEST]29b202a28de644208a200a1d62053997"
"AWS::Lambda::Function","CopyZipsFunction","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-CopyZipsFunction-PJGJO3FE568E"
"AWS::Lambda::Function","DeleteBucketContentsLambda","Amazon-EKS-EKSStack-1U9I2-DeleteBucketContentsLamb-1GJCKCJVY80DU"
"AWS::EC2::SecurityGroup","EKSLambdaSecurityGroup","sg-01dad8be5b2f063d1"
"AWS::Lambda::Function","HelmLambda","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Funct-HelmLambda-15LLXWORVGKYW"
"AWS::Lambda::Function","KubeConfigUploadLambda","Amazon-EKS-EKSStack-1U9I2DE-KubeConfigUploadLambda-1BH0ZQYOKR26C"
"AWS::Lambda::Function","KubeGetLambda","Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Fu-KubeGetLambda-MN37N2YZLWC4"
"AWS::Lambda::Function","KubeManifestLambda","Amazon-EKS-EKSStack-1U9I2DE9P7P-KubeManifestLambda-1O09W84M1CFKY"
"AWS::Lambda::Function","QuickStartStackMakerLambda","Amazon-EKS-EKSStack-1U9I2-QuickStartStackMakerLamb-1MG1OWRMK5HCZ"
"Custom::LambdaCleanup","VPCLambdaCleanup","2019/03/07/[$LATEST]0798543a5331461dafc98b9f0aadf2af"
"AWS::Lambda::Function","VPCLambdaCleanupLambdaFunction","Amazon-EKS-EKSStack-1U9I2-VPCLambdaCleanupLambdaFu-VVXF8OALY1J9"
```

| type | LogicalResourceId | PhysicalResourceId |
|--------------------------------|-----------------------------------------|------------------------------------------------------------------|
| AWS::Lambda::Function | CleanupLoadBalancersLambda | Amazon-EKS-EKSStack-1U9I2-CleanupLoadBalancersLamb-1RWUIRLTJEFGW |
| AWS::EC2::SecurityGroupIngress | ClusterControlPlaneSecurityGroupIngress | ClusterControlPlaneSecurityGroupIngress |
| Custom::CopyZips | CopyZips | 2019/03/07/[$LATEST]29b202a28de644208a200a1d62053997 |
| AWS::Lambda::Function | CopyZipsFunction | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-CopyZipsFunction-PJGJO3FE568E |
| AWS::Lambda::Function | DeleteBucketContentsLambda | Amazon-EKS-EKSStack-1U9I2-DeleteBucketContentsLamb-1GJCKCJVY80DU |
| AWS::EC2::SecurityGroup | EKSLambdaSecurityGroup | sg-01dad8be5b2f063d1 |
| AWS::Lambda::Function | HelmLambda | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Funct-HelmLambda-15LLXWORVGKYW |
| AWS::Lambda::Function | KubeConfigUploadLambda | Amazon-EKS-EKSStack-1U9I2DE-KubeConfigUploadLambda-1BH0ZQYOKR26C |
| AWS::Lambda::Function | KubeGetLambda | Amazon-EKS-EKSStack-1U9I2DE9P7PAE-Fu-KubeGetLambda-MN37N2YZLWC4 |
| AWS::Lambda::Function | KubeManifestLambda | Amazon-EKS-EKSStack-1U9I2DE9P7P-KubeManifestLambda-1O09W84M1CFKY |
| AWS::Lambda::Function | QuickStartStackMakerLambda | Amazon-EKS-EKSStack-1U9I2-QuickStartStackMakerLamb-1MG1OWRMK5HCZ |
| Custom::LambdaCleanup | VPCLambdaCleanup | 2019/03/07/[$LATEST]0798543a5331461dafc98b9f0aadf2af |
| AWS::Lambda::Function | VPCLambdaCleanupLambdaFunction | Amazon-EKS-EKSStack-1U9I2-VPCLambdaCleanupLambdaFu-VVXF8OALY1J9 |


