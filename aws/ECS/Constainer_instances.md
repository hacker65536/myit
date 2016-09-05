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

Contianer Instance AMIs
=====================
Amazon ECS Container instance 仕様は以下のような構成となる

Required
* kernel version 3.10以降のモダンなlinuxディストリビューション
* Amazon ECS container agentの最新バージョンが望ましい
* Docker daemon 1.5.0以降

ECS Container agent がテストし対応しているDockerのバージョンを使うことすすめる

Recommended
* 初期化とモニターのagent [`ecs-init`](https://github.com/aws/amazon-ecs-init)


特別の事情がなければ Amazon ECS-optimized AMI を使う事


Aamzon ECS-optimized AMI
==========================

Aamzon ECS-optimized AMIはAWSのエンジニアによってECSでテストされたAMIである。以下のようなシンプルな構成となっている

* 最新のAmazon Linux AMIの最小バージョン
* 最新のAmazon ECS container agent(1.12.1)
* ECS container agentのためのおすすめDockerバージョン(1.11.2)
* 最新のecs-init(1.12.1-1)

How to Launch the Latest Amazon ECS-optimized AMI
---------------------------------------------


| Region         | AMI Name                                | AMI ID       | EC2 console link |
|----------------|-----------------------------------------|--------------|------------------|
| us-east-1      | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-6bb2d67c | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstanceWizard:ami=ami-6bb2d67c)  |
| us-west-1      | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-70632110 | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-70632110)  |
| us-west-2      | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-2d1bce4d | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-2d1bce4d)  |
| eu-west-1      | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-078df974 | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-078df974)  |
| eu-central-1   | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-d3cf3ebc | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-d3cf3ebc)  |
| ap-northeast-1 | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-2b6ba64a | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-2b6ba64a)  |
| ap-southeast-1 | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-55598036 | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-55598036)  |
| ap-southeast-2 | amzn-ami-2016.03.h-amazon-ecs-optimized | ami-0e20176d | [Launch instance](https://console.aws.amazon.com/ec2/v2/home?region=us-west-1#LaunchInstanceWizard:ami=ami-0e20176d)  |


Storage configuration
----------------------------
Amazon ECS-optimized AMIはデフォルトでは30GiBのストレージがある(起動時に設定変更ができる)。このストレージはOSとdockerimageとmetaデータに使われる。下記でストレージの設定の説明を行う。

2015.9以降のバージョンでは8GiBのボリュームをOSで使用する。残りの22GiBは /dev/vdczにマウントされる。このボリュームはLVMでdevicemapper経由でdockerから直接アクセスされる。`docker-storage-setup`がinstance起動時にDockerのためにLVMボリュームグループと論理領域を設定する。defaultでは`docker`という名のvolume groupを作成する。物理領域の/dev/xvdczをそのgroupに追加する。そして、論理ボリューム`docker-pool`を作成する。1%の領域をmetadataに使い残りの99%を全部使用する。

note 2015.9.d->2016.03.a のバージョンのECS-optimized AMIは ボリュームグループの40%から論理領域を作成する。論理領域が60%になると20%増加する。

###dockerに使用するストレージを決めるには
LVM コマンド`vgs`か`lvs`、または`docker info`でサイズの確認ができる。

note LVMコマンドでは GiB(2^30bytes) docker info コマンドでは GB(10^9 bytes)を表示する

* 1KB=1000B  
* 1KiB=1024B
