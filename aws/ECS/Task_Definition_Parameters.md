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
