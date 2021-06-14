
get nodename(hostname) and instanceID
```console
$ k get node -o json | jq -rc '.items[]|[.metadata.name,.spec.providerID]|@tsv'|sed -r -e 's#aws:///(.*)/(.*)#\2#'
ip-192-168-32-71.us-east-2.compute.internal	i-0d013db0d36d845d8
ip-192-168-6-226.us-east-2.compute.internal	i-0483d5028b4c1da6e
```
