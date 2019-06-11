
show list of privateIP from Tags.Name
```bash
$ aws ec2 describe-instances | \
jq -r '.Reservations[].Instances[] | select((.Tags[]|select(.Key=="Name").Value) | contains("hostname")) | \ 
.PrivateIpAddress' | \
sort
```

```console
$ echo  '[{"foobar":"mysql","aa":"cc"},{"foobar":"sqlserver","abb":"cc"},{"blarp":"aa"}]' | \
jq '.[]| select(.foobar)| select (.foobar|contains("sql"))'
{
  "foobar": "mysql",
  "aa": "cc"
}
{
  "foobar": "sqlserver",
  "abb": "cc"
}
$ echo  '[{"foobar":"mysql","aa":"cc"},{"foobar":"sqlserver","abb":"cc"},{"blarp":"aa"}]' | \
jq '.[]| select(.foobar)| select (.foobar|contains("my"))'
{
  "foobar": "mysql",
  "aa": "cc"
}
```


from list
```console
$ echo '["foo","foobar","baz"]' | jq -r '.[]|select(.|contains("bar"))'
foobar
```
