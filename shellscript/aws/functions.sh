
lshostedzone () {
	aws route53 list-hosted-zones --query 'HostedZones[*].[Id,Name]' --output text | sed -e 's:/hostedzone/::' | docker run --rm -i column:latest -t
}
