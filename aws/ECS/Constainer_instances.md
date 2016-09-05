Container Instance Concepts
==============================

* コンテナインスタンスは[`Amazon ECS container agent`](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_agent.html)を起動してクラスタに登録しなければいけない。もし`Amazon ECS-optimized AMI`を使用するならばagentはインストール済み
* `Amazon ECS container agent`はあなたに変わってECSを呼び出す。cotainer instanceはしかるべきIAM roleを付けて起動する必要がある
* もしコンテナに振られたタスクが外部接続が必要とする場合はcontainer instanceのSGに設定しなければいけない
* ECSはVPCに立てることを強くすすめる。VPCはネットワーク上でより多くの制御と広範囲の機能の設定を提供する
* container instanceはECSのサービスエンドポイントにサクセスするには外部ネットワークが必要である。プライベートVPCではNATが必要になる。
* container instanceのEC2 instance typeによってクラスタの使えるリソースが決まる。
* container instanceはそれぞれユニークのステータスを持っているので、一度クラスタに登録されたcontainerinstanceを別のクラスタに再登録はすべきではない。terminateして新しいcontainer instanceを`Amazon ECS-optimized AMI`で作りなおすことをおすすめする
