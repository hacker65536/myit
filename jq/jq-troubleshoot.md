```console
$ echo "{\"aa\":\"aaa\"}" | jq
{
  "aa": "aaa"
}
```

this dont work
```console
$ hoge=$(echo "{\"aa\":\"aaa\"}" | jq)
jq - commandline JSON processor [version 1.5]
Usage: jq [options] <jq filter> [file...]
---snip---
```

should be this
```
$ hoge=$(echo "{\"aa\":\"aaa\"}" | jq .)
```

