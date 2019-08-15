# jenkins roles

Role-based Authorization Strategy

https://wiki.jenkins.io/display/JENKINS/Role+Strategy+Plugin


1. install the plugin( require Authorize Project)
2. configureSecurity ->  check Role-Based Strategy
3. configureSecurity ->  Access Control for Builds
4. jenkins/imanage -> Manage and Assign Roles
5. create role in manage roles
6. assing role in assign roles



全体的な設定
- Jenkinsの管理 -> Manage and Assign Roles -> Manage Roles
  - global rolesにadmin以外のroleを追加
- Jenkinsの管理 -> Manage and Assign Roles -> Assign Roles
  - global rolesに作成したroleにユーザを追加して適応する


個別な設定
- Jenkinsの管理 -> Manage and Assign Roles -> Manage Roles
  - project rolesにパターンにマッチ(ジョブ名)したroleを追加
- Jenkinsの管理 -> Manage and Assign Roles -> Assign Roles
  - item rolesに作成したroleにユーザを追加して適応する
