

```
❯ jq --arg key 'value' '$ARGS' <<<'{}'
{
  "positional": [],
  "named": {
    "key": "value"
  }
}
```
