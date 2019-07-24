# aws disable Hyperthreading 

script
--

` disable_ht.sh`
```bash
#!/bin/env bash

function fix_boot_disable_ht() {

  echo "${0} Updating kernel line"

  if [[ -x /sbin/grubby ]] ; then
      /sbin/grubby --update-kernel=ALL --args=maxcpus=$total_cores
  fi

  if [ -e /etc/default/grub ]; then

      if grep -q maxcpus /etc/default/grub; then
          sed -i "s/maxcpus=[0-9]*/maxcpus=$total_cores/g" /etc/default/grub
      else
          sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/\"$/ maxcpus=$total_cores\"/" /etc/default/grub
          sed -i "/^GRUB_CMDLINE_LINUX=/ s/\"$/ maxcpus=$total_cores\"/" /etc/default/grub
      fi

      if [ -e /etc/grub2.cfg ]; then
          grub2-mkconfig > /etc/grub2.cfg
      fi

      if which update-grub; then
          update-grub
      fi
  fi

}

function disable_ht {
  echo "${0}: disabling HT"

  parent_cores=$(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -d, -f1 | cut -d- -f1 | tr '-' '\n' | tr ',' '\n'| sort -un)

  # If there are no parents, HT is probably already disabled.
  if [ "$parent_cores" == "" ]; then
              parent_cores=$(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list)
  fi

  total_cores=$(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -d, -f1 | cut -d- -f1 | tr '-' '\n' | tr ',' '\n'| sort -un | wc -l)
  sibling_cores=$(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -d, -f2- | cut -d- -f2- | tr '-' '\n' | tr ',' '\n'| sort -un)

  # Ensure enabled cores are enabled - starting at 1, cpu0 can't be changed
  for p in $parent_cores; do
      if [ $p -ne 0 ]; then
          echo 1 > /sys/devices/system/cpu/cpu${p}/online
      fi
  done

  if [ "$parent_cores" == "$sibling_cores" ]; then
      echo "Hyperthreading already disabled"
  else
      # Ensure disabled threads are actually disabled
      for s in $sibling_cores; do
          echo 0 > /sys/devices/system/cpu/cpu${s}/online
      done
  fi

  fix_boot_disable_ht

}

disable_ht
```

for dist like as RHEL7 
--
```console
$ sed -e 's/maxcpus/nr_cpus/g' -i disable_ht.sh
```


show cpu info
--
```console
$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               85
Model name:          Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
Stepping:            3
CPU MHz:             3402.320
BogoMIPS:            6000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            25344K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl
 xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor l
ahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx5
12vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
```

disable ht
--
```console
$ sudo sh disable_ht.sh
disable_ht.sh: disabling HT
disable_ht.sh Updating kernel line
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
Found initrd image: /boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
done
which: no update-grub in (/sbin:/bin:/usr/sbin:/usr/bin)
```

```console
$ lscpu
Architecture:         x86_64
CPU op-mode(s):       32-bit, 64-bit
Byte Order:           Little Endian
CPU(s):               4
On-line CPU(s) list:  0,1
Off-line CPU(s) list: 2,3
Thread(s) per core:   1
Core(s) per socket:   2
Socket(s):            1
NUMA node(s):         1
Vendor ID:            GenuineIntel
CPU family:           6
Model:                85
Model name:           Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
Stepping:             3
CPU MHz:              3404.563
BogoMIPS:             6000.00
Hypervisor vendor:    KVM
Virtualization type:  full
L1d cache:            32K
L1i cache:            32K
L2 cache:             1024K
L3 cache:             25344K
NUMA node0 CPU(s):    0,1
Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
```


reboot
--

```console
$ sudo reboot 
```

```console
$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              2
On-line CPU(s) list: 0,1
Thread(s) per core:  1
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               85
Model name:          Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
Stepping:            3
CPU MHz:             3394.578
BogoMIPS:            6000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            25344K
NUMA node0 CPU(s):   0,1
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
```



ref
--
https://aws.amazon.com/jp/blogs/compute/disabling-intel-hyper-threading-technology-on-amazon-ec2-windows-instances/  
https://dev.classmethod.jp/cloud/aws/how-to-disable-hyperthreading/  
https://d0.awsstatic.com/events/jp/2017/summit/slide/D4T2-5.pdf  
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-devices-system-cpu  
https://askubuntu.com/questions/942728/disable-hyper-threading-in-ubuntu  
https://www.isus.jp/others/insights-to-hyper-threading/  
http://zokibayashi.hatenablog.com/entry/2017/03/02/205414  
https://access.redhat.com/solutions/2463161  
https://github.com/aws-samples/aws-hpc-workshops/issues/6  




old info
==

