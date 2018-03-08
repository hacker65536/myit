
create vpc from cloudformation


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
aws eks create-cluster --cluster-name eks-preview --role-arn arn:aws:iam::000000000:role/eks-vpc-EksServiceRole-IYV0CUEAAN4W --vpc-id vpc-ec214c95
```
