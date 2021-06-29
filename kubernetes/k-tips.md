
get instanceID nodename(hostname) and asgname
```console
$ k get node -o json | jq -rc '.items[]|[.spec.providerID,.metadata.name,.metadata.labels["alpha.eksctl.io/nodegroup-name"]]|@tsv' | sort -k 3 | sed -r -e 's#aws:///(.*)/(.*)#\2#' | expand -t 6
i-0483d5028b4c1da6e     ip-192-168-6-226.us-east-2.compute.internal     ng-1
i-0d013db0d36d845d8     ip-192-168-32-71.us-east-2.compute.internal     ng-1
```


get pods on the node
```console
$ k get pod -A -o json| jq -rc '.items[]|[.spec.nodeName,.metadata.name]|@tsv'|grep ip-192-168-32-71.us-east-2.compute.internal
ip-192-168-32-71.us-east-2.compute.internal	cloudwatch-agent-nshp2
ip-192-168-32-71.us-east-2.compute.internal	fluentd-cloudwatch-jbjdk
ip-192-168-32-71.us-east-2.compute.internal	app
ip-192-168-32-71.us-east-2.compute.internal	aws-load-balancer-controller-f4d99bf56-w9k9t
ip-192-168-32-71.us-east-2.compute.internal	aws-node-jrb9b
ip-192-168-32-71.us-east-2.compute.internal	coredns-56b458df85-xd4h5
ip-192-168-32-71.us-east-2.compute.internal	ebs-csi-controller-6b67b95f9b-sctrg
ip-192-168-32-71.us-east-2.compute.internal	ebs-csi-node-w6c5z
ip-192-168-32-71.us-east-2.compute.internal	kube-proxy-pk8wj
ip-192-168-32-71.us-east-2.compute.internal	nginx-deployment-696458b44c-24bzq
ip-192-168-32-71.us-east-2.compute.internal	nginx-deployment-696458b44c-89khb
ip-192-168-32-71.us-east-2.compute.internal	nginx-deployment-696458b44c-jwtp7
```

get nodename, asgname, podname
```console
join <(k get node -o json | jq -rc '.items[].metadata|[.labels["kubernetes.io/hostname"],.labels["alpha.eksctl.io/nodegroup-name"]]|@tsv'| sort -k 1) <(k get pod -A -o json| jq -rc '.items[]|[.spec.nodeName,.metadata.name]|@tsv' | sort -k 1)
```
