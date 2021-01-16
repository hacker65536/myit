
```console
$ macaddress="00:00:00:00:00:00"
$ arp -an | grep $macaddress | cut -d" " -f 2 | cut -c2- | rev | cut -c2- | rev
````
