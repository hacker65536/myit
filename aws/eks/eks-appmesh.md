# eks with appmesh

https://github.com/aws/aws-app-mesh-examples

https://github.com/aws/aws-app-mesh-examples/blob/master/walkthroughs/eks/base.md


create k8s cluster with eksctl
--


```console
eksctl create cluster --zones=us-east-1a,us-east-1b,us-east-1d --version=1.13 --full-ecr-access --appmesh-access
[ℹ]  using region us-east-1
[ℹ]  subnets for us-east-1a - public:192.168.0.0/19 private:192.168.96.0/19
[ℹ]  subnets for us-east-1b - public:192.168.32.0/19 private:192.168.128.0/19
[ℹ]  subnets for us-east-1d - public:192.168.64.0/19 private:192.168.160.0/19
[ℹ]  nodegroup "ng-a38c5dbe" will use "ami-08c4955bcc43b124e" [AmazonLinux2/1.13]
[ℹ]  creating EKS cluster "adorable-rainbow-1562313185" in "us-east-1" region
[ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial nodegroup
[ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --name=adorable-rainbow-1562313185'
[ℹ]  2 sequential tasks: { create cluster control plane "adorable-rainbow-1562313185", create nodegroup "ng-a38c5dbe" }
[ℹ]  building cluster stack "eksctl-adorable-rainbow-1562313185-cluster"
[ℹ]  deploying stack "eksctl-adorable-rainbow-1562313185-cluster"
[ℹ]  building nodegroup stack "eksctl-adorable-rainbow-1562313185-nodegroup-ng-a38c5dbe"
[ℹ]  --nodes-min=2 was set automatically for nodegroup ng-a38c5dbe
[ℹ]  --nodes-max=2 was set automatically for nodegroup ng-a38c5dbe
[ℹ]  deploying stack "eksctl-adorable-rainbow-1562313185-nodegroup-ng-a38c5dbe"
[✔]  all EKS cluster resource for "adorable-rainbow-1562313185" had been created
[✔]  saved kubeconfig as "/home/ec2-user/.kube/config"
[ℹ]  adding role "arn:aws:iam::000000000000:role/eksctl-adorable-rainbow-156231318-NodeInstanceRole-1EEY45N6MRW8L" to auth ConfigMap
[ℹ]  nodegroup "ng-a38c5dbe" has 0 node(s)
[ℹ]  waiting for at least 2 node(s) to become ready in "ng-a38c5dbe"
[ℹ]  nodegroup "ng-a38c5dbe" has 2 node(s)
[ℹ]  node "ip-192-168-51-179.ec2.internal" is ready
[ℹ]  node "ip-192-168-76-83.ec2.internal" is ready
[✖]  neither aws-iam-authenticator nor heptio-authenticator-aws are installed
[ℹ]  cluster should be functional despite missing (or misconfigured) client binaries
[✔]  EKS cluster "adorable-rainbow-1562313185" in "us-east-1" region is ready
```
