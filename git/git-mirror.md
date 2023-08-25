
https://docs.github.com/ja/repositories/creating-and-managing-repositories/duplicating-a-repository


```console
git clone --mirror https://github.com/EXAMPLE-USER/REPOSITORY-TO-MIRROR.git
```

```console
cd REPOSITORY-TO-MIRROR
git remote set-url --push origin https://github.com/EXAMPLE-USER/MIRRORED
```

```console
git fetch -p origin
# or
# git remote update
git push --mirror
```
