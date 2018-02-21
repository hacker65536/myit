
https://github.com/duo-labs/cloudmapper


download
```
git clone https://github.com/duo-labs/cloudmapper.git
cd !$:t:r
```


デフォルトでは全リージョンを見るので多い場合はリージョンを限定する
```
account_name=my_account
mkdir -p $account_name
cat <<EOF> ${account_name}/describe-regions.json
{
    "Regions": [
        {
            "Endpoint": "ec2.us-east-2.amazonaws.com",
            "RegionName": "us-east-2"
        }
    ]
}
EOF
```

全リージョン取得をコメントアウト
`collect_data.sh`
```bash
#aws ec2 describe-regions > describe-regions.json
```

```
./collect_data.sh --account $account_name
```

cp config and fix name
```
cp config.json.demo config.json
```


```
python cloudmapper.py prepare --account $account_name
python cloudmapper.py serve --public
```
起動したサーバを http://host:8000でアクセスする
