
```bash
aws route53 list-resource-record-sets --hosted-zone-id <hosted-zone-id> | \ 
jq -c -r \ 
'.ResourceRecordSets[]| if .Type == "A" and select(.Name | contains("hostname")) then .Name , .ResourceRecords[].Value else empty end'
```
