
```console
$ aws organizations list-accounts | jq -rc '.Accounts[]|select(.Status=="ACTIVE")|[.Name,.Id]|@csv'
```

```
"name0","000000000000"
"name1","111111111111"
```
