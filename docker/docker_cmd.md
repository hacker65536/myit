
コンテナの作成して起動(スナップショット)
```
docker run -it ubuntu
```

コンテナの起動
```
docker start CONTAINER ID
```


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

##docker logs

コンテナ実行時から現在に至るまでのログ表示
```
docker logs CONTAINER ID
```

最後の５行のログ

`--tail=linenum`
```
docker logs --tail=5 CONTAINER ID
```

最後の５行を表示しつつ新着も取得

`-f` `--follow`
```
docker logs --tail=5 -f CONTAINER ID
```

