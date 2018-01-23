

ENIをattachした時の様子

```
[root@ip-172-31-31-101 ~]# udevadm monitor
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[4316.995248] add      /devices/pci0000:00/0000:00:06.0 (pci)
UDEV  [4316.999083] add      /devices/pci0000:00/0000:00:06.0 (pci)
KERNEL[4317.135582] add      /devices/pci0000:00/0000:00:06.0/net/eth1 (net)
KERNEL[4317.135597] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/rx-0 (queues)
KERNEL[4317.135604] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/rx-1 (queues)
KERNEL[4317.135610] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/tx-0 (queues)
KERNEL[4317.135615] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/tx-1 (queues)
UDEV  [4317.148093] add      /devices/pci0000:00/0000:00:06.0/net/eth1 (net)
UDEV  [4317.149231] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/rx-0 (queues)
UDEV  [4317.149242] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/tx-1 (queues)
UDEV  [4317.149248] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/rx-1 (queues)
UDEV  [4317.150229] add      /devices/pci0000:00/0000:00:06.0/net/eth1/queues/tx-0 (queues)
```
