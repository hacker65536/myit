

##require 

[install jq](https://github.com/hacker65536/myit/blob/master/javascript/jq.md)  
need IAMrole for ontrol EBS



##attach ebs

```bash
ebssize=20
thisAz=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.availabilityZone'| tr -d '\"')
thisReg=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.region' | tr -d '\"')
thisId=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq '.instanceId'|tr -d '"')
vid=$(aws ec2 create-volume --size ${ebssize} --volume-type gp2 --availability-zone ${thisAz} --region ${thisReg} | jq '.VolumeId'| tr -d '"')
aws ec2 attach-volume --volume-id ${vid} --instance-id ${thisId} --device /dev/xvdf --region ${thisReg}

sleep 15
```

```bash
lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdf    202:80   0  20G  0 disk
```

###mkfs
```bash
mkfs.ext4 /dev/xvdf
mke2fs 1.42.12 (29-Aug-2014)
Creating filesystem with 5242880 4k blocks and 1310720 inodes
Filesystem UUID: 99f2768f-21e0-40a9-abd5-2667e5205bee
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

###mount
```bash
mkdir /mnt/gitdata
mount /dev/xvdf /mnt/gitdata
```
```bash
df -l
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/xvda1       8123812 1315056   6708508  17% /
devtmpfs          501948      60    501888   1% /dev
tmpfs             510096       0    510096   0% /dev/shm
/dev/xvdf       20511356   44992  19401404   1% /mnt/gitdata
```


##install gitolite

###create user
```bash
useradd gitolite
```

###setup

```bash
sudo -u gitolite -i mkdir bin
sudo -u gitolite -i git clone git://github.com/sitaramc/gitolite
sudo -u gitolite -i gitolite/install -to ~gitolite/bin
```
create sshkey  
```bash
sudo -H -u gitolite sh -c  "ssh-keygen -f /home/gitolite/.ssh/id_rsa -N ''"
sudo -H -u gitolite -i cp ~gitolite/.ssh/id_rsa.pub ~gitolite/gitadmin.pub
```

```bash
sudo -H -u gitolite -i gitolite setup -pk ~gitolite/gitadmin.pub
```

replace directory  
```bash
cp -ar ~gitolite/repositories/ /mnt/gitdata
rm -rf ~gitolite/repositories/
ln -s /mnt/gitdata/repositories ~gitolite/
```

set mount for reboot
```bash
cp /etc/fstab /etc/fstab.org
echo "/dev/xvdf       /mnt/gitdata       ext4    defaults        0       2" >> /etc/fstab
```
```bash
mount -av
/                        : ignored
/dev/shm                 : already mounted
/dev/pts                 : already mounted
/sys                     : already mounted
/proc                    : already mounted
/mnt/gitdata             : already mounted
```

##install git-flow
```bash
cd /usr/local/src
wget --no-check-certificate -q  https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh
sh gitflow-installer.sh
```

##create repository

First time, you edit a config file of repository to using root user on git server.

```bash
echo "host githost
hostname localhost
user gitolite
port 22
identityfile /home/gitolite/.ssh/id_rsa
StrictHostKeyChecking no" >> ~/.ssh/config
chmod 600 ~/.ssh/config
```

clone repository for edit  
```bash
cd 
git clone githost:gitolite-admin
cd gitolite-admin/
```


##install gitweb
```bash
yum install -y httpd24 gitweb
```

config  
```bash
cp /etc/gitweb.conf /etc/gitweb.conf.org
sed -i 's/^#our \$projectroot.*/&\nour \$projectroot="\/home\/gitolite\/repositories";/' /etc/gitweb.conf
```

modify userinfo  
```bash
usermod -a -G gitolite apache
chmod g+rx /home/gitolite/

find /home/gitolite/repositories/ -type f -exec chmod 664 {} \; 
find /home/gitolite/repositories/ -type d -exec chmod 775 {} \;

sed -i 's/0077/0027/' /home/gitolite/.gitolite.rc
sed -i "s/\s\+GIT_CONFIG_KEYS\s\+=>\s\+'/&core.sharedRepository/" /home/gitolite/.gitolite.rc
```

you should do the command after create new repository  

on server
```bash
su - gitolite
cd repositories/newrepo.git/
git config core.sharedRepository group
git update-server-info
chmod -R g+ws hooks
chmod -R g+ws info
chmod -R g+ws objects
chmod -R g+ws refs
exit
```

on conf
```
vim gitolite-admin/conf/gitlite.conf
```

```
repo testing1
    RW+     =   @all
config core.sharedRepository = 0660 #add this line
```

```bash
git commit -a -m "i"
git push
```


