

```bash
lsof -p <the num of proc>
```
```bash
sudo lsof -p $(pgrep -n docker)
COMMAND    PID USER   FD   TYPE             DEVICE SIZE/OFF   NODE NAME
docker-co 2514 root  cwd    DIR             202,81     4096      2 /
docker-co 2514 root  rtd    DIR             202,81     4096      2 /
docker-co 2514 root  txt    REG             202,81 10810464 410184 /usr/bin/docker-containerd
docker-co 2514 root    0r   CHR                1,3      0t0   5775 /dev/null
docker-co 2514 root    1w   REG             202,81    24739 263826 /var/log/docker
docker-co 2514 root    2w   REG             202,81    24739 263826 /var/log/docker
docker-co 2514 root    3u  0000               0,11        0   5773 anon_inode
docker-co 2514 root    4w   REG             202,81     1643 263834 /run/containerd/events.log
docker-co 2514 root    5u  unix 0xffff880037b13fc0      0t0  10607 /var/run/docker/libcontainerd/docker-containerd.sock
docker-co 2514 root    6r  FIFO             202,81      0t0 410914 /run/containerd/88dd444b68361669a8035776d7fe024fdcca6a8077ad8f2da97506359df4c748/init/exit (deleted)
docker-co 2514 root    7u  0000               0,11        0   5773 anon_inode
docker-co 2514 root    8u  unix 0xffff880037b14740      0t0  10760 /var/run/docker/libcontainerd/docker-containerd.sock
docker-co 2514 root   10r  FIFO             202,81      0t0 264093 /run/containerd/7604247f475fe43593278d2658f9df5360b13b100377e66575b87f15540b5056/init/exit (deleted)
docker-co 2514 root   11u  FIFO             202,81      0t0 264046 /run/containerd/0c90484d63d80f40e8970bdf3a886a02d94638c76e795416f20d0a49e43ff721/init/control (deleted)
docker-co 2514 root   12u  FIFO             202,81      0t0 264070 /run/containerd/19e85831e29d0b2f3b99e2e56ad951067f983bc4bbc6d31775d70901d6535142/init/control (deleted)
docker-co 2514 root   13u  FIFO             202,81      0t0 264088 /run/containerd/935dff0f9db27a0235a46ebee55c1675049d46a9b2c4735ed25d8ac3e5040c5c/init/control (deleted)
docker-co 2514 root   14u  FIFO             202,81      0t0 264094 /run/containerd/7604247f475fe43593278d2658f9df5360b13b100377e66575b87f15540b5056/init/control (deleted)
docker-co 2514 root   15r  FIFO             202,81      0t0 264122 /run/containerd/6f57934aa24fa44d3ca23f2bf6ddd9540f5549adf80dcd6f549727b1b254a77d/init/exit (deleted)
docker-co 2514 root   16u  FIFO             202,81      0t0 264123 /run/containerd/6f57934aa24fa44d3ca23f2bf6ddd9540f5549adf80dcd6f549727b1b254a77d/init/control (deleted)
docker-co 2514 root   18u  FIFO             202,81      0t0 264144 /run/containerd/77b5a76fa444882c7158556cb8777d7c84c725bdebe85817fe006f0e1decb421/init/control (deleted)
docker-co 2514 root   22u  FIFO             202,81      0t0 264177 /run/containerd/528186e81b7fa6157738481219bf1672cf39a04db259567b8b529456462a1a0a/init/control (deleted)

```


