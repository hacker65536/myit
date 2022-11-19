

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
