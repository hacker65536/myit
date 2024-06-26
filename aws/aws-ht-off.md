# disable Hyperthreading (ec2)


cpu inforamtion
--

show cpu
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
CPU MHz:             3396.914
BogoMIPS:            6000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            25344K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
```


show core 
```console
$ find /sys/devices/system/cpu/ -name core_id | sort| xargs -i{} bash -c 'echo {} ; cat {}'
/sys/devices/system/cpu/cpu0/topology/core_id
0
/sys/devices/system/cpu/cpu1/topology/core_id
1
/sys/devices/system/cpu/cpu2/topology/core_id
0
/sys/devices/system/cpu/cpu3/topology/core_id
1
```

show thread_siblings_list
```console
$ find /sys/devices/system/cpu/ -name thread_siblings_list | sort| xargs -i{} bash -c 'echo {} ; cat {}'
/sys/devices/system/cpu/cpu0/topology/thread_siblings_list
0,2
/sys/devices/system/cpu/cpu1/topology/thread_siblings_list
1,3
/sys/devices/system/cpu/cpu2/topology/thread_siblings_list
0,2
/sys/devices/system/cpu/cpu3/topology/thread_siblings_list
1,3
```

show thread_siblings
```console
$ find /sys/devices/system/cpu/ -name thread_siblings | sort| xargs -i{} bash -c 'echo {} ; cat {}'
/sys/devices/system/cpu/cpu0/topology/thread_siblings
5
/sys/devices/system/cpu/cpu1/topology/thread_siblings
a
/sys/devices/system/cpu/cpu2/topology/thread_siblings
5
/sys/devices/system/cpu/cpu3/topology/thread_siblings
a
```

online
```console
$ find /sys/devices/system/cpu/ -name online | sort| xargs -i{} bash -c 'echo {} ; cat {}'
/sys/devices/system/cpu/cpu1/online
1
/sys/devices/system/cpu/cpu2/online
1
/sys/devices/system/cpu/cpu3/online
1
/sys/devices/system/cpu/online
0-3
```

```
 +------------------------+    +-----------------------+
 |                        |    |                       |
 | +--------+  +--------+ |    | +--------+ +--------+ |
 | |        |  |        | |    | |        | |        | |
 | |  cpu0  |  |  cpu2  | |    | |  cpu1  | |  cpu3  | |
 | |        |  |        | |    | |        | |        | |
 | +--------+  +--------+ |    | +--------+ +--------+ |
 |                        |    |                       |
 +------------------------+    +-----------------------+

           core0                        core1
```




grubby
--

```console
$ sudo grubby --info ALL
index=0
kernel=/boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
args="ro  console=tty0 console=ttyS0,115200n8 net.ifnames=0 biosdevname=0 nvme_core.io_timeout=4294967295 rd.emergency=poweroff rd.shell=0"
root=UUID=a1e1011e-e38f-408e-878b-fed395b47ad6
initrd=/boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
title=Amazon Linux 2
index=1
non linux entry
index=2
kernel=/boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
args="ro  console=tty0 console=ttyS0,115200n8 net.ifnames=0 biosdevname=0 nvme_core.io_timeout=4294967295 rd.emergency=poweroff rd.shell=0"
root=UUID=a1e1011e-e38f-408e-878b-fed395b47ad6
initrd=/boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
title=Amazon Linux (4.14.123-111.109.amzn2.x86_64) 2
index=3
non linux entry
index=4
non linux entry
```


disable ht
--



### manually

```console
# for i in 2 3 ;do echo 0 > /sys/devices/system/cpu/cpu${i}/online; done
```

```console
# lscpu | head -10
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
```


reboot then return to a former state

```console
# reboot
```

```console
# lscpu | head -10
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
```


persistent settings 

```console
# grubby --update-kernel ALL --args "maxcpus=2"
```

```console
# grubby --info=ALL
index=0
kernel=/boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
args="ro  console=tty0 console=ttyS0,115200n8 net.ifnames=0 biosdevname=0 nvme_core.io_timeout=4294967295 rd.emergency=poweroff rd.shell=0 maxcpus=2"
root=UUID=a1e1011e-e38f-408e-878b-fed395b47ad6
initrd=/boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
title=Amazon Linux 2
index=1
non linux entry
index=2
kernel=/boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
args="ro  console=tty0 console=ttyS0,115200n8 net.ifnames=0 biosdevname=0 nvme_core.io_timeout=4294967295 rd.emergency=poweroff rd.shell=0 maxcpus=2"
root=UUID=a1e1011e-e38f-408e-878b-fed395b47ad6
initrd=/boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
title=Amazon Linux (4.14.123-111.109.amzn2.x86_64) 2
index=3
non linux entry
index=4
non linux entry
```

```console
# reboot
```

```console
# lscpu | head -10
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
```


but dont working because

https://access.redhat.com/solutions/2463161
> maxcpus kernel parameter is not working as expected as RHEL 7 system still has all CPUs enabled after boot is complete

https://access.redhat.com/errata/RHBA-2015:0509
> Kernel by itself did not enable newly added CPUs, CPUs had to be enabled
manually or systemd had to be rebooted. This update adds an udev rule that
automatically sets CPUs to "online" state after they appear in the system.
(BZ#968811)


need to comment out udev hotplug

```console
# sed -i 's/^\(SUBSYSTEM=="cpu".*TEST=="online".*ATTR{online}="1"\)/#\1/' /usr/lib/udev/rules.d/40-redhat.rules
# dracut -f 
# reboot
```

```console
$ lscpu | head -10
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
```


another way

```console
# grubby --update-kernel ALL --args "nr_cpus=2"
# reboot
```
```console
$ lscpu |head -10
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    2
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
```


### script

`disable_ht.sh`
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



addition
--

change instance type from c5.xlarge to c5.2xlarge


retain 2 core

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
CPU MHz:             3409.070
BogoMIPS:            6000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            25344K
NUMA node0 CPU(s):   0,1
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr                          sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf                          tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsav                         e avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 sm                         ep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsave                         opt xsavec xgetbv1 xsaves ida arat pku ospke
```
```console
$ nproc
2
```
```console
$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
stepping        : 3
microcode       : 0x100014a
cpu MHz         : 3405.186
cache size      : 25344 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds
bogomips        : 6000.00
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
stepping        : 3
microcode       : 0x100014a
cpu MHz         : 3401.335
cache size      : 25344 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds
bogomips        : 6000.00
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:
```


reset core

remove `nr_core=2` from /etc/default/grub
```console
# vim /etc/default/grub
```
```console
# grub2-mkconfig > /etc/grub2.cfg
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.14.123-111.109.amzn2.x86_64
Found initrd image: /boot/initramfs-4.14.123-111.109.amzn2.x86_64.img
done
```

```console
# reboot
```

```console
$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  2
Core(s) per socket:  4
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               85
Model name:          Intel(R) Xeon(R) Platinum 8124M CPU @ 3.00GHz
Stepping:            3
CPU MHz:             3404.026
BogoMIPS:            6000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            25344K
NUMA node0 CPU(s):   0-7
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
```
```console
$ nproc
8
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
