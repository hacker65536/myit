
https://stedolan.github.io/jq/manual/#Assignment


Update-assignment: |=

```
echo '[{"aaa": "bbb,dddd"}]'| jq '.[]|.aaa|=split(",")'
{
  "aaa": [
    "bbb",
    "dddd"
  ]
}
```
