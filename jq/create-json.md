

https://unix.stackexchange.com/questions/676634/creating-a-nested-json-file-from-variables-using-jq

```
❯ jq --arg key 'value' '$ARGS' <<<'{}'
{
  "positional": [],
  "named": {
    "key": "value"
  }
}
```


```
❯ jq --arg key 'value' '$ARGS.named' <<<'{}'
{
  "key": "value"
}
```
