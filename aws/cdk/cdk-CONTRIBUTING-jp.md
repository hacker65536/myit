

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
   
   
 Step 1: Open Issue
 --
 
 
   
   
   
