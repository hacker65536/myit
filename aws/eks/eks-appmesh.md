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

```yml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: adrable-rainbow2
  region: us-east-1
  version: "1.13"

availabilityZones:
  - us-east-1a
  - us-east-1b
  - us-east-1d


nodeGroups:
  - name: ng-1
    instanceType: m5.large
    desiredCapacity: 2
    iam:
      withAddonPolicies:
        albIngress: true
        autoScaler: true
        appMesh: true
```



```console
$ eksctl create cluster -f ekscluster.yml
[ℹ]  using region us-east-1
[ℹ]  subnets for us-east-1a - public:192.168.0.0/19 private:192.168.96.0/19
[ℹ]  subnets for us-east-1b - public:192.168.32.0/19 private:192.168.128.0/19
[ℹ]  subnets for us-east-1d - public:192.168.64.0/19 private:192.168.160.0/19
[ℹ]  nodegroup "ng-1" will use "ami-0f2e8e5663e16b436" [AmazonLinux2/1.13]
[ℹ]  using Kubernetes version 1.13
[ℹ]  creating EKS cluster "adrable-rainbow2" in "us-east-1" region
[ℹ]  1 nodegroup (ng-1) was included
[ℹ]  will create a CloudFormation stack for cluster itself and 1 nodegroup stack(s)
[ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --name=adrable-rbow2'
[ℹ]  2 sequential tasks: { create cluster control plane "adrable-rainbow2", create nodegroup "ng-1" }
[ℹ]  building cluster stack "eksctl-adrable-rainbow2-cluster"
[ℹ]  deploying stack "eksctl-adrable-rainbow2-cluster"
[ℹ]  building nodegroup stack "eksctl-adrable-rainbow2-nodegroup-ng-1"
[ℹ]  --nodes-min=2 was set automatically for nodegroup ng-1
[ℹ]  --nodes-max=2 was set automatically for nodegroup ng-1
[ℹ]  deploying stack "eksctl-adrable-rainbow2-nodegroup-ng-1"
[✔]  all EKS cluster resource for "adrable-rainbow2" had been created
[✔]  saved kubeconfig as "/home/ec2-user/.kube/config"
[ℹ]  adding role "arn:aws:iam::910039619599:role/eksctl-adrable-rainbow2-nodegroup-NodeInstanceRole-17S4FF93C4KIK" to auth ConfigMap
[ℹ]  nodegroup "ng-1" has 0 node(s)
[ℹ]  waiting for at least 2 node(s) to become ready in "ng-1"
[ℹ]  nodegroup "ng-1" has 2 node(s)
[ℹ]  node "ip-192-168-21-23.ec2.internal" is ready
[ℹ]  node "ip-192-168-84-197.ec2.internal" is ready
[ℹ]  kubectl command should work with "/home/ec2-user/.kube/config", try 'kubectl get nodes'
[✔]  EKS cluster "adrable-rainbow2" in "us-east-1" region is ready
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
aws-app-mesh-inject-69bc8b6499-ds89q   1/1     Running   0          60s
```

```console
$ curl -SsL https://raw.githubusercontent.com/aws/aws-app-mesh-controller-for-k8s/v0.1.0/deploy/v0.1.0/all.yaml | kubectl apply -f -
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
pod/app-mesh-controller-6b89ccfb8c-7zkvh condition met
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
$ export AWS_REGION=yours
$ export AWS_ACCOUNT=yours
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


```console
$ kubectl -n appmesh-demo get deploy,po,svc,virtualnode.appmesh.k8s.aws,virtualservice.appmesh.k8s.aws
NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.extensions/colorgateway        1/1     1            1           4m43s
deployment.extensions/colorteller         1/1     1            1           4m43s
deployment.extensions/colorteller-black   1/1     1            1           4m42s
deployment.extensions/colorteller-blue    1/1     1            1           4m42s
deployment.extensions/colorteller-red     1/1     1            1           4m42s
deployment.extensions/tcpecho             1/1     1            1           4m42s

NAME                                     READY   STATUS    RESTARTS   AGE
pod/colorgateway-678c7b88b4-xmzx5        1/1     Running   0          4m43s
pod/colorteller-759fc757cc-j468v         1/1     Running   0          4m43s
pod/colorteller-black-6c5dd7689c-8mx49   1/1     Running   0          4m42s
pod/colorteller-blue-58dbf546d5-gtm9r    1/1     Running   0          4m42s
pod/colorteller-red-fc6655769-b5xhc      1/1     Running   0          4m42s
pod/tcpecho-6db7bff7cd-vxfds             1/1     Running   0          4m42s

NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/colorgateway        ClusterIP   10.100.142.47   <none>        9080/TCP   4m43s
service/colorteller         ClusterIP   10.100.46.206   <none>        9080/TCP   4m43s
service/colorteller-black   ClusterIP   10.100.20.64    <none>        9080/TCP   4m43s
service/colorteller-blue    ClusterIP   10.100.248.80   <none>        9080/TCP   4m42s
service/colorteller-red     ClusterIP   10.100.99.59    <none>        9080/TCP   4m42s
service/tcpecho             ClusterIP   10.100.144.88   <none>        2701/TCP   4m42s

NAME                                            AGE
virtualnode.appmesh.k8s.aws/colorgateway        4m
virtualnode.appmesh.k8s.aws/colorteller         4m
virtualnode.appmesh.k8s.aws/colorteller-black   4m
virtualnode.appmesh.k8s.aws/colorteller-blue    4m
virtualnode.appmesh.k8s.aws/colorteller-red     4m
virtualnode.appmesh.k8s.aws/tcpecho             4m

NAME                                                       AGE
virtualservice.appmesh.k8s.aws/colorgateway.appmesh-demo   4m
virtualservice.appmesh.k8s.aws/colorteller.appmesh-demo    4m
virtualservice.appmesh.k8s.aws/tcpecho.appmesh-demo        4m
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
