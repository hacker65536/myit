#!/user/bin/env bash


# version comment is below

#Terraform v0.12.2
#
#Your version of Terraform is out of date! The latest version
#is 0.12.3. You can update by downloading from www.terraform.io/downloads.html


function get_latest_tfver() {
  terraform -v | sed -n 's/^is \(\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}\)\(.*\)/\1/p'
}

function getarch() {
  arch | grep x86_64 >/dev/null && echo "amd64" || arch
}

function updatetf() {
  latestver=$(get_latest_tfver)
  arch=$(getarch)
  curl -SsL -o /tmp/terraform_${latestver}_linux_${arch}.zip https://releases.hashicorp.com/terraform/${latestver}/terraform_${latestver}_linux_${arch}.zip
  sudo unzip /tmp/terraform_${latestver}_linux_${arch}.zip
  sudo mv /tmp/terraform /usr/local/bin/terraform
  rm /tmp/terraform_${latestver}_linux_${arch}.zip
}

terraform -v | grep 'out of date' && updatetf || echo "version of terraform is latest"
