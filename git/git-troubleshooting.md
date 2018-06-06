problem
```console
$ git pull
fatal: refusing to merge unrelated histories
```
- localで`git init`行い新規リポジトリを作成
- githubで新規リポジトリ作成
- localにgithubのリポジトリを`git remote add`
- localで変更し、`git commit`
- remoteとlocalが不整合

solution
```console
$ git pull --allow-unrelated-histories
Merge made by the 'recursive' strategy.
 README.md | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 README.md
```
