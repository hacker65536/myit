# eksctl

https://github.com/weaveworks/eksctl


```console
$ curl -SsL "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
$ sudo mv /tmp/eksctl /usr/local/bin
```

create cluster
--

require
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
- [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

```console
$ eksctl create cluster
[ℹ]  using region us-east-2
[ℹ]  setting availability zones to [us-east-2c us-east-2a us-east-2b]
[ℹ]  subnets for us-east-2c - public:192.168.0.0/19 private:192.168.96.0/19
[ℹ]  subnets for us-east-2a - public:192.168.32.0/19 private:192.168.128.0/19
[ℹ]  subnets for us-east-2b - public:192.168.64.0/19 private:192.168.160.0/19
[ℹ]  nodegroup "ng-54e2d243" will use "ami-0484545fe7d3da96f" [AmazonLinux2/1.11]
[ℹ]  creating EKS cluster "extravagant-rainbow-1551249113" in "us-east-2" region
[ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial nodegroup
[ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --name=extravagant-rainbow-1551249113'
[ℹ]  creating cluster stack "eksctl-extravagant-rainbow-1551249113-cluster"
[ℹ]  creating nodegroup stack "eksctl-extravagant-rainbow-1551249113-nodegroup-ng-54e2d243"
[ℹ]  --nodes-min=2 was set automatically for nodegroup ng-54e2d243
[ℹ]  --nodes-max=2 was set automatically for nodegroup ng-54e2d243
[✔]  all EKS cluster resource for "extravagant-rainbow-1551249113" had been created
[✔]  saved kubeconfig as "/home/ec2-user/.kube/config"
[ℹ]  nodegroup "ng-54e2d243" has 0 node(s)
[ℹ]  waiting for at least 2 node(s) to become ready in "ng-54e2d243"
[ℹ]  nodegroup "ng-54e2d243" has 2 node(s)
[ℹ]  node "ip-192-168-12-185.us-east-2.compute.internal" is ready
[ℹ]  node "ip-192-168-34-127.us-east-2.compute.internal" is ready
[ℹ]  kubectl command should work with "/home/ec2-user/.kube/config", try 'kubectl get nodes'
[✔]  EKS cluster "extravagant-rainbow-1551249113" in "us-east-2" region is ready
```
