
```bash
for id in $(aws support describe-trusted-advisor-checks --region us-east-1  --language en | jq -c -r  '.checks[] | select(   select(.category=="security") | ( .name | contains("Security Groups")) )| .id')
do
aws support describe-trusted-advisor-check-result --region us-east-1 --language en --check-id $id |jq -c '.result.flaggedResources[]| select(.status=="error")'
done
```
