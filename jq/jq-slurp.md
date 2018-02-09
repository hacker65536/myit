
--slurp -s 


```
$ for i in {1..5}; do echo '{"num":'$RANDOM'}'; done
{"num":26222}
{"num":7343}
{"num":20239}
{"num":13082}
{"num":9289}
```

```
$ for i in {1..5}; do echo '{"num":'$RANDOM'}'; done | jq 'sort_by(.num)|.[]' -s
[
  {
    "num": 1
  },
  {
    "num": 2
  },
  {
    "num": 3
  },
  {
    "num": 4
  },
  {
    "num": 5
  }
]
```

```
for i in {1..5}; do echo '{"num":'$RANDOM'}'; done | jq 'sort_by(.num)|.[]' -s
{
  "num": 8100
}
{
  "num": 11509
}
{
  "num": 12304
}
{
  "num": 15182
}
{
  "num": 25034
}
```
