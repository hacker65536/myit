
list-hosted-zones
--
```zsh
❯ type -f lshostedzone
lshostedzone () {
	aws route53 list-hosted-zones --query 'HostedZones[*].[Id,Name,Config.PrivateZone]' --output text | sed -e 's:/hostedzone/::' | docker run --rm -i column:latest -t
}
```
