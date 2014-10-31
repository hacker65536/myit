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
