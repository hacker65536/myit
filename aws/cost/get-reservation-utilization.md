
```console
$ bash get_ri_utili.sh | jq -r '.|@csv'| pbcopy
```
```bash
#!/usr/bin/env bash

function timeperiod() {
	local start=$(TZ=UTC gdate +%F -d "8days ago")
	local end=$(TZ=UTC gdate +%F -d "2days ago")
	echo "Start=$start,End=$end"
}

function filters() {
	local svcarg=$1
	local svc=""
	local values=$(jq -c -n '$ARGS.positional' --args "aaaa")
	local dimensions=$(jq -n '$ARGS.named' --arg 'Key' 'SERVICE' --argjson 'Values' "$values")

	case $svcarg in
	"rds")
		svc="Amazon Relational Database Service"
		;;
	"ec2")
		svc="Amazon Elastic Compute Cloud - Compute"
		;;
	"es")
		svc="Amazon OpenSearch Service"
		;;
	"os")
		svc="Amazon OpenSearch Service"
		;;
	"cache")
    svc="Amazon ElastiCache"
		;;
	*)
		svc="Amazon Relational Database Service"
		;;
	esac

	jq -n '$ARGS.named' --argjson "Dimensions" "${dimensions}" | jq '.Dimensions.Values[0]="'"${svc}"'"' | jq -rc
}

#timeperiod

#filters es


#aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters rds)") --query 'UtilizationsByTime[*].Groups[*].[Value,Attributes.accountId,Attributes.accountName,Attributes.endDateTime,Attributes.platform,Attributes.instanceType,Attributes.numberOfInstances]' --output text
#aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters es)") --query 'UtilizationsByTime[*].Groups[*].[Value,Attributes.accountId,Attributes.accountName,Attributes.endDateTime,Attributes.platform,Attributes.instanceType,Attributes.numberOfInstances]' --output text
#aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters cache)") --query 'UtilizationsByTime[*].Groups[*].[Value,Attributes.accountId,Attributes.accountName,Attributes.endDateTime,Attributes.platform,Attributes.instanceType,Attributes.numberOfInstances]' --output text

aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters cache)") | jq -rc '.[][]|.Groups[]|[.Attributes.service,.Value,.Attributes.accountId,.Attributes.accountName,.Attributes.endDateTime,.Attributes.platform,.Attributes.instanceType,.Attributes.numberOfInstances]'
aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters os)") | jq -rc '.[][]|.Groups[]|[.Attributes.service,.Value,.Attributes.accountId,.Attributes.accountName,.Attributes.endDateTime,.Attributes.platform,.Attributes.instanceType,.Attributes.numberOfInstances]'
aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters rds)") | jq -rc '.[][]|.Groups[]|[.Attributes.service,.Value,.Attributes.accountId,.Attributes.accountName,.Attributes.endDateTime,.Attributes.platform,.Attributes.instanceType,.Attributes.numberOfInstances]'
aws ce get-reservation-utilization --time-period "$(timeperiod)" --group-by file://<(jq -n '$ARGS.named' --arg "Key" "SUBSCRIPTION_ID" --arg "Type" "DIMENSION"| jq -rc '.|[.]') --filter file://<(printf "$(filters ec2)") | jq -rc '.[][]|.Groups[]|[.Attributes.service,.Value,.Attributes.accountId,.Attributes.accountName,.Attributes.endDateTime,.Attributes.platform,.Attributes.instanceType,.Attributes.numberOfInstances]'
```


get dimension of service
```bash
aws ce get-dimension-values --time-period Start=2024-01-01,End=2024-01-18 --dimension SERVICE
```
