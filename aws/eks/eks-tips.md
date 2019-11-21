


unsupported az us-east-1e
--
```
Cannot create cluster 'exciting-gopher-1559710619' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f (Service: AmazonEKS; Status Code: 400; Error Code: UnsupportedAvailabilityZoneException; Request ID: 775ea20b-874e-11e9-b648-b741b6bccb57)
```


eksctl create cluster --zones=us-east-1a,us-east-1b,us-east-1d


cant get token
--

https://github.com/kubernetes/kubectl/issues/747


```console
$ kubectl get svc

'credentialScope'

'credentialScope'

'credentialScope'
```

solution update awscli
