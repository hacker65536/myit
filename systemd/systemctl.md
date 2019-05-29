# systemctl


https://www.freedesktop.org/software/systemd/man/systemctl.html


list-unit-files
--

```console
$ sudo systemctl list-unit-files --state=enabled
```

`--state` enabled | disabled | static | indirect


`--no-pager` Do net pipe output into a pager


enable
--

```console
$ sudo systemctl enable docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
```
