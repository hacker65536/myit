#!/bin/bash



#------------------------------
#       config
#------------------------------

#terminate  when comands failed
set -e

#for seq
FILEID="mkpasswd -s 0 -l 8"
ID=$$

#output response from aws API
LOGDIR="/tmp/vpc${ID}"


REGION="us-west-1"


SGLIST="admin bastion officialweb mail app redis mysql memcache elb nat"

CIDR='10.0.0.0/16'


#declare -A REGIONS
AZS=()
declare -A SUBNETIDS
declare -A SGIDS
declare -A NICS
declare -A NICIDS
declare -A ROUTETABLEID
declare -A ALLOCATIONIDS
declare -A ASSOCIATIONIDS



if [ ! -e ${LOGDIR} ]
then

  mkdir ${LOGDIR}

else

  echo "directory already existed"
  exit 1
fi

function yesorno(){

  local res
  echo -en "do you want create a VPC in this region?  [y or n] > "
  #PS3="Sure ? [y/N] > "
  while :
  do
    read res
    case $res in
      y )
        #echo "YES"
        break 2
      ;;
      n )
        break
      ;;
      q )
        echo "Exit"
        exit 0
      ;;
      * )
        #echo "??"
        break
      ;;
    esac
  done
  #echo "in yesorno"
  #  if [ $res = "y" ];then
  #    break 1
  #  fi

}
function progress(){
  #disappear cursor
  echo -ne '\E[?25l'

  local SPINER=("/" "-" "\\" "|")
  local i=0
  local j=0

  #save cursor position
  tput sc
  #check pid exists
  while [ -x /proc/$1 ]
  #while  :
  do
    echo -en "waiting for response.. \033[35m[${SPINER[$i]}]\033[0m"
    i=$(($i + 1))
    j=$(($j + 1))
    if [ $i = 4 ];then
      i=0
    fi
    #restore cursor
    tput rc
    usleep 25000
  done

  #erase line
  tput el
  echo -en "\033[33m[respond]\033[0m\n"
  #appear cursor
  echo -en "\E[?25h"

}

function trimdoublequote(){
  local str=$@
  str=`echo -en "${str//\"}"`
  echo -en "$str"
}
pcnt=1
function processingmsg(){

  local title=$1
  #echo -en "\n"
  echo -en "\033[34mNo.${pcnt}\033[0m\n"
  echo -en "\033[34m========$title========\033[0m\n"
  # echo -en "\n"

  if [ $# -eq 1 ];then
    echo
  else
    local key=$2
    local value=$3
    echo -en "\033[1;34m$key\033[0m : \033[32m$value\033[0m\n"
  fi
  echo -en "\n\n"
  pcnt=$((${pcnt} + 1))
}
pcnt2=1
function processingmsgsub(){

  local title=$1
  local key=$2
  local value=$3
  #  echo -en ""
  echo -en "\033[34m${pcnt}-${pcnt2}\033[0m\n"
  echo -en "\033[34m------$title-------\033[0m\n"
  # echo -en "\n"
  echo -en "\033[1;34m$key\033[0m : \033[32m$value\033[0m\n"
  echo -en "\n\n"
  pcnt2=$((${pcnt2} + 1))
}


#--------------prepare process-------------

PS3="please select from list > "


function ec2_describe_regions(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"

  aws ec2 describe-regions --region ${REGION} > $log &
  progress "$!"

  echo $log
  #
  #  local j=0
  #  echo -en "\n\n"
  #  echo "---------select from list fellow------"
  #  for i in ${regions[@]}
  #  do
  #
  #    echo -en "[$j]. $i \t\t ${REGIONS[$i]}\n"
  #    j=$(($j + 1))
  #  done
  #  read region
  #  REGION=${regions[$region]}


}

#ec2_describe_regions
#echo $REGION
#exit 0

function selectregion(){

  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"

  aws ec2 describe-regions --region ${REGION} > $log &
  progress "$!"
  local region
  local regions=`cat $log | jq '.Regions |sort|.[] .RegionName'`

  regions=`echo -en "${regions//\"}"`
  regions=`echo -en "${regions//$'\n'/\t}"`
  regions=($regions)
  regions+=('Quit')

  local i
  select i in "${regions[@]}"
  do
    if [ "${REPLY}" = "q" ];then
      echo "Exit"
      exit 0
    fi

    if [ -z "$i" ] ;then
      continue
    fi
    REGION=$i
    case "$i" in
      ap-northeast-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in Tokyo. \n"
        yesorno
      ;;
      ap-southeast-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in Singapore. \n"
        yesorno
      ;;
      ap-southeast-2 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in Sydney. \n"
        yesorno
      ;;
      eu-west-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in Ireland. \n"
        yesorno
      ;;
      sa-east-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in São Paulo. \n"
        yesorno
      ;;
      us-east-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in N.Virginia. \n"
        yesorno
      ;;
      us-west-1 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in N.California. \n"
        yesorno
      ;;
      us-west-2 )
        echo -en "you select \033[32m[${REPLY}] $i\033[0m. Located in Oregon. \n"
        yesorno
      ;;
      Quit )
        echo "Exit"
      exit 0;;
      * )
        echo "unknown region"
      exit 0;;
    esac
  done
  echo -en "then Launch process for create VPC on \033[32m$REGION\033[0m ...\n"

}


