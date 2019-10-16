# firecracker



getting started with firecracker
--

https://github.com/firecracker-microvm/firecracker/blob/master/docs/getting-started.md



- `ubuntu`+`i3.metal`


check system
```bash
 err="";
    [ "$(uname) $(uname -m)" = "Linux x86_64" ]  \
      || [ "$(uname) $(uname -m)" = "Linux aarch64" ] \
      || err="ERROR: your system is not Linux x86_64 or Linux aarch64."; \
    [ -r /dev/kvm ] && [ -w /dev/kvm ] \
      || err="$err\nERROR: /dev/kvm is innaccessible."; \
    (( $(uname -r | cut -d. -f1)*1000 + $(uname -r | cut -d. -f2) >= 4014 )) \
      || err="$err\nERROR: your kernel version ($(uname -r)) is too old."; \
    dmesg | grep -i "hypervisor detected" \
      && echo "WARNING: you are running in a virtual machine." \
      && echo "Firecracker is not well tested under nested virtualization."; \
    [ -z "$err" ] && echo "Your system looks ready for Firecracker!" || echo -e "$err"
```

```console
$ bash check.sh
Your system looks ready for Firecracker!
```

grant read/write access to KVM
```console
$ sudo setfacl -m u:${USER}:rw /dev/kvm
```


down load binary
```console
$ latest=0.19.0
$ curl -LOJ https://github.com/firecracker-microvm/firecracker/releases/download/v${latest}/firecracker-v${latest}
$ mv firecracker-v${latest} firecracker
$ chmod +x firecracker
```

```console
$ ll firecracker
-rwxrwxr-x 1 ubuntu ubuntu 3265752 Oct 16 01:33 firecracker*
```


start firecracker
```console
$ ./firecracker --api-sock /tmp/firecracker.socket
```


ops from second terminal


get the kernel and rootfs

```bash
  arch=`uname -m`
  dest_kernel="hello-vmlinux.bin"
  dest_rootfs="hello-rootfs.ext4"
  image_bucket_url="https://s3.amazonaws.com/spec.ccfc.min/img"

  if [ ${arch} = "x86_64" ]; then
          kernel="${image_bucket_url}/hello/kernel/hello-vmlinux.bin"
          rootfs="${image_bucket_url}/hello/fsfiles/hello-rootfs.ext4"
  elif [ ${arch} = "aarch64" ]; then
          kernel="${image_bucket_url}/aarch64/ubuntu_with_ssh/kernel/vmlinux.bin"
          rootfs="${image_bucket_url}/aarch64/ubuntu_with_ssh/fsfiles/xenial.rootfs.ext4"
  else
          echo "Cannot run firecracker on $arch architecture!"
          exit 1
  fi

  echo "Downloading $kernel..."
  curl -fsSL -o $dest_kernel $kernel

  echo "Downloading $rootfs..."
  curl -fsSL -o $dest_rootfs $rootfs

  echo "Saved kernel file to $dest_kernel and root block device to $dest_rootfs."
```

```console
$ bash get-kernel-rootfs.sh
Downloading https://s3.amazonaws.com/spec.ccfc.min/img/hello/kernel/hello-vmlinux.bin...
Downloading https://s3.amazonaws.com/spec.ccfc.min/img/hello/fsfiles/hello-rootfs.ext4...
Saved kernel file to hello-vmlinux.bin and root block device to hello-rootfs.ext4.
```

set the guset kernel

