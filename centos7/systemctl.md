
shutdown
```
poweroff
systemctl poweroff
```

reboot
```
reboot
systemctl reboot
```

single mode
```
systemctl rescue
```

chkconfig <service> on
```
systemctl enable/disable <service>
```

```
systemctl kill --singnal=9 <service>
```
```
systemctl start/stop/restart/status/reload <service>
```

```
systemctl list-unit-files |grep enabled
```