centos6
-------------
```
[root@ip-172-31-42-125 ~]# cat /etc/centos-release
CentOS release 6.9 (Final)
[root@ip-172-31-42-125 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.074
BogoMIPS:              5800.14
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-7
[root@ip-172-31-42-125 ~]# for cpunum in $(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -s -d, -f2- | tr ',' '\n' | sort -un); do echo 0 > /sys/devices/system/cpu/cpu$cpunum/online; done
[root@ip-172-31-42-125 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-3
Off-line CPU(s) list:  4-7
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.074
BogoMIPS:              5800.14
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-3

[root@ip-172-31-42-125 ~]# grubby --update-kernel=ALL --args=maxcpus=4
[root@ip-172-31-42-125 ~]# grubby --info=ALL
boot=/dev/vda
index=0
kernel=/boot/vmlinuz-2.6.32-696.1.1.el6.x86_64
args="ro rd_NO_LUKS rd_NO_LVM LANG=en_US.UTF-8 rd_NO_MD console=ttyS0,115200 crashkernel=auto SYSFONT=latarcyrheb-sun16  KEYBOARDTYPE=pc KEYTABLE=us rd_NO_DM maxcpus=4"
root=UUID=b48e599f-bd30-4876-9a63-ecd015ba7454
initrd=/boot/initramfs-2.6.32-696.1.1.el6.x86_64.img
[root@ip-172-31-42-125 ~]# reboot

Broadcast message from centos@ip-172-31-42-125.us-east-2.compute.internal
        (/dev/pts/0) at 3:56 ...

The system is going down for reboot NOW!
[root@ip-172-31-42-125 ~]#
Using username "centos".
Authenticating with public key "imported-openssh-key"
Last login: Wed Dec 20 03:53:50 2017 from 202.214.96.1
[centos@ip-172-31-42-125 ~]$ sudo su -
[root@ip-172-31-42-125 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-3
Off-line CPU(s) list:  4-7
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.074
BogoMIPS:              5800.14
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-3
[root@ip-172-31-42-125 ~]#
```


centos7
-------------
```
[centos@ip-172-31-38-205 ~]$ sudo su -
[root@ip-172-31-38-205 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.207
BogoMIPS:              5800.16
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-7
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt
[root@ip-172-31-38-205 ~]# for cpunum in $(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -s -d, -f2- | tr ',' '\n' | sort -un); do echo 0 > /sys/devices/system/cpu/cpu$cpunum/online; done
[root@ip-172-31-38-205 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-3
Off-line CPU(s) list:  4-7
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.207
BogoMIPS:              5800.16
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-3
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt
[root@ip-172-31-38-205 ~]# grubby --update-kernel=ALL --args=maxcpus=4
[root@ip-172-31-38-205 ~]# grubby --info=ALL
index=0
kernel=/boot/vmlinuz-3.10.0-693.5.2.el7.x86_64
args="ro console=tty0 console=ttyS0,115200n8 crashkernel=auto console=ttyS0,115200 LANG=en_US.UTF-8 maxcpus=4"
root=UUID=6f15c206-f516-4ee8-a4b7-89ad880647db
initrd=/boot/initramfs-3.10.0-693.5.2.el7.x86_64.img
title=CentOS Linux (3.10.0-693.5.2.el7.x86_64) 7 (Core)
index=1
kernel=/boot/vmlinuz-0-rescue-f073c429a7456b53ec3e2c53460c5c8f
args="ro console=tty0 console=ttyS0,115200n8 crashkernel=auto console=ttyS0,115200 maxcpus=4"
root=UUID=6f15c206-f516-4ee8-a4b7-89ad880647db
initrd=/boot/initramfs-0-rescue-f073c429a7456b53ec3e2c53460c5c8f.img
title=CentOS Linux (0-rescue-f073c429a7456b53ec3e2c53460c5c8f) 7 (Core)
index=2
non linux entry
[root@ip-172-31-38-205 ~]# reboot
PolicyKit daemon disconnected from the bus.
We are no longer a registered authentication agent.
Using username "centos".
Authenticating with public key "imported-openssh-key"
Last login: Wed Dec 20 04:51:31 2017 from 202.214.96.1
[centos@ip-172-31-38-205 ~]$ sudo su -
Last login: Wed Dec 20 04:51:34 UTC 2017 on pts/0
[root@ip-172-31-38-205 ~]# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2666 v3 @ 2.90GHz
Stepping:              2
CPU MHz:               2900.022
BogoMIPS:              5800.16
Hypervisor vendor:     Xen
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              25600K
NUMA node0 CPU(s):     0-7
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt
```

conclusion
--------------
amzlinuxではcentos6と同じ結果  
grubbyによる書き換えで恒久的な適応が確認取れる

amzlinux2ではcentos7と同じ結果  
grubbyによる書き換えはリセットされている



