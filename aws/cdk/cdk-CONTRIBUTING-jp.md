

Gettirng Started
--

日々の開発と一般的なコントリビューションは Node.js ≥ 10.3.0 で足りるはず。

```console
$ git clone git@github.com:aws/aws-cdk.git
$ cd aws-cdk
$ ./build.sh
```

もし`pack.sh`を使用して言語バインディングを作成する場合、以下のツールチェーンをインストールするか、もしくは Docker workflowを使用してください。

- Node.js 10.3.0
- Java OpenJDK 8
- .Net Core 2.0
- Python 3.6.5
- Ruby 2.5.1


Pull Requests
--

Pull Request Checklist

- [ ] testing
   - Unit test追加 (既存のtestを修正しないとbreaking changeになるかもしれない)
   - CLI change? teamの統合テストに合わせてupdateする
   - cdk-init template change? teamの統合テストに合わせてupdateする
- [ ] Docs
   - jsdocs: すべてのpublic APIにドキュメントはある
   - README: README もしくは ドキュメントのトピックの両方がupdateされている
   - Design: 重要な機能の場合は `design`のディレクトリに designのドキュメントを追加する
- [ ] Title and Description
   - Change type: タイトルのはじめに fix, feat とモジュール名をつける。それらは changelogに使用される
   - Title: 小文字を使用し、ピリオドをつけない
   - Breaking?: 最後の段に "BREAKING CHANGE: <describe what changed + link for details>"
   - Issues: "Fixes #xxx" か "Closes #xxx"を使ってissuesを示す
- [ ] Sensitive modules(PRは二人の承認が必要)
   - IAM Policy Document (in @aws-cdk/aws-iam)
   - Ec2 Security Groups and ACLs (in @aws-cdk/aws-ec2)
   - Grant APIs (公式の参照がない場合だけ)
   
   
### Step 1: Open Issue

 
もし、すでにあるものの中になければ、issueをopenしてそこにコントリビュートの意図を説明してください。それはよりよいコミュニケーションに役立ちます。
なぜなら、時々誰かがすでに作業をしていて、別々で同じ作業するより協力して行う方が良いでしょう。

### Step 2: Design (optional)


機能追加や変更が大きい場合、また適切な方向に向かうためにのアドバイスが欲しいときは設計書を作成しフィードバックを求めるのに有効なことがある。
 
Github issueであなたのやりたいことについて十分に議論され、明確にすることができるでしょう。
人々の継続なフィードバックによって設計書がよくなるでしょう。

GitHub issue descriptionで必要なものや、ユースケースをを集めて、設計書をmarkdown形式で作成し `design/`のディレクトリに置き、 PRを通してフィードバックを求めよう。タイトルの先頭に"RFC:"(request for comments)をつけましょう。

設計が確定したら、そのPRを実装のために再利用してもいいし、新しくPRを作成してもよい。
   
   
### Step 3: Work your Magic


あなたの魔法をかけてください。ここにいくつかのガイドラインがあります。

- Coding style (一部略)
   - まずは自分のスタイルに従う
   - 2 space インデント
   - 120 文字幅
   - markdownでは ATX style headingsを使用( 例 `## H2 headding`)
   - すべての変更はunit testが必要
   - もしAPIを変更する場合はそのモジュールのREADMEのupdateも確認する
   - 一つのPRに一つの機能/bugfixを維持すること、関連のある付随変更をすこし入れてもいいが、複数の機能を混同することを避けてください。適切な範囲内で使えるようにすべてを一つのcommitに入れること。
   
   
### Step 4: Commit
 
 提案された変更の commitを作成する
 
- Commit タイトルとメッセージ(PRのタイトルと説明)は conventionalcommitsに準拠しなければいけない。
  - タイトルは `feat(module): title`、`fix(module: title`、`refactor(module): title`もしくは `chore(module): title)`で始める必要がある
  - タイトルは小文字にすべき
  - タイトルの終わりにピリオドをつけない
   
- Commit メッセージに同期の説明を行うこと。reviewerたちがあなたがしたかったことを理解できるように情報を提供してください。もし、大きい commit (できればそうでない方がいいが)であれば、簡単に追えるように良いエントリポイントを提供してみてください。
 
- Commit メッセージはfixされたissueを示すべき `fixes #<issue>` か `closes #<issue>`
- コラボレータに知らせましょう。
- もし明確ではない場合(unit testsの情報など)、どのように変更を確認したか説明してください。
- もし breaking changeが含まれていれば、下記のフォーマットのように最後にリストされなければいけない(複数のbreaking changeはどのようなフォーマットか注意してください)

```
BREAKING CHANGE: Description of what broke and how to achieve this behavior now
* **module-name:** Another breaking change
* **module-name:** Yet another breaking change
```
   
