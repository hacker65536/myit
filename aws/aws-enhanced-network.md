

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html




- Intel 82599 Virtual Function (VF) interface
  - C3, C4, D2, I2, R3, and M4 (excluding m4.16xlarge)
- Elastic Network Adapter (ENA)
  - C5, F1, G3, H1, I3, M5, P2, P3, R4, X1, and m4.16xlarge
  
  

## c4
```
[centos@ip-172-31-2-23 ~]$ cat /etc/centos-release
CentOS Linux release 7.4.1708 (Core)

[centos@ip-172-31-2-23 ~]$ cat /proc/version
Linux version 3.10.0-693.5.2.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-16) (GCC) ) #1 SMP Fri Oct 20 20:32:50 UTC 2017

[centos@ip-172-31-2-23 ~]$ curl http://169.254.169.254/latest/meta-data/instance-type;echo
c4.xlarge
```

both installed
```
[centos@ip-172-31-2-23 ~]$ modinfo ixgbevf
filename:       /lib/modules/3.10.0-693.5.2.el7.x86_64/kernel/drivers/net/ethernet/intel/ixgbevf/ixgbevf.ko.xz
version:        3.2.2-k-rh7.4
license:        GPL
description:    Intel(R) 10 Gigabit Virtual Function Network Driver
author:         Intel Corporation, <linux.nics@intel.com>
rhelversion:    7.4
srcversion:     45F26A06C9B8C3202EA1ADC
alias:          pci:v00008086d000015C5sv*sd*bc*sc*i*
alias:          pci:v00008086d000015A9sv*sd*bc*sc*i*
alias:          pci:v00008086d000015A8sv*sd*bc*sc*i*
alias:          pci:v00008086d00001564sv*sd*bc*sc*i*
alias:          pci:v00008086d00001565sv*sd*bc*sc*i*
alias:          pci:v00008086d00001530sv*sd*bc*sc*i*
alias:          pci:v00008086d00001515sv*sd*bc*sc*i*
alias:          pci:v00008086d0000152Esv*sd*bc*sc*i*
alias:          pci:v00008086d000010EDsv*sd*bc*sc*i*
depends:
intree:         Y
vermagic:       3.10.0-693.5.2.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        C7:57:A9:FB:BD:0D:82:C9:E5:40:52:02:9A:09:08:D1:7C:F1:AD:C7
sig_hashalgo:   sha256
parm:           debug:Debug level (0=none,...,16=all) (int)

[centos@ip-172-31-2-23 ~]$ modinfo ena
filename:       /lib/modules/3.10.0-693.5.2.el7.x86_64/kernel/drivers/net/ethernet/amazon/ena/ena.ko.xz
version:        1.0.2
license:        GPL
description:    Elastic Network Adapter (ENA)
author:         Amazon.com, Inc. or its affiliates
rhelversion:    7.4
srcversion:     0ADEBA934369F8D450E5CE4
alias:          pci:v00001D0Fd0000EC21sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd0000EC20sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd00001EC2sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd00000EC2sv*sd*bc*sc*i*
depends:
intree:         Y
vermagic:       3.10.0-693.5.2.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        C7:57:A9:FB:BD:0D:82:C9:E5:40:52:02:9A:09:08:D1:7C:F1:AD:C7
sig_hashalgo:   sha256
parm:           debug:Debug level (0=none,...,16=all) (int)
```

```bash
[centos@ip-172-31-2-23 ~]$  curl http://169.254.169.254/latest/meta-data/instance-id;echo
i-01c08f90ecaac51ac
```
```
$ instance_id=i-01c08f90ecaac51ac
$ aws --region us-west-2 ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].EnaSupport'
[
    true
]

$ aws --region us-west-2 ec2 describe-instance-attribute --instance-id $instance_id --attribute sriovNetSupport
{
    "InstanceId": "i-01c08f90ecaac51ac",
    "SriovNetSupport": {
        "Value": "simple"
    }
}
```


