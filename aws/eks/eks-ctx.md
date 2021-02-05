
```console
$ alias sweks="aws eks list-clusters | jq -r '.[][]' | fzf | xargs -I{} aws eks update-kubeconfig --name {}"
```
