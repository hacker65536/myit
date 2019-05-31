# dynamodb-local


https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html


docker 
--

```console
$ docker pull amazon/dynamodb-local
```
```console
$ docker images amazon/dynamodb-local                                                  
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
amazon/dynamodb-local   latest              d0e7e8b4a50a        3 months ago        506MB
```


run 
--

```console
$ docker network create lambda-local
```
```console
$ mkdir data
```
```
$ docker run --rm -d -v $(pwd)/data:/data \
-p 8000:8000 --network lambda-local \
--name dynamodb amazon/dynamodb-local \
-jar DynamoDBLocal.jar -dbPath /data -sharedDb
```