```bash
[centos@ip-172-31-2-23 ~]$ ip a show dynamic
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:aa:57:92:1d:5a brd ff:ff:ff:ff:ff:ff
    inet 172.31.2.23/20 brd 172.31.15.255 scope global dynamic ens3
       valid_lft 2920sec preferred_lft 2920sec
```

```
[centos@ip-172-31-2-23 ~]$ ethtool -i ens3
driver: ixgbevf
version: 3.2.2-k-rh7.4
firmware-version:
expansion-rom-version:
bus-info: 0000:00:03.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no

[centos@ip-172-31-2-23 ~]$ ethtool ens3
Settings for ens3:
        Supported ports: [ ]
        Supported link modes:   10000baseT/Full
        Supported pause frame use: No
        Supports auto-negotiation: No
        Advertised link modes:  Not reported
        Advertised pause frame use: No
        Advertised auto-negotiation: No
        Speed: 10000Mb/s
        Duplex: Full
        Port: Other
        PHYAD: 0
        Transceiver: Unknown!
        Auto-negotiation: off
Cannot get wake-on-lan settings: Operation not permitted
        Current message level: 0x00000007 (7)
                               drv probe link
        Link detected: yes
```

```
[centos@ip-172-31-2-23 ~]$ egrep "CPU|ens" /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 74:      11969       3936          0          0  xen-pirq-msi-x     ens3-TxRx-0
 75:        144      13929          0          0  xen-pirq-msi-x     ens3-TxRx-1
 76:         23          0         15          0  xen-pirq-msi-x     ens3
```



## c5
```
[centos@ip-172-31-8-163 ~]$ cat /etc/centos-release
CentOS Linux release 7.4.1708 (Core)

[centos@ip-172-31-8-163 ~]$ cat /proc/version
Linux version 3.10.0-693.5.2.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-16) (GCC) ) #1 SMP Fri Oct 20 20:32:50 UTC 2017

[centos@ip-172-31-8-163 ~]$ curl http://169.254.169.254/latest/meta-data/instance-type;echo
c5.xlarge
```

```
[centos@ip-172-31-8-163 ~]$ modinfo ixgbevf
filename:       /lib/modules/3.10.0-693.5.2.el7.x86_64/kernel/drivers/net/ethernet/intel/ixgbevf/ixgbevf.ko.xz
version:        3.2.2-k-rh7.4
license:        GPL
description:    Intel(R) 10 Gigabit Virtual Function Network Driver
author:         Intel Corporation, <linux.nics@intel.com>
rhelversion:    7.4
srcversion:     45F26A06C9B8C3202EA1ADC
alias:          pci:v00008086d000015C5sv*sd*bc*sc*i*
alias:          pci:v00008086d000015A9sv*sd*bc*sc*i*
alias:          pci:v00008086d000015A8sv*sd*bc*sc*i*
alias:          pci:v00008086d00001564sv*sd*bc*sc*i*
alias:          pci:v00008086d00001565sv*sd*bc*sc*i*
alias:          pci:v00008086d00001530sv*sd*bc*sc*i*
alias:          pci:v00008086d00001515sv*sd*bc*sc*i*
alias:          pci:v00008086d0000152Esv*sd*bc*sc*i*
alias:          pci:v00008086d000010EDsv*sd*bc*sc*i*
depends:
intree:         Y
vermagic:       3.10.0-693.5.2.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        C7:57:A9:FB:BD:0D:82:C9:E5:40:52:02:9A:09:08:D1:7C:F1:AD:C7
sig_hashalgo:   sha256
parm:           debug:Debug level (0=none,...,16=all) (int)

[centos@ip-172-31-8-163 ~]$ modinfo ena
filename:       /lib/modules/3.10.0-693.5.2.el7.x86_64/kernel/drivers/net/ethernet/amazon/ena/ena.ko.xz
version:        1.0.2
license:        GPL
description:    Elastic Network Adapter (ENA)
author:         Amazon.com, Inc. or its affiliates
rhelversion:    7.4
srcversion:     0ADEBA934369F8D450E5CE4
alias:          pci:v00001D0Fd0000EC21sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd0000EC20sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd00001EC2sv*sd*bc*sc*i*
alias:          pci:v00001D0Fd00000EC2sv*sd*bc*sc*i*
depends:
intree:         Y
vermagic:       3.10.0-693.5.2.el7.x86_64 SMP mod_unload modversions
signer:         CentOS Linux kernel signing key
sig_key:        C7:57:A9:FB:BD:0D:82:C9:E5:40:52:02:9A:09:08:D1:7C:F1:AD:C7
sig_hashalgo:   sha256
parm:           debug:Debug level (0=none,...,16=all) (int)
```

