
env
```
❯ npm --version
8.12.1
```

what happen
```
❯ npm i -g aws-cdk
npm WARN config global `--global`, `--local` are deprecated. Use `--location=global` instead.
```


solution
```
❯ cat ~/.npmrc
prefix --location=global
```
