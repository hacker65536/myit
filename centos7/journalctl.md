recent event
```
journalctl -e
```

like tail -f
```
journalctl -f
```

unitname
```
journalctl -u unitname
```


```
# journalctl -u chronyd.service
-- Logs begin at Wed 2017-10-04 10:59:51 JST, end at Wed 2017-10-04 11:15:00 JST. --
Oct 04 10:59:56 localhost.localdomain systemd[1]: Starting NTP client/server...
Oct 04 10:59:56 localhost.localdomain chronyd[461]: chronyd version 2.1.1 starting (+CMDMON +NTP +RE
Oct 04 10:59:56 localhost.localdomain chronyd[461]: Generated key 1
Oct 04 10:59:57 localhost.localdomain systemd[1]: Started NTP client/server.
Oct 04 11:00:31 ip-172-31-38-84 chronyd[461]: Selected source 69.89.207.199
Oct 04 11:09:03 ip-172-31-38-84 systemd[1]: Stopping NTP client/server...
Oct 04 11:09:03 ip-172-31-38-84 systemd[1]: Starting NTP client/server...
Oct 04 11:09:03 ip-172-31-38-84 chronyd[9246]: chronyd version 3.1 starting (+CMDMON +NTP +REFCLOCK
Oct 04 11:09:03 ip-172-31-38-84 chronyd[9246]: Could not change ownership of /var/run/chrony : Opera
Oct 04 11:09:03 ip-172-31-38-84 chronyd[9246]: Could not access /var/run/chrony : No such file or di
Oct 04 11:09:03 ip-172-31-38-84 chronyd[9246]: Disabled command socket /var/run/chrony/chronyd.sock
Oct 04 11:09:03 ip-172-31-38-84 chronyd[9246]: Frequency 9.006 +/- 0.399 ppm read from /var/lib/chro
Oct 04 11:09:03 ip-172-31-38-84 systemd[1]: Started NTP client/server.
Oct 04 11:09:08 ip-172-31-38-84 chronyd[9246]: Selected source 204.9.54.119
Oct 04 11:12:58 ip-172-31-38-84 systemd[1]: Stopping NTP client/server...
Oct 04 11:12:58 ip-172-31-38-84 systemd[1]: Stopped NTP client/server.
Oct 04 11:13:21 ip-172-31-38-84 systemd[1]: Starting NTP client/server...
Oct 04 11:13:21 ip-172-31-38-84 chronyd[9302]: chronyd version 3.1 starting (+CMDMON +NTP +REFCLOCK
Oct 04 11:13:21 ip-172-31-38-84 chronyd[9302]: Could not change ownership of /var/run/chrony : Opera
Oct 04 11:13:21 ip-172-31-38-84 chronyd[9302]: Could not access /var/run/chrony : No such file or di
Oct 04 11:13:21 ip-172-31-38-84 chronyd[9302]: Disabled command socket /var/run/chrony/chronyd.sock
Oct 04 11:13:21 ip-172-31-38-84 chronyd[9302]: Frequency 8.983 +/- 1.042 ppm read from /var/lib/chro
Oct 04 11:13:21 ip-172-31-38-84 systemd[1]: Started NTP client/server.
Oct 04 11:13:26 ip-172-31-38-84 chronyd[9302]: Selected source 45.33.84.208
```

lines
```
journalctl -n 100
```
boot message
```
journalctl -b 
```

no pager
```
journalctl -u slapd --no-parge
```
