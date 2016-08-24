Task Definition Parameters
==========================
Task definitions は 4つの基本パーツに別れる

1. task family
2. IAM task role
3. container definitions
4. volumes




**family**はtask名となる。同じfamily名だと複数のバージョンを持つことが可能。

**IAM task role**はtask内に持つべきパーミッションを指定する。

**Container difinitions**は使用するイメージにどれだけのCPU、メモリを割り振るかを指定する。またその他のオプション。

**Volumesは**はコンテナ間のデータの共有を許可する。また、コンテナが実行していなくともデータを保持する。

family,container definitionsは必須。task role,network mode,volumesはoptional。






Family
------------

family

* type: string
* required: yes



Task Role
--------------
taskRoleArn

* type: string
* required: no

Network Mode
-------------
networkMode

* type: string
* required: no

default: bridge

hostモードはパフォーマンスが高いがhostのポートマッピングに依存するので同じコンテナinstanceの上に同じtaskを実行できない。

Container Definitions
-----------------

**Standard Container Definition Parameters**

name

* type: string
* required: yes

コンテナ名。もし一つのtask definitionに複数のコンテナをリンクさせるなら、疎通させたいの別のコンテナのlinksにコンテナ名を入れる。
255文字、数字、hyphen、アンダースコア。

image

* type: string
* required: yes

コンテナに使うイメージ名。この文字はDocker daemonに渡される。デフォルトではDocker Hub Registryに入っているイメージを使うことが可能。
他のリポジトリを指定することも可能。(repository-url/image:tag)