```bash
sudo lsof -c docker
COMMAND    PID USER   FD   TYPE             DEVICE SIZE/OFF       NODE NAME
docker    2507 root  cwd    DIR             202,81     4096          2 /
docker    2507 root  rtd    DIR             202,81     4096          2 /
docker    2507 root  txt    REG             202,81 28907424     410183 /usr/bin/docker
docker    2507 root  mem    REG             202,81    61920     396390 /lib64/libnss_files-2.17.so
docker    2507 root  mem-W  REG             202,81    32768     263996 /var/lib/docker/volumes/metadata.db
docker    2507 root  mem    REG             202,81    44088     396402 /lib64/librt-2.17.so
docker    2507 root  mem    REG             202,81    63304     396674 /lib64/libudev.so.0.12.0
docker    2507 root  mem    REG             202,81   262376     396515 /lib64/libsepol.so.1
docker    2507 root  mem    REG             202,81   126328     396516 /usr/lib64/libselinux.so.1
docker    2507 root  mem    REG             202,81  2112368     396372 /lib64/libc-2.17.so
docker    2507 root  mem    REG             202,81   299856     401255 /lib64/libdevmapper.so.1.02
docker    2507 root  mem    REG             202,81    19512     396378 /lib64/libdl-2.17.so
docker    2507 root  mem    REG             202,81   142296     396398 /lib64/libpthread-2.17.so
docker    2507 root  mem    REG             202,81   164432     396365 /lib64/ld-2.17.so
docker    2507 root    0r   CHR                1,3      0t0       5775 /dev/null
docker    2507 root    1w   REG             202,81    24739     263826 /var/log/docker
docker    2507 root    2w   REG             202,81    24739     263826 /var/log/docker
docker    2507 root    3u  unix 0xffff880037b13c00      0t0      10593 /var/run/docker.sock
docker    2507 root    4u  0000               0,11        0       5773 anon_inode
docker    2507 root    5u  unix 0xffff880037b14380      0t0      10759 socket
docker    2507 root    6u   CHR             10,236      0t0       6696 /dev/mapper/control
docker    2507 root    7uW  REG             202,81    32768     263996 /var/lib/docker/volumes/metadata.db
docker    2507 root    8r   REG                0,3        0 4026531993 net
docker    2507 root    9u  unix 0xffff880037b14b00      0t0      11101 /var/lib/docker/network/files/1b05e9777e1cb6a7b2cf402d138cfb2c4a284973b6d791cd8ee2a536b08d68f0.sock
docker    2507 root   17r  FIFO             202,81      0t0     264076 /var/run/docker/libcontainerd/7604247f475fe43593278d2658f9df5360b13b100377e66575b87f15540b5056/init-stderr (deleted)
docker-co 2514 root  cwd    DIR             202,81     4096          2 /
docker-co 2514 root  rtd    DIR             202,81     4096          2 /
docker-co 2514 root  txt    REG             202,81 10810464     410184 /usr/bin/docker-containerd
docker-co 2514 root    0r   CHR                1,3      0t0       5775 /dev/null
docker-co 2514 root    1w   REG             202,81    24739     263826 /var/log/docker
docker-co 2514 root    2w   REG             202,81    24739     263826 /var/log/docker
docker-co 2514 root    3u  0000               0,11        0       5773 anon_inode
docker-co 2514 root    4w   REG             202,81     1643     263834 /run/containerd/events.log
docker-co 2514 root    5u  unix 0xffff880037b13fc0      0t0      10607 /var/run/docker/libcontainerd/docker-containerd.sock
docker-co 2514 root    6r  FIFO             202,81      0t0     410914 /run/containerd/88dd444b68361669a8035776d7fe024fdcca6a8077ad8f2da97506359df4c748/init/exit (deleted)
docker-co 2514 root    7u  0000               0,11        0       5773 anon_inode
docker-co 2514 root    8u  unix 0xffff880037b14740      0t0      10760 /var/run/docker/libcontainerd/docker-containerd.sock
docker-co 2514 root   10r  FIFO             202,81      0t0     264093 /run/containerd/7604247f475fe43593278d2658f9df5360b13b100377e66575b87f15540b5056/init/exit (deleted)
docker-co 2514 root   11u  FIFO             202,81      0t0     264046 /run/containerd/0c90484d63d80f40e8970bdf3a886a02d94638c76e795416f20d0a49e43ff721/init/control (deleted)
docker-co 2514 root   12u  FIFO             202,81      0t0     264070 /run/containerd/19e85831e29d0b2f3b99e2e56ad951067f983bc4bbc6d31775d70901d6535142/init/control (deleted)
docker-co 2514 root   13u  FIFO             202,81      0t0     264088 /run/containerd/935dff0f9db27a0235a46ebee55c1675049d46a9b2c4735ed25d8ac3e5040c5c/init/control (deleted)
docker-co 2514 root   14u  FIFO             202,81      0t0     264094 /run/containerd/7604247f475fe43593278d2658f9df5360b13b100377e66575b87f15540b5056/init/control (deleted)
docker-co 2514 root   15r  FIFO             202,81      0t0     264122 /run/containerd/6f57934aa24fa44d3ca23f2bf6ddd9540f5549adf80dcd6f549727b1b254a77d/init/exit (deleted)
docker-co 2514 root   16u  FIFO             202,81      0t0     264123 /run/containerd/6f57934aa24fa44d3ca23f2bf6ddd9540f5549adf80dcd6f549727b1b254a77d/init/control (deleted)
docker-co 2514 root   18u  FIFO             202,81      0t0     264144 /run/containerd/77b5a76fa444882c7158556cb8777d7c84c725bdebe85817fe006f0e1decb421/init/control (deleted)
docker-co 2514 root   22u  FIFO             202,81      0t0     264177 /run/containerd/528186e81b7fa6157738481219bf1672cf39a04db259567b8b529456462a1a0a/init/control (deleted)

```
