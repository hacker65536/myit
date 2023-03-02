
`config`

```ini
[profile AWSAdministratorAccess-111111111111]
sso_session = myname
sso_account_id = 111111111111
sso_role_name = AWSAdministratorAccess
region = us-east-1
[sso-session myname]
sso_start_url = https://d-111111111111.awsapps.com/start
sso_region = us-east-1
sso_registration_scopes = sso:account:access
```



```dockerfile
FROM --platform=linux/x86_64 amazonlinux:2


workdir /root
run yum install -y unzip gzip vim-enhanced less
run curl -SsL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install
copy ./config /root/.aws/config
```

```bash
docker build -t myamzlinux2 . -f myamzlinux2
```

```
mkdir -p ~/ssoenv/sso/
alias maz2='docker run --rm -it --platform linux/x86_64 -v $HOME/ssoenv/sso/:/root/.aws/sso/ myamzlinux2 bash'
```
