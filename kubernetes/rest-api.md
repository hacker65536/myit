
```console
# SEVER
$ aws eks describe-cluster --name myeks | jq -r '.cluster.endpoint'

# https://ABDCDEFG12345678906A7766C874E51AF6CD.ab1.us-east-2.eks.amazonaws.com
```
```console
# TOKEN
$ aws eks get-token --cluster-name myeks | jq -r '.status.token'
```
```console
$ aws eks describe-cluster --name myeks | jq -r '.cluster.certificateAuthority.data'|base64 -d >ca.crt
```


```console
$ curl -X GET $SERVER --header "Authorization: Bearer $TOKEN" --cacert ca.crt
```

```console
curl  --header "Authorization: Bearer $TOKEN" --cacert ca.crt -X GET ${SERVER}/api/v1/namespaces/kube-system/pods
```
