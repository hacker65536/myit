# JMESPath

https://jmespath.org/

tutotrial
--

https://jmespath.org/tutorial.html


client
--

```console
$ brew tap jmespath/jmespath
$ brew install jmespath/jmespath/jp
```


```console
$ echo '{"foo": {"bar": ["a", "b", "c"]}}' | jp foo.bar[1]
"b"
```

example
--


### contains

```console
$ echo '{"c":[{"a":"bbb"},{"a":"bbc"},{"a":"bc"}]}'| jp "c[?contains(a,'bb')]"
[
  {
    "a": "bbb"
  },
  {
    "a": "bbc"
  }
]
```
