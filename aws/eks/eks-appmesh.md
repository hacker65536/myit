# eks with appmesh

https://github.com/aws/aws-app-mesh-examples

https://github.com/aws/aws-app-mesh-examples/blob/master/walkthroughs/eks/base.md


create k8s cluster with eksctl
--

<details>
  <summary> eksctl create cluster without file</summary>
  
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
</details>

from file

```console
[ℹ]  using region us-east-1
[ℹ]  subnets for us-east-1a - public:192.168.0.0/19 private:192.168.96.0/19
[ℹ]  subnets for us-east-1b - public:192.168.32.0/19 private:192.168.128.0/19
[ℹ]  subnets for us-east-1d - public:192.168.64.0/19 private:192.168.160.0/19
[ℹ]  nodegroup "ng-1" will use "ami-08c4955bcc43b124e" [AmazonLinux2/1.13]
[ℹ]  creating EKS cluster "adrable-rainbow" in "us-east-1" region
[ℹ]  1 nodegroup (ng-1) was included
[ℹ]  will create a CloudFormation stack for cluster itself and 1 nodegroup stack(s)
[ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --name=adrable-rainbow'
[ℹ]  2 sequential tasks: { create cluster control plane "adrable-rainbow", create nodegroup "ng-1" }
[ℹ]  building cluster stack "eksctl-adrable-rainbow-cluster"
[ℹ]  deploying stack "eksctl-adrable-rainbow-cluster"
[ℹ]  building nodegroup stack "eksctl-adrable-rainbow-nodegroup-ng-1"
[ℹ]  --nodes-min=2 was set automatically for nodegroup ng-1
[ℹ]  --nodes-max=2 was set automatically for nodegroup ng-1
[ℹ]  deploying stack "eksctl-adrable-rainbow-nodegroup-ng-1"
[✔]  all EKS cluster resource for "adrable-rainbow" had been created
[✔]  saved kubeconfig as "/home/ec2-user/.kube/config"
[ℹ]  adding role "arn:aws:iam::000000000000:role/eksctl-adrable-rainbow-nodegroup-NodeInstanceRole-4HBI4I0ARWW0" to auth ConfigMap
[ℹ]  nodegroup "ng-1" has 0 node(s)
[ℹ]  waiting for at least 2 node(s) to become ready in "ng-1"
[ℹ]  nodegroup "ng-1" has 2 node(s)
[ℹ]  node "ip-192-168-44-31.ec2.internal" is ready
[ℹ]  node "ip-192-168-79-223.ec2.internal" is ready
[✖]  neither aws-iam-authenticator nor heptio-authenticator-aws are installed
[ℹ]  cluster should be functional despite missing (or misconfigured) client binaries
[✔]  EKS cluster "adrable-rainbow" in "us-east-1" region is ready
```


```bash
export MESH_NAME=color-mesh
export INJECT_XRAY_SIDECAR=true
export ENABLE_STATS_TAGS=true
export MESH_REGION=us-east-1
curl https://raw.githubusercontent.com/aws/aws-app-mesh-inject/v0.1.3/hack/install.sh | bash
```

```
namespace/appmesh-inject created
creating certs in tmpdir /tmp/tmp.jQr4Kj5Alo
Generating RSA private key, 2048 bit long modulus
...................+++
..............+++
e is 65537 (0x10001)
certificatesigningrequest.certificates.k8s.io/aws-app-mesh-inject.appmesh-inject created
NAME                                 AGE   REQUESTOR          CONDITION
aws-app-mesh-inject.appmesh-inject   1s    kubernetes-admin   Pending
certificatesigningrequest.certificates.k8s.io/aws-app-mesh-inject.appmesh-inject approved
secret/aws-app-mesh-inject created
processing templates
Created injector manifest at:/tmp/tmp.SNdwWFoAgM/_output/inject.yaml
serviceaccount/aws-app-mesh-inject-sa created
clusterrole.rbac.authorization.k8s.io/aws-app-mesh-inject-cr created
clusterrolebinding.rbac.authorization.k8s.io/aws-app-mesh-inject-binding created
service/aws-app-mesh-inject created
deployment.apps/aws-app-mesh-inject created
mutatingwebhookconfiguration.admissionregistration.k8s.io/aws-app-mesh-inject created
waiting for aws-app-mesh-inject to start
Waiting for deployment "aws-app-mesh-inject" rollout to finish: 0 of 1 updated replicas are available...
deployment "aws-app-mesh-inject" successfully rolled out
Mesh name has been set up
The injector is ready
```


```console
$ kubectl -n appmesh-inject get po
NAME                                   READY   STATUS    RESTARTS   AGE
aws-app-mesh-inject-69bc8b6499-rrh2z   1/1     Running   0          4m9s
```

```console
$ curl https://raw.githubusercontent.com/aws/aws-app-mesh-controller-for-k8s/v0.1.0/deploy/v0.1.0/all.yaml | kubectl apply -f -
customresourcedefinition.apiextensions.k8s.io/meshes.appmesh.k8s.aws created
customresourcedefinition.apiextensions.k8s.io/virtualnodes.appmesh.k8s.aws created
customresourcedefinition.apiextensions.k8s.io/virtualservices.appmesh.k8s.aws created
namespace/appmesh-system created
deployment.apps/app-mesh-controller created
serviceaccount/app-mesh-sa created
clusterrole.rbac.authorization.k8s.io/app-mesh-controller created
clusterrolebinding.rbac.authorization.k8s.io/app-mesh-controller-binding created
```
```console
$ kubectl wait $(kubectl get pods -n appmesh-system -o name) --for=condition=Ready --timeout=30s -n appmesh-system
pod/app-mesh-controller-6b89ccfb8c-l6dsx condition met
```

