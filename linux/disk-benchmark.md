
https://hesonogoma.com/linux/oracle_orion_disk_performance_benchmark.html


```
gunzip orion_linux_x86-64.gz
chmod 755 orion_linux_x86-64
```

```
mkdir -p oradata/orion-test
for i in {1..10}; do dd if=/dev/zero of=$HOME/oradata/orion-test/testfile-$(printf "%02d" $i)0.dbf bs=1M count=10240;done
```

```
cat <<EOF >orion-test.lun
$HOME/oradata/orion-test/testfile-010.dbf
$HOME/oradata/orion-test/testfile-020.dbf
$HOME/oradata/orion-test/testfile-030.dbf
$HOME/oradata/orion-test/testfile-040.dbf
$HOME/oradata/orion-test/testfile-050.dbf
$HOME/oradata/orion-test/testfile-060.dbf
$HOME/oradata/orion-test/testfile-070.dbf
$HOME/oradata/orion-test/testfile-080.dbf
$HOME/oradata/orion-test/testfile-090.dbf
$HOME/oradata/orion-test/testfile-100.dbf
EOF
```

```
./orion_linux_x86-64 -run simple -testname orion-test -num_disks 1
ORION: ORacle IO Numbers -- Version 11.1.0.7.0
orion-test_20180404_1250
Test will take approximately 9 minutes
Larger caches may take longer

```
