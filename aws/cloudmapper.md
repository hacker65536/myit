
https://github.com/duo-labs/cloudmapper


require pyjq netaddr etc


```
git clone https://github.com/duo-labs/cloudmapper.git
cd !$:t:r
```


みたいリージョンのみを限定する
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
python cloudmapper.py prepare --account $account_name
python cloudmapper.py serve --public
```
