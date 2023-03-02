
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
FROM --platform=linux/arm64 amazonlinux:2


workdir /root
run yum install -y git unzip gzip vim-enhanced less tar zsh
run curl -SsL "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

copy ./config /root/.aws/config
copy ./zshrc /root/.zshrc
copy ./p10k.zsh /root/.p10k.zsh
```

```bash
docker build -t myamzlinux2arm . -f myamzlinux2arm
```

```
mkdir -p ~/ssoenv/sso/
mkdir -p ~/ssoenv/cache
alias maz2='docker run --rm -it --platform linux/arm64 -v $HOME/ssoenv/sso/:/root/.aws/sso/ -v $HOME/ssoenv/cache:/root/.cache -e AWS_PROFILE=AWSAdministratorAccess-111111111111 myamzlinux2arm zsh'
```
