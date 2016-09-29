
コンテナ削除
```bash
 docker rm $(docker ps -a -q)
 ```

不要なイメージの削除
```bash
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
```

バックグラウンド起動

`-d`
```
docker run -i -t -d ubuntu /bin/bash
```
