```console
$ kubectl version
Client Version: version.Info{Major:"1", Minor:"13+", GitVersion:"v1.13.7-eks-c57ff8", GitCommit:"c57ff8e35590932c652433fab07988da79265d5b", GitTreeState:"clean", BuildDate:"2019-06-11T03:47:47Z", GoVersion:"go1.11.5", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"13+", GitVersion:"v1.13.7-eks-c57ff8", GitCommit:"c57ff8e35590932c652433fab07988da79265d5b", GitTreeState:"clean", BuildDate:"2019-06-07T20:43:03Z", GoVersion:"go1.11.5", Compiler:"gc", Platform:"linux/amd64"}
```

```console
$ kubectl api-versions --help
Print the supported API versions on the server, in the form of "group/version"

Examples:
  # Print the supported API versions
  kubectl api-versions

Usage:
  kubectl api-versions [flags] [options]

Use "kubectl options" for a list of global command-line options (applies to all commands).

```
```console
$ kubectl api-versions
admissionregistration.k8s.io/v1beta1
apiextensions.k8s.io/v1beta1
apiregistration.k8s.io/v1
apiregistration.k8s.io/v1beta1
apps/v1
apps/v1beta1
apps/v1beta2
authentication.k8s.io/v1
authentication.k8s.io/v1beta1
authorization.k8s.io/v1
authorization.k8s.io/v1beta1
autoscaling/v1
autoscaling/v2beta1
autoscaling/v2beta2
batch/v1
batch/v1beta1
certificates.k8s.io/v1beta1
coordination.k8s.io/v1beta1
crd.k8s.amazonaws.com/v1alpha1
events.k8s.io/v1beta1
extensions/v1beta1
networking.k8s.io/v1
policy/v1beta1
rbac.authorization.k8s.io/v1
rbac.authorization.k8s.io/v1beta1
scheduling.k8s.io/v1beta1
storage.k8s.io/v1
storage.k8s.io/v1beta1
v1
```
