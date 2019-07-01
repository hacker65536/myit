#!/user/bin/env bash

function get_latest_tfver() {
  terraform -v | sed -n 's/^is \(\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}\)\(.*\)/\1/p'
}

function getarch() {
  arch | grep x86_64 >/dev/null && echo "amd64" || arch
}

function updatetf() {
  latestver=$(get_latest_tfver)
  arch=$(getarch)
  curl -SsL -O https://releases.hashicorp.com/terraform/${latestver}/terraform_${latestver}_linux_${arch}.zip
  sudo unzip terraform_${latestver}_linux_${arch}.zip
  sudo mv terraform /usr/local/bin/terraform
  rm terraform_${latestver}_linux_${arch}.zip
}

terraform -v | grep 'out of date' && updatetf || echo "version of terraform is latest"