```bash
  arch=`uname -m`
  kernel_path="hello-vmlinux.bin"

  if [ ${arch} = "x86_64" ]; then
    curl --unix-socket /tmp/firecracker.socket -i \
        -X PUT 'http://localhost/boot-source'   \
        -H 'Accept: application/json'           \
        -H 'Content-Type: application/json'     \
        -d "{
              \"kernel_image_path\": \"${kernel_path}\",
              \"boot_args\": \"console=ttyS0 reboot=k panic=1 pci=off\"
         }"
  elif [ ${arch} = "aarch64" ]; then
      curl --unix-socket /tmp/firecracker.socket -i \
        -X PUT 'http://localhost/boot-source'   \
        -H 'Accept: application/json'           \
        -H 'Content-Type: application/json'     \
        -d "{
              \"kernel_image_path\": \"${kernel_path}\",
              \"boot_args\": \"keep_bootcon console=ttyS0 reboot=k panic=1 pci=off\"
         }"
  else
      echo "Cannot run firecracker on $arch architecture!"
      exit 1
  fi
```

```console
$ bash setguestkernel.sh
HTTP/1.1 204 No Content
Date: Wed, 16 Oct 2019 01:40:31 GMT
```

set the guest rootfs
```bash
  rootfs_path="hello-rootfs.ext4"
  curl --unix-socket /tmp/firecracker.socket -i \
    -X PUT 'http://localhost/drives/rootfs' \
    -H 'Accept: application/json'           \
    -H 'Content-Type: application/json'     \
    -d "{
          \"drive_id\": \"rootfs\",
          \"path_on_host\": \"${rootfs_path}\",
          \"is_root_device\": true,
          \"is_read_only\": false
     }"
```

```console
$ bash setguestrootfs.sh
HTTP/1.1 204 No Content
Date: Wed, 16 Oct 2019 01:41:32 GMT
```



