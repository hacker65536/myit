# app mesh

https://www.appmeshworkshop.com/



## app mesh components

![](/images/appmeshflow.png)

- service mesh
- virtual services
- virtual nodes
- envoy proxy
- virtual routers
- routes

## app mesh benefits

- end-to-end visibility
- ensure high availability
- streamline operations
- enhance any application
- end-to-end encryption


## install required tools

- jq 
- gettext
- bash-completion
- session-manager-plugin
- kubectl
- eksctl
- awscli


eksctl
```console
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl ~/.local/bin
```

```console
❯ eksctl version
0.54.0
```


kubectl
```console
curl -SsL -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
```

```console
❯ kubectl version --short
Client Version: v1.19.6-eks-49a6c0
error: You must be logged in to the server (the server has asked for the client to provide credentials)
```

```console
❯ jq --version
jq-1.5
```

```console
❯ aws --version
aws-cli/1.18.147 Python/2.7.18 Linux/4.14.232-176.381.amzn2.x86_64 botocore/1.18.6
```

## clone service repos
```
mkdir appmesh
cd appmesh
git clone https://github.com/brentley/ecsdemo-frontend.git
git clone https://github.com/brentley/ecsdemo-nodejs.git
git clone https://github.com/brentley/ecsdemo-crystal.git
```
