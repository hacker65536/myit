#needed

- jq (to parse the json from api of the aws)
- aws-cli  (aws command line interface)
- aws-apitools-* (clients of api of aws)

#jq
install

```bash
yum install -y git gcc flex bison autoconf automake libtool oniguruma-devel
cd /usr/local/src
git clone https://github.com/stedolan/jq.git
cd jq
autoreconf -i
./configure
make
make install
```

if you have this error message

```bash
checking for bison version... 2.4.1
configure: error: You need bison version 3.0 or greater.
```

change revision and do autoreconf and ./configure again

```bash
git checkout 3e1baf59167d6e7d836ec39d353eec1022331a6d
```

#hostname.sh

/etc/profile.d/hostname.sh  
[hostname.sh](https://github.com/hacker65536/myit/blob/master/aws/hostname.sh)
```bash
#!/bin/bash


#----------------------------
# written by s.hacker
#
#
# 2014/08/15 PM 12:32:45
#----------------------------

hostfile='/tmp/ec2hostname'

if [ -e $hostfile -a -s $hostfile ];then

  export PS1="[\u@$(cat $hostfile) \W]\$ "

else

  id=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document|/usr/local/bin/jq '.instanceId'|tr -d '"')
  region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | /usr/local/bin/jq '.region' | tr -d '"')

  /bin/ping example.com -w 3 >/dev/null 2>&1

  if [ $? -eq 1 ]
  then
    exit 1
  fi

  case "$region" in
    ap-northeast-1)
    reg='jp';;
    ap-southeast-1 )
    reg='sin';;
    ap-southeast-2 )
    reg='syd';;
    eu-west-1 )
    reg='irl';;
    eu-central-1)
    reg='fra';;
    sa-esat-1 )
    reg='sao';;
    us-east-1 )
    reg='vir';;
    us-west-1 )
    reg='cal';;
    us-west-2 )
    reg='ore';;
  esac

  host=$(aws ec2 describe-tags --region "$region" --filters Name=key,Values=Name Name=resource-id,Values="$id" | /usr/local/bin/jq '.Tags[] .Value' | tr -d '"')
  if [ ! -z "$host" ];then
    echo "${reg}-${host}" > $hostfile
    chmod 777 $hostfile
    export PS1="[\u@$(cat $hostfile) \W]\$ "
  fi

fi
```