```
[    0.000000] Linux version 4.14.55-84.37.amzn2.x86_64 (mockbuild@ip-10-0-1-79) (gcc version 7.3.1 20180303 (Red Hat 7.3.1-5) (GCC)) #1 SMP Wed Jul 25 18:47:15 UTC 2018
[    0.000000] Command line: console=ttyS0 reboot=k panic=1 pci=off root=/dev/vda rw virtio_mmio.device=4K@0xd0000000:5
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000007ffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: KVM
[    0.000000] tsc: Using PIT calibration value
[    0.000000] e820: last_pfn = 0x8000 max_arch_pfn = 0x400000000
[    0.000000] MTRR: Disabled
[    0.000000] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.000000] CPU MTRRs all blank - virtualized system.
[    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC
[    0.000000] found SMP MP-table at [mem 0x0009fc00-0x0009fc0f] mapped at [ffffffffff200c00]
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] Using GB pages for direct mapping
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x07fde000-0x07ffffff]
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr 0:7fdc001, primary cpu clock
[    0.000000] kvm-clock: using sched offset of 287920306496 cycles
[    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x0000000007ffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000007ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000007ffffff]
[    0.000000] Intel MultiProcessor Specification v1.4
[    0.000000] MPTABLE: OEM ID: FC
[    0.000000] MPTABLE: Product ID: 000000000000
[    0.000000] MPTABLE: APIC at: 0xFEE00000
[    0.000000] Processor #0 (Bootup-CPU)
[    0.000000] IOAPIC[0]: apic_id 2, version 17, address 0xfec00000, GSI 0-23
[    0.000000] Processors: 1
[    0.000000] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.000000] e820: [mem 0x08000000-0xffffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on KVM
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] random: get_random_bytes called from start_kernel+0x94/0x486 with crng_init=0
[    0.000000] setup_percpu: NR_CPUS:128 nr_cpumask_bits:128 nr_cpu_ids:1 nr_node_ids:1
[    0.000000] percpu: Embedded 41 pages/cpu @ffff880007c00000 s128728 r8192 d31016 u2097152
[    0.000000] KVM setup async PF for cpu 0
[    0.000000] kvm-stealtime: cpu 0, msr 7c15040
[    0.000000] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32137
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: console=ttyS0 reboot=k panic=1 pci=off root=/dev/vda rw virtio_mmio.device=4K@0xd0000000:5
[    0.000000] PID hash table entries: 512 (order: 0, 4096 bytes)
[    0.000000] Memory: 111064K/130680K available (8204K kernel code, 622K rwdata, 1464K rodata, 1268K init, 2820K bss, 19616K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Kernel/User page tables isolation: enabled
[    0.004000] Hierarchical RCU implementation.
[    0.004000]  RCU restricting CPUs from NR_CPUS=128 to nr_cpu_ids=1.
[    0.004000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.004000] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
[    0.004000] Console: colour dummy device 80x25
[    0.004000] console [ttyS0] enabled
[    0.004000] tsc: Detected 2300.014 MHz processor
[    0.004000] Calibrating delay loop (skipped) preset value.. 4600.02 BogoMIPS (lpj=9200056)
[    0.004000] pid_max: default: 32768 minimum: 301
[    0.004000] Security Framework initialized
[    0.004000] SELinux:  Initializing.
[    0.004000] Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.004070] Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.005069] Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
[    0.006033] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes)
[    0.008364] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.009167] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.010044] Spectre V2 : Mitigation: Full generic retpoline
[    0.010860] Speculative Store Bypass: Vulnerable
[    0.022723] Freeing SMP alternatives memory: 28K
[    0.024447] smpboot: Max logical packages: 1
[    0.025389] x2apic enabled
[    0.026136] Switched APIC routing to physical x2apic.
[    0.028314] ..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
[    0.029248] smpboot: CPU0: Intel(R) Xeon(R) Processor @ 2.30GHz (family: 0x6, model: 0x4f, stepping: 0x1)
[    0.030747] Performance Events: unsupported p6 CPU model 79 no PMU driver, software events only.
[    0.032000] Hierarchical SRCU implementation.
[    0.032000] smp: Bringing up secondary CPUs ...
[    0.032005] smp: Brought up 1 node, 1 CPU
[    0.032610] smpboot: Total of 1 processors activated (4600.02 BogoMIPS)
[    0.033964] devtmpfs: initialized
[    0.034523] x86/mm: Memory block size: 128MB
[    0.035329] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.036008] futex hash table entries: 256 (order: 2, 16384 bytes)
[    0.037123] NET: Registered protocol family 16
[    0.037946] cpuidle: using governor ladder
[    0.038573] cpuidle: using governor menu
[    0.043013] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.044007] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.045188] dmi: Firmware registration failed.
[    0.045947] NetLabel: Initializing
[    0.046473] NetLabel:  domain hash size = 128
[    0.047131] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.048010] NetLabel:  unlabeled traffic allowed by default
[    0.048976] clocksource: Switched to clocksource kvm-clock
[    0.049819] VFS: Disk quotas dquot_6.6.0
[    0.050425] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.052846] NET: Registered protocol family 2
[    0.053625] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.054657] TCP bind hash table entries: 1024 (order: 2, 16384 bytes)
[    0.055597] TCP: Hash tables configured (established 1024 bind 1024)
[    0.056578] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    0.057442] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    0.058387] NET: Registered protocol family 1
[    0.059711] virtio-mmio: Registering device virtio-mmio.0 at 0xd0000000-0xd0000fff, IRQ 5.
[    0.060979] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.062236] Scanning for low memory corruption every 60 seconds
[    0.063267] audit: initializing netlink subsys (disabled)
[    0.064372] Initialise system trusted keyrings
[    0.065040] Key type blacklist registered
[    0.065674] audit: type=2000 audit(1571190124.632:1): state=initialized audit_enabled=0 res=1
[    0.066960] workingset: timestamp_bits=36 max_order=15 bucket_order=0
[    0.069161] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.072610] Key type asymmetric registered
[    0.073229] Asymmetric key parser 'x509' registered
[    0.073978] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
[    0.075113] io scheduler noop registered (default)
[    0.075885] io scheduler cfq registered
[    0.076640] virtio-mmio virtio-mmio.0: Failed to enable 64-bit or 32-bit DMA.  Trying to continue, but this might not work.
[    0.078416] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
[    0.101381] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a U6_16550A
[    0.104168] loop: module loaded
[    0.105256] tun: Universal TUN/TAP device driver, 1.6
[    0.106079] hidraw: raw HID events driver (C) Jiri Kosina
[    0.106940] nf_conntrack version 0.5.0 (1024 buckets, 4096 max)
[    0.107945] ip_tables: (C) 2000-2006 Netfilter Core Team
[    0.108808] Initializing XFRM netlink socket
[    0.109533] NET: Registered protocol family 10
[    0.110621] Segment Routing with IPv6
[    0.111201] NET: Registered protocol family 17
[    0.111891] Bridge firewalling registered
[    0.112572] sched_clock: Marking stable (112502328, 0)->(201460398, -88958070)
[    0.113813] registered taskstats version 1
[    0.114431] Loading compiled-in X.509 certificates
[    0.115928] Loaded X.509 cert 'Build time autogenerated kernel key: 3472798b31ba23b86c1c5c7236c9c91723ae5ee9'
[    0.117447] zswap: default zpool zbud not available
[    0.118180] zswap: pool creation failed
[    0.118877] Key type encrypted registered
[    0.120543] EXT4-fs (vda): mounted filesystem with ordered data mode. Opts: (null)
[    0.121674] VFS: Mounted root (ext4 filesystem) on device 254:0.
[    0.122824] devtmpfs: mounted
[    0.124062] Freeing unused kernel memory: 1268K
[    0.128043] Write protecting the kernel read-only data: 12288k
[    0.130113] Freeing unused kernel memory: 2016K
[    0.132354] Freeing unused kernel memory: 584K
OpenRC init version 0.35.5.87b1ff59c1 starting
Starting sysinit runlevel

   OpenRC 0.35.5.87b1ff59c1 is starting up Linux 4.14.55-84.37.amzn2.x86_64 (x86_64)

 * Mounting /proc ...
 [ ok ]
 * Mounting /run ...
 * /run/openrc: creating directory
 * /run/lock: creating directory
 * /run/lock: correcting owner
 * Caching service dependencies ...
Service `hwdrivers' needs non existent service `dev'
 [ ok ]
