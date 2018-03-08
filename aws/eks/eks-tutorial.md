
create vpc from cloudformation

`https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/vpc_cloudformation.yml`

resources
```bash
aws cloudformation describe-stack-resources --stack-name eks-vpc | \
jq -c '.[][]|[.LogicalResourceId,.PhysicalResourceId]'
["EksServiceRole","eks-vpc-EksServiceRole-IYV0CUEAAN4W"]
["InternetGateway","igw-cb4ec1ad"]
["Route","eks-v-Route-IGIVK4UL40K5"]
["RouteTable","rtb-fd78e985"]
["VPC","vpc-ec214c95"]
["VPCGatewayAttachment","eks-v-VPCGa-HYZ7NOFOZ4R6"]
```


kubectl
```
curl -SsL -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/kubectl
chmod +x $:t
cp $:t $HOME/bin/kubectl 
export PATH=$HOME/bin:$PATH
```

```
kubectl version
Client Version: version.Info{Major:"1", Minor:"7+", GitVersion:"v1.7.10-eks-0.1", GitCommit:"41bb06b02354b78256b1256aa487abad7407abd1", GitTreeState:"clean", BuildDate:"2017-11-27T20:32:09Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```

aws eks
```
$ aws eks
usage: aws [options] <command> <subcommand> [<subcommand> ...] [parameters]
To see help text, you can run:

  aws help
  aws <command> help
  aws <command> <subcommand> help
aws: error: argument command: Invalid choice, valid choices are:
--snip--
Invalid choice: 'eks', maybe you meant:

  * es
```

```
curl -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/eks-2017-11-01.normal.json
aws configure add-model --service-model file://eks-2017-11-01.normal.json --service-name eks
```
```
$ aws eks help
EKS()                                                                    EKS()



NAME
       eks -

DESCRIPTION
       Amazon  Elastic Container Service for Kubernetes (Amazon EKS) is a man-
       aged service that makes it easy for you to run Kubernetes on AWS  with-
       out needing to install and operate your own Kubernetes clusters. Kuber-
       netes is an open-source system for automating the deployment,  scaling,
       and  management of containerized applications. Operating Kubernetes for
       production applications presents a number of challenges.  You  need  to
       manage the scaling and availability of your Kubernetes masters and per-
       sistence layer by ensuring that you have  chosen  appropriate  instance
       types,  running  them  across  multiple  Availability Zones, monitoring
       their health, and replacing unhealthy nodes.  You  need  to  patch  and
       upgrade  your  masters  and worker nodes to ensure that you are running
       the latest version of Kubernetes. This all requires expertise and a lot
       of  manual  work.  With  Amazon EKS, upgrades and high availability are
       managed for you by AWS. Amazon EKS runs three Kubernetes masters across
       three  Availability  Zones in order to ensure high availability. Amazon
       EKS automatically detects and replaces unhealthy masters, and  it  pro-
       vides automated version upgrades and patching for the masters.

       Amazon  EKS is also integrated with many AWS services to provide scala-
       bility and security for your applications, including Elastic Load  Bal-
       ancing  for  load  distribution, IAM for authentication, Amazon VPC for
       isolation, AWS PrivateLink for private network access, and  AWS  Cloud-
       Trail   for  logging.  Amazon  EKS  runs  the  latest  version  of  the
       open-source Kubernetes software, so you can use all the existing  plug-
       ins  and tooling from the Kubernetes community. Applications running on
       Amazon EKS are fully compatible with applications running on any  stan-
       dard Kubernetes environment, whether running in on-premises datacenters
       or public clouds. This means that you can easily migrate  any  standard
       Kubernetes  application  to  Amazon  EKS  without any code modification
       required.

AVAILABLE COMMANDS
       o create-cluster

       o delete-cluster

       o describe-cluster

       o help

       o list-clusters



                                                                         EKS()
```


create IAM user fo eks

- poweruser( arn:aws:iam::aws:policy/PowerUserAccess )
- iam:passorle

