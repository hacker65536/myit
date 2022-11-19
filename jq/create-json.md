

https://unix.stackexchange.com/questions/676634/creating-a-nested-json-file-from-variables-using-jq


https://stackoverflow.com/questions/71410229/using-jq-with-an-unknown-amount-of-arguments-from-shell-script


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
