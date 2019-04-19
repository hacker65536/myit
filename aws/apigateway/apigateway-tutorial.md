# apigateway

https://docs.aws.amazon.com/ja_jp/apigateway/latest/developerguide/create-api-using-awscli.html


create api
--

```console
$ aws apigateway create-rest-api --name 'Simple PetStore (AWS CLI)'
{
    "apiKeySource": "HEADER",
    "name": "Simple PetStore (AWS CLI)",
    "createdDate": 1555646013,
    "endpointConfiguration": {
        "types": [
            "EDGE"
        ]
    },
    "id": "x89d9sblof"
}
```


get root resource's id

```console
$ aws apigateway get-resources --rest-api-id x89d9sblof
{
    "items": [
        {
            "path": "/",
            "id": "jih521vdg7"
        }
    ]
}
```


create resource

```console
$ aws apigateway create-resource --rest-api-id x89d9sblof \
--parent-id jih521vdg7 \
--path-part pets
{
    "path": "/pets",
    "pathPart": "pets",
    "id": "jzukf1",
    "parentId": "jih521vdg7"
}
```

create child of resource 

```console
$ aws apigateway create-resource --rest-api-id x89d9sblof \
--parent-id jzukf1 \
--path-part '{petId}'
{
    "path": "/pets/{petId}",
    "pathPart": "{petId}",
    "id": "9ju8ay",
    "parentId": "jzukf1"
}
```

put method
```console
$ aws apigateway put-method --rest-api-id x89d9sblof \
--resource-id jzukf1 \
--http-method GET \
--authorization-type "NONE" 
{
    "apiKeyRequired": false,
    "httpMethod": "GET",
    "authorizationType": "NONE"
}
```
