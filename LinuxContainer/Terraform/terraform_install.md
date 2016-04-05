
#install

```
cd /usr/local/src
wget "https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip"
mkdir -p terraform/bin
unzip -d terraform/bin terraform_0.6.14_linux_amd64.zip
mv /usr/local/src/terraform /usr/local/
```

set PATH ( ~/.bash_rc)
```
export PATH=/usr/local/terraform/bin:$PATH
```
