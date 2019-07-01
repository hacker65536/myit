#!/user/bin/env bash

function get_latest_tfver() {
  terraform -v | sed -n 's/^is \(\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}\)\(.*\)/\1/p'
}

latestver=$(get_latest_tfver)

echo $latestver

curl -SsL -O https://releases.hashicorp.com/terraform/${latestver}/terraform_${latestver}_linux_amd64.zip
sudo unzip terraform_${latestver}_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
rm terraform_${latestver}_linux_amd64.zip
