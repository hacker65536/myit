# fio

https://fio.readthedocs.io/en/latest/fio_doc.html

https://www.linux.com/training-tutorials/inspecting-disk-io-performance-fio/




aws ebs benchmark
--

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/benchmark_procedures.html


```console
$ sudo yum install -y fio
```

check and disable c-states
```console
$ cpupower idle-info | grep "Number of idle states:"
```

```console
$ for i in `seq 1 $((N-1))`; do cpupower idle-set -d $i; done
```

no idle states
```console
$ cpupower idle-info
CPUidle driver: none
CPUidle governor: menu
analyzing CPU 0:

CPU 0: No idle states
```

randwrite
```console
$ sudo fio --directory=/mnt/p_iops_vol0 --ioengine=psync --name fio_test_file --direct=1 --rw=randwrite --bs=16k --size=1G --numjobs=16 --time_based --runtime=180 --group_reporting --norandommap
```

```console
$ sudo fio --directory=/mnt/p_iops_vol0 --name fio_test_file --direct=1 --rw=randread --bs=16k --size=1G --numjobs=16 --time_based --runtime=180 --group_reporting --norandommap 
```
