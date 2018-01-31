
ansibleのroleのディレクトリ構成
===================


公式ドキュメント
----------------

http://docs.ansible.com/ansible/latest/playbooks_reuse_roles.html#role-directory-structure



ディレクトリ構成
---------------

- tasks
- handlers
- defaults
- vars
- files
- templates
- meta


### tasks

ロールによって実行されるメイン処理のリスト

### handlers 

notifyによりhandlersに設定した処理をコールバック的に呼び出す処理を格納するディレクトリ


サンプル
```yml
tasks:
   - name: configure httpd.conf
     template: src=vhost.conf dest=/etc/httpd/conf.d/vhost.conf
     notify: restart httpd
handlers:
   - name: restart httpd
     service: name=httpd state=restarted
```

ファイルの変更を行った場合restartedを実行する（変更がなければ実行されない)

### default

変数格納用ディレクトリ

変数の優先順位はややこしいので注意

http://docs.ansible.com/ansible/latest/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable


- role defaults 
- inventory file or script group vars
- inventory group_vars/all
- playbook group_vars/all
- inventory group_vars/*
- playbook group_vars/*
- inventory file or script host vars 
- inventory host_vars/*
- playbook host_vars/*
- host facts
- play vars
- play vars_prompt
- play vars_files
- role vars (defined in role/vars/main.yml)
- block vars (only for tasks in block)
- task vars (only for the task)
- role (and include_role) params
- include params
- include_vars
- set_facts / registered vars
- extra vars (always win precedence)


一番低い順位なので、他で簡単に上書きできる

### vars

変数格納用ディレクトリ

上記よりかなり上なので強い意味の初期値としての利用

### files

copyモジュールのsrcとして利用するディレクトリ、主に静的ファイル

### templates

templateモジュールのsrcとして利用するディレクトリ  

jinja2のテンプレートエンジンを使用し一部のパラメータを動的に扱う場合に利用する(defaults,varsなどと連動したいケース)

注意：jinja2の書式に引っかかり意図しない値が勝手に展開される場合があるので静的ファイルはfilesを利用する

### meta

依存関係を解決するために利用するディレクトリ


`roles/httpd/meta/main.yml`
```yml
dependencies:
  - { role: php }
```

httpdをインストールする時にphpも一緒にインストールされる