create eks cluster 
```
clustername=eks-preview
aws eks create-cluster --cluster-name $clustername --role-arn arn:aws:iam::000000000:role/eks-vpc-EksServiceRole-IYV0CUEAAN4W --vpc-id vpc-ec214c95
```
endpoint
```
endpoint=$(aws eks describe-cluster --cluster-name $custername --query cluster.masterEndpoint | jq -r '.')
echo $endpoint
https://730EFE7BFA284AC792550879C1B2041D.sk1.us-west-2.eks.amazonaws.com
```

create config
```
mkdir -p ~/.kube
cat <<EOF > ~/.kube/config-eks-preview
apiVersion: v1
clusters:
- cluster:
    server: $endpoint
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
    auth-provider:
      config:
        cluster-id: $clustername
      name: aws
EOF
```

```
export KUBECONFIG=$KUBECONFIG:~/.kube/config-eks-preview
```

```
kubectl get nodes
No resources found.
```

create workernode from cloudformation

`https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/nodegroup_cloudformation.yml`

```
$ aws cloudformation describe-stack-resources --stack-name eks-preview-worker-nodes |jq -c '.[][]|[.LogicalResourceId,.PhysicalResourceId]'
["NodeGroup","eks-preview-worker-nodes-NodeGroup-O06IFOJI6EMV"]
["NodeInstanceProfile","eks-preview-worker-nodes-NodeInstanceProfile-141G8BC5RWJT1"]
["NodeInstanceRole","eks-preview-worker-nodes-NodeInstanceRole-1E97EK7WH11XU"]
["NodeLaunchConfig","eks-preview-worker-nodes-NodeLaunchConfig-1BRG188TN73KK"]
["NodeSecurityGroup","sg-99270ae6"]
["NodeSecurityGroupIngress","NodeSecurityGroupIngress"]
["Subnet01","subnet-50419229"]
["Subnet01RouteTableAssociation","rtbassoc-19cc0663"]
["Subnet02","subnet-a88578e3"]
["Subnet02RouteTableAssociation","rtbassoc-4dc20837"]
```

download AWS authenticator configuration map and edit
```
curl -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/aws-auth-cm.yaml
```
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: default
data:
  mapRoles: |
    - rolearn: <ARN of instance role (not instance profile)>
      username: aws:{{AccountID}}:instance:{{SessionName}}
      groups:
        - system:bootstrappers
        - system:nodes
        - system:node-proxier
```
apply
```
kubectl apply -f aws-auth-cm.yaml
configmap "aws-auth" created
```

```
kubectl get nodes
NAME                                         STATUS    AGE       VERSION
ip-10-0-110-217.us-west-2.compute.internal   Ready     48s       v1.7.10-eks.1
ip-10-0-120-146.us-west-2.compute.internal   Ready     45s       v1.7.10-eks.1
ip-10-0-149-175.us-west-2.compute.internal   Ready     50s       v1.7.10-eks.1
```

dns add on
```
curl -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.7.10/0.1/dns.yaml
sed -e "s/REPLACE_WITH_MASTER_ENDPOINT_HOST/${endpoint#https://}/" -i dns.yaml
kubectl create --validate=false -f dns.yaml
```


launch a guest book app
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/redis-master-controller.json
replicationcontroller "redis-master" created
```
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/redis-master-service.json
service "redis-master" created
```
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/redis-slave-controller.json
replicationcontroller "redis-slave" created
```
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/redis-slave-service.json
service "redis-slave" created
```
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/guestbook-controller.json
replicationcontroller "guestbook" created
```
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kubernetes/v1.7.10/examples/guestbook-go/guestbook-service.json
service "guestbook" created
```

```
kubectl get services -o wide
NAME           CLUSTER-IP     EXTERNAL-IP                                                              PORT(S)          AGE       SELECTOR
guestbook      10.100.0.102   eradfa237228f11afbfec027d23b86f8-786966601.us-west-2.elb.amazonaws.com   3000:30375/TCP   3m        app=guestbook
kubernetes     10.100.0.1     <none>                                                                   443/TCP          1h        <none>
redis-master   10.100.0.239   <none>                                                                   6379/TCP         5m        app=redis,role=master
redis-slave    10.100.0.53    <none>                                                                   6379/TCP         4m        app=redis,role=slave
```



