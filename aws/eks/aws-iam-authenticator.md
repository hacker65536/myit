# aws-iam-authenticator

https://github.com/kubernetes-sigs/aws-iam-authenticator

install (Amazon EKS vended)
--

https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html

```console
$ curl -SsLO https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
$ curl -SsLO https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator.sha256
$ openssl sha1 -sha256 aws-iam-authenticator
```

```console
$ chmod +x ./aws-iam-authenticator
$ mv ./aws-iam-authenticator ~/.local/bin
```

or 

```console
$ cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
$ echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
```
