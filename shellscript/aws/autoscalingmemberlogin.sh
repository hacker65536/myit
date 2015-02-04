#!/bin/bash

#terminate  when comands failed
set -e

#for seq
#FILEID="mkpasswd -s 0 -l 8"
ID=$$

#output response from aws API
LOG="/tmp/ec2${ID}"

function progress(){
  #disappear cursor
  echo -ne '\E[?25l'

  local SPINER=("/" "-" "\\" "|")
  local i=0
  local j=0

  #save cursor position
  tput sc
  #check pid exists
  while [ -x /proc/"$1" ]
  #while  :
  do
    echo -en "waiting for response.. \033[35m[${SPINER[$i]}]\033[0m"
    i=$((i + 1))
    j=$((j + 1))
    if [ $i = 4 ];then
      i=0
    fi
    #restore cursor
    tput rc
    usleep 25000
  done

  #erase line
  tput el
  #echo -en "\033[33m[respond]\033[0m\n"
  #appear cursor
  echo -en "\E[?25h"

}

PS3="select server from list that you want to connect.  [q]uit> "

function get_srv_list(){
  local flg=1

  if [ $flg -ne 1 ];then
    return
  fi

  local log="${LOG}"

  aws autoscaling describe-auto-scaling-instances --region "$(get_this_region)"  > $log &
  progress "$!"

  local ids=$(jq '.AutoScalingInstances[] .InstanceId' < $log | tr -d '"' | tr "\n" ",")

  aws ec2 describe-instances --region "$(get_this_region)" --filters Name=instance-id,Values="${ids%,}"  > $log &
  progress "$!"

  local ips=($(jq '.Reservations[] .Instances[] .NetworkInterfaces[] .PrivateIpAddress' < $log | tr -d '"'))
  if expr "$1" : '[0-9]*' > /dev/null
  then
  ssh ${ips[$1]}
  exit
  fi
  echo -en "\e[92m${#ips[*]}  servers of app found\e[0m"
  echo

  local i

  select i in "${ips[@]}"
  do
    if [ "${REPLY}" = "q" ]
    then
      exit 0
    fi

    if  expr "${REPLY}" : '[0-9]*' > /dev/null ; then
      break
    fi
  done
  rm $log
  ssh $i
}




get_srv_list $1