selectregion

#-----------create process start--------

#decide availabilityzone
function ec2_describe_availability_zone(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local log="${LOGDIR}/$($FILEID)"
  local azs
  aws ec2 describe-availability-zones --region ${REGION} > $log &
  progress "$!"

  azs=$(cat $log| jq '.AvailabilityZones[] .ZoneName')
  azs=`echo -en "${azs//$'\n'/ }"`
  azs=$(trimdoublequote $azs)
  AZS=($(echo $azs))

  processingmsg "decide AZ" "az" "\"${AZS[0]}\" , \"${AZS[1]}\""

}
ec2_describe_availability_zone



#create-vpc
function ec2_create_vpc(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"

  aws ec2 create-vpc --region ${REGION} --cidr-block 10.0.0.0/16 > $log &
  progress "$!"
  VPCID=$(cat $log | jq '.Vpc .VpcId')
  VPCID=$(trimdoublequote $VPCID)

  #  echo $VPCID

  processingmsg "create-vpc" "vpc-id" "$VPCID"


}
ec2_create_vpc


#getroutetableid

function ec2_describle_route_table(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local log="${LOGDIR}/$($FILEID)"
  aws ec2 describe-route-tables --region ${REGION} --filters "Name=vpc-id,Values=${VPCID}" > $log &
  progress "$!"
  ROUTETABLEID[0]=`cat $log |jq '.RouteTables[] .RouteTableId'`
  ROUTETABLEID[0]=$(trimdoublequote ${ROUTETABLEID[0]})


  processingmsg "get-route-table-id" "route-table-id" "${ROUTETABLEID[0]}"
}
ec2_describle_route_table



#create subnet

function ec2_create_subnet(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local log
  local i
  pcnt2=1
  processingmsg "create subnet"
  pcnt=$((${pcnt} - 1))
  for i in `seq 0 7`
  do

    log="${LOGDIR}/$($FILEID)"
    aws ec2 create-subnet --region ${REGION} --vpc-id ${VPCID} --availability-zone ${AZS[$(($i % 2))]} --cidr-block 10.0.$i.0/24 > $log &
    progress "$!"
    SUBNETIDS[$i]=`cat $log | jq '.Subnet .SubnetId'`
    SUBNETIDS[$i]=$(trimdoublequote ${SUBNETIDS[$i]})
    processingmsgsub "create subnet ${i}" "subnet-id" "${SUBNETIDS[$i]}"


  done
  pcnt=$((${pcnt} + 1))
}
ec2_create_subnet


#create securitygroups


function ec2_create_security_group(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log
  local i
  pcnt2=1
  processingmsg "create securitygroups"
  pcnt=$((${pcnt} - 1))
  for i in ${SGLIST}
  do
    log="${LOGDIR}/$($FILEID)"
    aws ec2 create-security-group  --region ${REGION} --group-name "$i" --description "$i" --vpc-id ${VPCID} > $log &
    progress "$!"
    SGIDS[$i]=`cat $log | jq '.GroupId'`
    SGIDS[$i]=$(trimdoublequote ${SGIDS[$i]})
    processingmsgsub "create securitygroup ${i}" "group-id" "${SGIDS[$i]}"

  done
  pcnt=$((${pcnt} + 1))
}
ec2_create_security_group


