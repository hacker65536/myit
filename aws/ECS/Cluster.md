
Cluster Concepts
=====================
* 別々のinstancetypeのcontainerを含むことが出来る
* clusterはリージョン指定
* Container instanceは一度に一つのクラスタにしか属せない
* 個別のIAMポリシーでクラスタ操作の制限ができる


Scaling a Cluster
===================

24/12/2015 以降に[Cetting Started](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_GetStarted.html)から立ち上げているのであれば
CloudformationによりautoscalingされのでECSコンソールから操作ができる。それ以前だとECSコンソールからの操作はできない。しかし、マニュアル操作による
autoscalingはできる

Deleteing a Cluster
===================

container instanceをクラスタから登録解除するとリソースに影響与えずにクラスタだけ削除できる？そうでない場合はcloudformationがstack
の削除を行い全部削除される。