Starting boot runlevel
 * Remounting devtmpfs on /dev ...
 [ ok ]
 * Mounting /dev/mqueue ...
 [ ok ]
 * Mounting /dev/pts ...
 [ ok ]
 * Mounting /dev/shm ...
 [ ok ]
 * Setting hostname ...
 [ ok ]
 * Checking local filesystems  ...
 [ ok ]
 * Remounting filesystems ...
 [ ok ][    0.278215] random: fast init done

 * Mounting local filesystems ...
 [ ok ]
 * Loading modules ...
modprobe: can't change directory to '/lib/modules': No such file or directory
modprobe: can't change directory to '/lib/modules': No such file or directory
 [ ok ]
 * Mounting misc binary format filesystem ...
 [ ok ]
 * Mounting /sys ...
 [ ok ]
 * Mounting security filesystem ...
 [ ok ]
 * Mounting debug filesystem ...
 [ ok ]
 * Mounting SELinux filesystem ...
 [ ok ]
 * Mounting persistent storage (pstore) filesystem ...
 [ ok ]
Starting default runlevel
[    1.088042] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2127428d09e, max_idle_ns: 440795284093 ns

Welcome to Alpine Linux 3.8
Kernel 4.14.55-84.37.amzn2.x86_64 on an x86_64 (ttyS0)

localhost login:
```
```
localhost login: root
Password:
Welcome to Alpine!

The Alpine Wiki contains a large amount of how-to guides and general
information about administrating Alpine systems.
See <http://wiki.alpinelinux.org>.

You can setup the system with the command: setup-alpine

You may change this message by editing /etc/motd.

login[855]: root login on 'ttyS0'
localhost:~#
```