function ec2_authorize_security_group_ingress(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local log
  local i
  pcnt2=1
  processingmsg "ingress securitygroups"
  pcnt=$((${pcnt} - 1))
  for i in ${!SGIDS[@]}
  do

    log="${LOGDIR}/$($FILEID)"

    case $i in
      mysql )
        aws ec2 authorize-security-group-ingress --region ${REGION} --protocol tcp --port 3306 --cidr ${CIDR} --group-id ${SGIDS[$i]} > $log &
      ;;
      redis )
        aws ec2 authorize-security-group-ingress --region ${REGION} --protocol tcp --port 6379 --cidr ${CIDR} --group-id ${SGIDS[$i]} > $log &
      ;;
      memcache )
        aws ec2 authorize-security-group-ingress --region ${REGION} --protocol tcp --port 11211 --cidr ${CIDR} --group-id ${SGIDS[$i]} > $log &
      ;;
      officialweb )
        aws ec2 authorize-security-group-ingress --region ${REGION} --ip-permissions officialweb.json --group-id ${SGIDS[$i]} >$log &
      ;;
      admin )
        aws ec2 authorize-security-group-ingress --region ${REGION} --ip-permissions admin.json --group-id ${SGIDS[$i]} >$log &
      ;;
      bastion )
        aws ec2 authorize-security-group-ingress --region ${REGION} --ip-permissions bastion.json --group-id ${SGIDS[$i]} >$log &
      ;;
      elb )
        aws ec2 authorize-security-group-ingress --region ${REGION} --ip-permissions elb.json --group-id ${SGIDS[$i]} >$log &
      ;;
      mail )
        aws ec2 authorize-security-group-ingress --region ${REGION} --ip-permissions mail.json --group-id ${SGIDS[$i]} >$log &
      ;;
      * )
        aws ec2 authorize-security-group-ingress --region ${REGION} --protocol all --cidr ${CIDR} --group-id ${SGIDS[$i]} > $log &
      ;;


    esac
    progress "$!"
    local res=`cat $log |jq '.return'`
    processingmsgsub "modifed security group ${i}" "return" "${res}"

  done

  pcnt=$((${pcnt} + 1))
}

ec2_authorize_security_group_ingress



#create internet-gateway

function ec2_create_internet_gatewary(){

  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"


  aws ec2 create-internet-gateway --region ${REGION} > $log &
  progress "$!"
  IGWID=`cat $log |jq '.InternetGateway .InternetGatewayId'`
  IGWID=$(trimdoublequote ${IGWID})

  processingmsg "create iGW" "InternetGatewayId" "${IGWID}"

}

ec2_create_internet_gatewary

#create route-table

function ec2_create_route_table(){

  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"

  aws ec2 create-route-table --region ${REGION} --vpc-id ${VPCID} > $log &
  progress "$!"
  ROUTETABLEID[1]=`cat $log |jq '.RouteTable .RouteTableId'`
  ROUTETABLEID[1]=$(trimdoublequote ${ROUTETABLEID[1]})

  processingmsg "create route-table" "RouteTableId" "${ROUTETABLEID[1]}"

}

ec2_create_route_table


#attach igw

function ec2_attach_internet_gateway(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"
  aws ec2 attach-internet-gateway --region ${REGION} --internet-gateway-id ${IGWID} --vpc-id ${VPCID} > $log &
  progress "$!"
  local res=`cat $log |jq '.return'`

  processingmsg "attach internet gateway" "return" "${res}"

}

ec2_attach_internet_gateway


#create NIC

NICS[admin]='10.0.0.10 0'
NICS[bastion]='10.0.0.99 0'
NICS[nat]='10.0.0.100 0'
NICS[officialweb]='10.0.0.101 0'
NICS[mail]='10.0.0.201 0'
NICS[www1]='10.0.2.101 2'
NICS[batch1]='10.0.2.201 2'

