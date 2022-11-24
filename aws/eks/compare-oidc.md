```
aws eks list-clusters | jq -r '.clusters[]' | xargs -I{} -P 20 bash -c "aws eks describe-cluster --name {} | jq -rc '[.cluster.identity.oidc.issuer,.cluster.name]|@tsv'" |  sort -k 2,2 > clusteroidc
```
```
aws iam list-open-id-connect-providers --query 'OpenIDConnectProviderList[*]|@' --output text| sort > listoidc
```
```
join -a 1 -e 'null' <(cat listoidc | sed -r -e 's:(.*)/id/(.*):\2:'|sort) <(cat clusteroidc | sed -r -e 's:(.*)/id/(.*):\2:'|sort) | sort -k 2,2
```
