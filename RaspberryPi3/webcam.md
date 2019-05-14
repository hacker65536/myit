```
$ lsusb
Bus 001 Device 005: ID 054c:06ae Sony Corp.
Bus 001 Device 004: ID 046d:081b Logitech, Inc. Webcam C310
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

```
$ sudo apt-get update
$ sudo apt-get install -y subversion libjpeg-dev imagemagick
$ svn co https://svn.code.sf.net/p/mjpg-streamer/code/mjpg-streamer mjpg-streamer
$ cd mjpg-streamer
$ make
```
```
$ sudo ./mjpg_streamer -i "./input_uvc.so -f 10 -r 320x240 -d /dev/video0 -y -n" -o "./output_http.so -w ./www -p 8081"
MJPG Streamer Version: svn rev: 3:172
 i: Using V4L2 device.: /dev/video0
 i: Desired Resolution: 320 x 240
 i: Frames Per Second.: 10
 i: Format............: YUV
 i: JPEG Quality......: 80
 o: www-folder-path...: ./www/
 o: HTTP TCP port.....: 8081
 o: username:password.: disabled
 o: commands..........: enabled
```
