##docker run

コンテナの作成して起動(スナップショット)
```
docker run -it ubuntu
```

フォアグラウンド実行

* `-i` Keep STDIN open even if not attached (もしattacheしてなくても STDINを openし続ける)
* `-t` Allocate apseudo-tty

バックグラウンド起動

`-d`
```
docker run -i -t -d ubuntu /bin/bash
```

##docker start

コンテナの起動
```
docker start CONTAINER ID
```

##docker rm
コンテナ削除
```bash
 docker rm $(docker ps -a -q)
 ```
##docker rmi
不要なイメージの削除
```bash
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
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

指定した時間からのログ表示

`--since 3h`　i.e. 1m30s  `--since`、`--follow`、`--tail`と同時に使える
```
docker logs --since 1m30s CONTAINER ID
```

コンテナにログインする

```
docker exec -it influxdb bash
```
