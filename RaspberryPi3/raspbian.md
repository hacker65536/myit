```
$ diskutil list
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:          Apple_CoreStorage Untitled                499.4 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3

/dev/disk1 (internal, virtual):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                  Apple_HFS Untitled               +499.1 GB   disk1
                                 Logical Volume on disk0s2
                                 E1980E73-8B73-4BF9-A8CA-AECF097ABE6F
                                 Unlocked Encrypted

/dev/disk2 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *32.0 GB    disk2
   1:             Windows_FAT_32 NO NAME                 32.0 GB    disk2s1
```
```
$ diskutil unmountDisk /dev/disk2
Unmount of all volumes on disk2 was successful
```
```
$ sudo dd bs=1m if=2017-07-05-raspbian-jessie.img of=/dev/rdisk2
dd: /dev/rdisk2: Invalid argument
4445+1 records in
4445+0 records out
4660920320 bytes transferred in 217.195361 secs (21459576 bytes/sec)
```

rdisk2 is faster? 
invalid argument...

```
$ sudo sh -c "wpa_passphrase [SSID] [PASSPHRASE] >> /etc/wpa_supplicant/wpa_supplicant.conf"
```

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=GB

network={
    ssid="home"
    #psk="password"
    psk=d04b98f48e8f8bcc15c6ae5ac050801cd6dcfd428fb5f9e65c4e16e7807340fa
    scan_ssid=1
}
```
if use wifi in stealth mode ,need set scan_ssid=1