function ec2_create_network_interface(){

  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  processingmsg "create nic"
  pcnt=$((${pcnt} - 1))
  pcnt2=1
  for i in ${!NICS[@]}
  do
    local log="${LOGDIR}/$($FILEID)"
    local nic=(${NICS[$i]})
    local group
    group=${i//batch1/app}
    group=${group//www1/app}
    aws ec2 create-network-interface --region ${REGION} --subnet-id ${SUBNETIDS[${nic[1]}]} --description ${i} --groups ${SGIDS[${group}]} --private-ip-address ${nic[0]} > $log

    progress "$!"
    NICIDS[$i]=`cat $log |jq '.NetworkInterface .NetworkInterfaceId'`
    NICIDS[$i]=$(trimdoublequote ${NICIDS[$i]})
    processingmsgsub "crate NIC ${i}" "NetworkInterfaceId" "${NICIDS[$i]}"
  done
  pcnt=$((${pcnt} + 1))

}

ec2_create_network_interface

#modify nic for nat

function ec2_modify_network_interface_attribute(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local log="${LOGDIR}/$($FILEID)"


  aws ec2 modify-network-interface-attribute --region ${REGION} --network-interface-id ${NICIDS[nat]} --no-source-dest-check > $log &
  progress "$!"
  local res=`cat $log |jq '.return'`
  processingmsg "modify NIC for nat" "return" "${res}"


}

ec2_modify_network_interface_attribute

#create route

function ec2_create_route(){

  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i

  processingmsg "create route"
  pcnt=$((${pcnt} - 1))
  pcnt2=1

  for i in ${!ROUTETABLEID[@]}
  do

    local log="${LOGDIR}/$($FILEID)"
    if [ $i -eq 0 ];then

      aws ec2 create-route --region ${REGION} --route-table-id ${ROUTETABLEID[$i]} --destination-cidr-block 0.0.0.0/0 --gateway-id ${IGWID} > $log &

    else
      aws ec2 create-route --region ${REGION} --route-table-id ${ROUTETABLEID[$i]} --destination-cidr-block 0.0.0.0/0 --network-interface-id ${NICIDS[nat]} > $log &

    fi

    progress "$!"
    local res=`cat $log |jq '.return'`
    processingmsgsub "create route${i}" "return" "${res}"
  done
  pcnt=$((${pcnt} + 1))
}

ec2_create_route


#associate subnet to route-table
function ec2_associate_route_table(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i
  processingmsg "associate route"
  pcnt=$((${pcnt} - 1))
  pcnt2=1

  for i in `seq 2 3`
  do
    local log="${LOGDIR}/$($FILEID)"
    aws ec2 associate-route-table --region ${REGION} --route-table-id ${ROUTETABLEID[1]} --subnet-id ${SUBNETIDS[$i]} > $log &
    progress "$!"
    local res=`cat $log |jq '.AssociationId'`
    processingmsgsub "associate route subnet[$i]" "AssociationId" "${res}"
  done
  pcnt=$((${pcnt} + 1))

}
ec2_associate_route_table


function ec2_allocate_address(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i
  processingmsg "allocate address"
  pcnt=$((${pcnt} - 1))
  pcnt2=1

  for i in `seq 0 1`
  do
    local log="${LOGDIR}/$($FILEID)"
    aws ec2 allocate-address --region ${REGION} --domain vpc > $log &
    progress "$!"
    local res=`cat $log | jq '.AllocationId + " " + .PublicIp'`
    res=$(trimdoublequote ${res})
    res=($res)
    ALLOCATIONIDS[${res[0]}]=${res[1]}
    processingmsgsub "allocate address" "${res[0]}" "${ALLOCATIONIDS[${res[0]}]}"
  done
  pcnt=$((${pcnt} + 1))

}
ec2_allocate_address

function ec2_associate_address(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i
  processingmsg "associate address"
  pcnt=$((${pcnt} - 1))
  pcnt2=1


  local j=0
  local nic
  for i in ${!ALLOCATIONIDS[@]}
  do
    if [ $j -eq 0 ];then
      nic='nat'
    else
      nic='bastion'
    fi
    local log="${LOGDIR}/$($FILEID)"
    aws ec2 associate-address --region ${REGION} --network-interface-id ${NICIDS[${nic}]} --allocation-id $i > $log &
    progress "$!"
    local res=`cat $log | jq '.AssociationId'`
    res=$(trimdoublequote $res)
    ASSOCIATIONIDS[$j]=$res
    processingmsgsub "associate address" "AssoiationId" "${ASSOCIATIONIDS[${j}]}"
    j=$(($j +1 ))
  done

  pcnt=$((${pcnt} + 1))
}
ec2_associate_address


#create rds-subnet
function rds_create_db_subnet_group(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i
  local name="mysql-subnet"
  local log="${LOGDIR}/$($FILEID)"

  aws rds create-db-subnet-group --region ${REGION} --db-subnet-group-name ${name} --db-subnet-group-description ${name} --subnet-ids "${SUBNETIDS[6]}" "${SUBNETIDS[7]}" > $log

  progress "$!"
  local res=`cat $log| jq '.DBSubnetGroup .SubnetGroupStatus'`
  processingmsg "create db-subnet-group" "SubnetGroupStatus" "${res}"
}
rds_create_db_subnet_group



#create cache-subnet
function elasticache_create_cache_subnet_group(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi
  local i
  local name="redis-subnet"
  local log="${LOGDIR}/$($FILEID)"

  aws elasticache create-cache-subnet-group --region ${REGION} --cache-subnet-group-name ${name} --cache-subnet-group-description ${name} --subnet-ids "${SUBNETIDS[4]}" "${SUBNETIDS[5]}" > $log

  progress "$!"
  local res=`cat $log| jq '.CacheSubnetGroup .CacheSubnetGroupName'`
  processingmsg "create cache-subnet-group" "CacheSubnetGroupName" "${res}"
}
elasticache_create_cache_subnet_group

#----------delete vpc----------------

function ec2_delete_vpc(){
  local flg=1
  if [ $flg -ne 1 ];then
    break
  fi

  local log="${LOGDIR}/$($FILEID)"

  aws ec2 delete-vpc --region ${REGION} --vpc-id ${VPCID}  > $log &

  progress "$!"

  processingmsg "delete-vpc" "vpc-id" ${VPCID}


}

#ec2_delete_vpc