```
[centos@ip-172-31-8-163 ~]$ curl http://169.254.169.254/latest/meta-data/instance-id;echo
i-03f8bc30a0f1f326e

$ instance_id=i-03f8bc30a0f1f326e
$ aws --region us-west-2 ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].EnaSupport'
[
    true
]

$ aws --region us-west-2 ec2 describe-instance-attribute --instance-id $instance_id --attribute sriovNetSupport
{
    "InstanceId": "i-03f8bc30a0f1f326e",
    "SriovNetSupport": {
        "Value": "simple"
    }
}
```


```
[centos@ip-172-31-8-163 ~]$ ip a show dynamic
2: ens5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP qlen 1000
    link/ether 0a:04:44:2b:12:68 brd ff:ff:ff:ff:ff:ff
    inet 172.31.8.163/20 brd 172.31.15.255 scope global dynamic ens5
       valid_lft 2444sec preferred_lft 2444sec
```

```
[centos@ip-172-31-8-163 ~]$ ethtool -i ens5
driver: ena
version: 1.0.2
firmware-version:
expansion-rom-version:
bus-info: 0000:00:05.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

[centos@ip-172-31-8-163 ~]$ ethtool ens5
ethtool ens5
Settings for ens5:
Cannot get device settings: Operation not permitted
Cannot get wake-on-lan settings: Operation not permitted
        Current message level: 0x000004e3 (1251)
                               drv probe ifup rx_err tx_err tx_done
        Link detected: yes
```

```
[centos@ip-172-31-8-163 ~]$ egrep "CPU|ens" /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 27:        176     279190          0          0   PCI-MSI-edge      ens5-Tx-Rx-0
 28:         39          0     277587          0   PCI-MSI-edge      ens5-Tx-Rx-1
 29:         33          0          0     404165   PCI-MSI-edge      ens5-Tx-Rx-2
 30:     492057          0          0          0   PCI-MSI-edge      ens5-Tx-Rx-3
```


## change type
```
[centos@ip-172-31-8-163 ~]$ curl http://169.254.169.254/latest/meta-data/instance-type;echo
c4.xlarge
[centos@ip-172-31-8-163 ~]$ ethtool -i ens5
driver: ixgbevf
version: 3.2.2-k-rh7.4
firmware-version:
expansion-rom-version:
bus-info: 0000:00:03.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no
[centos@ip-172-31-8-163 ~]$ egrep "CPU|ens" /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 74:        291          0          0          0  xen-pirq-msi-x     ens5-TxRx-0
 75:        193        155          0          0  xen-pirq-msi-x     ens5-TxRx-1
 76:         34          0          0          0  xen-pirq-msi-x     ens5
```


```
[centos@ip-172-31-2-23 ~]$ curl http://169.254.169.254/latest/meta-data/instance-type;echo
c5.xlarge
[centos@ip-172-31-2-23 ~]$ ethtool -i ens3
driver: ena
version: 1.0.2
firmware-version:
expansion-rom-version:
bus-info: 0000:00:05.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no
[centos@ip-172-31-2-23 ~]$ egrep "CPU|ens" /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 27:        193         40          0          0   PCI-MSI-edge      ens3-Tx-Rx-0
 28:         46          0        139          0   PCI-MSI-edge      ens3-Tx-Rx-1
 29:         23          0          0         15   PCI-MSI-edge      ens3-Tx-Rx-2
 30:        223          0          0          0   PCI-MSI-edge      ens3-Tx-Rx-3
```
