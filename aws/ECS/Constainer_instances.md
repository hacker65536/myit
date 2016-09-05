Container Instance Concepts
==============================

* コンテナインスタンスは[`Amazon ECS container agent`](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_agent.html)を起動してクラスタに登録しなければいけない。もし`Amazon ECS-optimized AMI`を使用するならばagentはインストール済み
* `Amazon ECS container agent`はあなたに変わってECSを呼び出す。cotainer instanceはしかるべきIAM roleを付けて起動する必要がある
* もしコンテナに振られたタスクが外部接続が必要とする場合はcontainer instanceのSGに設定しなければいけない
* ECSはVPCに立てることを強くすすめる。VPCはネットワーク上でより多くの制御と広範囲の機能の設定を提供する
* container instanceはECSのサービスエンドポイントにサクセスするには外部ネットワークが必要である。プライベートVPCではNATが必要になる。
* container instanceのEC2 instance typeによってクラスタの使えるリソースが決まる。
* container instanceはそれぞれユニークのステータスを持っているので、一度クラスタに登録されたcontainerinstanceを別のクラスタに再登録はすべきではない。terminateして新しいcontainer instanceを`Amazon ECS-optimized AMI`で作りなおすことをおすすめする

Container InstanceLife Cycle
============================

`Amazon ECS container agent`がinstanceをクラスタに登録すると、container instanceのステータスはACTIVEになり、agent コネクションステータスはTUREになる。このcontainer instanceはtaskリクエストを実行できるようになる。
もし container instanceを停止(not terminate)、statusはまだACTIVEだけど、agent connection statusはしばらくFALSEになる。container instance上で実行されているタスクは停止する。もしcontainer instance を再起動すると、cotainer agentはECSサービスに再接続する。タスクの再実行できるようになる。

* important 過去バージョンのcotainer agentはcontainer instance が再起動する際にIDの解除せずに登録して重複することがある。agentのバージョンアップが必要

Check the instance Role for your Account
==================================

Amazon ECS container agent は ECS APIsをあなたの代わりにcallするので、あなた所有のagentとして知らせるためにはIAM policyやroleが必要。
first-run experienceで自動作成されたRoleがあるので (`ecsInstanceRole`)それがあればそのまま使用し、なければ[`Amazon ECS Container Instance IAM Role`](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html?shortFooter=true)のようにpolicyを作成する。

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
```