```console
$ kubectl api-resources --api-group=appmesh.k8s.aws
NAME              SHORTNAMES   APIGROUP          NAMESPACED   KIND
meshes                         appmesh.k8s.aws   false        Mesh
virtualnodes                   appmesh.k8s.aws   true         VirtualNode
virtualservices                appmesh.k8s.aws   true         VirtualService
```

```console
$ git clone https://github.com/aws/aws-app-mesh-controller-for-k8s.git
$ cd aws-app-mesh-controller-for-k8s
```
```console
$ make example
./scripts/example.sh
namespace/appmesh-demo created
mesh.appmesh.k8s.aws/color-mesh created
virtualnode.appmesh.k8s.aws/colorgateway created
virtualnode.appmesh.k8s.aws/colorteller created
virtualnode.appmesh.k8s.aws/colorteller-black created
virtualnode.appmesh.k8s.aws/colorteller-blue created
virtualnode.appmesh.k8s.aws/colorteller-red created
virtualservice.appmesh.k8s.aws/colorteller.appmesh-demo created
virtualservice.appmesh.k8s.aws/colorgateway.appmesh-demo created
service/colorgateway created
deployment.apps/colorgateway created
service/colorteller created
deployment.apps/colorteller created
service/colorteller-black created
deployment.apps/colorteller-black created
service/colorteller-blue created
deployment.apps/colorteller-blue created
service/colorteller-red created
deployment.apps/colorteller-red created
virtualnode.appmesh.k8s.aws/tcpecho created
virtualservice.appmesh.k8s.aws/tcpecho.appmesh-demo created
service/tcpecho created
deployment.apps/tcpecho created
```


```
$ kubectl -n appmesh-demo get deploy,po,svc,virtualnode.appmesh.k8s.aws,virtualservice.appmesh.k8s.aws
NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.extensions/colorgateway        1/1     1            1           28s
deployment.extensions/colorteller         1/1     1            1           28s
deployment.extensions/colorteller-black   1/1     1            1           28s
deployment.extensions/colorteller-blue    1/1     1            1           28s
deployment.extensions/colorteller-red     1/1     1            1           28s
deployment.extensions/tcpecho             1/1     1            1           27s

NAME                                     READY   STATUS    RESTARTS   AGE
pod/colorgateway-678c7b88b4-jg7wn        1/1     Running   0          28s
pod/colorteller-759fc757cc-hbg7j         1/1     Running   0          28s
pod/colorteller-black-6c5dd7689c-nqgk5   1/1     Running   0          28s
pod/colorteller-blue-58dbf546d5-nm88k    1/1     Running   0          28s
pod/colorteller-red-fc6655769-jj6zp      1/1     Running   0          28s
pod/tcpecho-6db7bff7cd-cst2c             1/1     Running   0          27s

NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/colorgateway        ClusterIP   10.100.114.7     <none>        9080/TCP   28s
service/colorteller         ClusterIP   10.100.144.40    <none>        9080/TCP   28s
service/colorteller-black   ClusterIP   10.100.62.90     <none>        9080/TCP   28s
service/colorteller-blue    ClusterIP   10.100.205.106   <none>        9080/TCP   28s
service/colorteller-red     ClusterIP   10.100.212.134   <none>        9080/TCP   28s
service/tcpecho             ClusterIP   10.100.243.101   <none>        2701/TCP   27s

NAME                                            AGE
virtualnode.appmesh.k8s.aws/colorgateway        28s
virtualnode.appmesh.k8s.aws/colorteller         28s
virtualnode.appmesh.k8s.aws/colorteller-black   28s
virtualnode.appmesh.k8s.aws/colorteller-blue    28s
virtualnode.appmesh.k8s.aws/colorteller-red     28s
virtualnode.appmesh.k8s.aws/tcpecho             28s

NAME                                                       AGE
virtualservice.appmesh.k8s.aws/colorgateway.appmesh-demo   28s
virtualservice.appmesh.k8s.aws/colorteller.appmesh-demo    28s
virtualservice.appmesh.k8s.aws/tcpecho.appmesh-demo        28s
```


```console
$ aws appmesh list-meshes --region us-east-1
{
    "meshes": [
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh"
        }
    ]
}
```

```console
$ aws appmesh list-virtual-services --mesh-name color-mesh
{
    "virtualServices": [
        {
            "meshName": "color-mesh",
            "virtualServiceName": "colorgateway.appmesh-demo",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualService/colorgateway.appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "virtualServiceName": "colorteller.appmesh-demo",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualService/colorteller.appmesh-demo"
        }
    ]
}
```

```console
$ aws appmesh list-virtual-nodes --mesh-name color-mesh
{
    "virtualNodes": [
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/colorteller-appmesh-demo",
            "virtualNodeName": "colorteller-appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/colorgateway-appmesh-demo",
            "virtualNodeName": "colorgateway-appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/tcpecho-appmesh-demo",
            "virtualNodeName": "tcpecho-appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/colorteller-black-appmesh-demo",
            "virtualNodeName": "colorteller-black-appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/colorteller-red-appmesh-demo",
            "virtualNodeName": "colorteller-red-appmesh-demo"
        },
        {
            "meshName": "color-mesh",
            "arn": "arn:aws:appmesh:us-east-1:000000000000:mesh/color-mesh/virtualNode/colorteller-blue-appmesh-demo",
            "virtualNodeName": "colorteller-blue-appmesh-demo"
        }
    ]
}
```



```console
$ kubectl -n appmesh-demo run -it curler --image=tutum/curl /bin/bash
kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run --generator=run-pod/v1 or kubectl create instead.
If you don't see a command prompt, try pressing enter.
```
