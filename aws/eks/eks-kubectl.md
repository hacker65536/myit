# eks kubectl

https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html#install-kubectl-linux

```console
$ curl -SsL -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl
$ curl -SsL -o kubectl.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl.sha256
$ openssl sha1 -sha256 kubectl
$ chmod +x ./kubectl
$ mv ./kubectl ~/.local/bin
```
if using path to $HOME/bin
```console
$ mkdir $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
$ echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
```

```console
$ kubectl version --short --client
Client Version: v1.11.5
```
