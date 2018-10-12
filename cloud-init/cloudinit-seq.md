
systemdからcloud-initの起動順番を確認
```console
# systemd-analyze critical-chain
The time after the unit is active or started is printed after the "@" character.
The time the unit takes to start is printed after the "+" character.

graphical.target @10.330s
└─multi-user.target @10.330s
  └─sshd.service @6.108s +15ms
    └─sshd-keygen.service @5.070s +559ms
      └─cloud-init.service @3.748s +1.321s
        └─network.service @1.987s +1.760s
          └─network-pre.target @1.986s
            └─cloud-init-local.service @1.299s +686ms
              └─basic.target @1.263s
                └─sockets.target @1.263s
                  └─dbus.socket @1.262s
                    └─sysinit.target @1.257s
                      └─systemd-update-utmp.service @1.244s +12ms
                        └─auditd.service @1.102s +141ms
                          └─systemd-tmpfiles-setup.service @1.084s +16ms
                            └─local-fs.target @1.068s
                              └─local-fs-pre.target @1.068s
                                └─lvm2-monitor.service @212ms +855ms
                                  └─lvm2-lvmetad.service @272ms
                                    └─lvm2-lvmetad.socket @212ms
                                      └─-.slice
```

`cloud-init-local.service @1.299s +686ms`  
- 起動に686msを要した
- basic.targetより後に呼ばれている

```console
$ ls -la /etc/systemd/system/cloud-init.target.wants/cloud-init-local.service
lrwxrwxrwx 1 root root 48 Oct  7 22:17 /etc/systemd/system/cloud-init.target.wants/cloud-init-local.service -> /usr/lib/systemd/system/cloud-init-local.service
```

実態は`/usr/lib/systemd/system/cloud-init-local.service`である

中身  
```console
$ cat /usr/lib/systemd/system/cloud-init-local.service
```
```ini
[Unit]
Description=Initial cloud-init job (pre-networking)
Wants=network-pre.target
After=systemd-remount-fs.service
Before=NetworkManager.service
Before=network-pre.target
Before=shutdown.target
RequiresMountsFor=/var/lib/cloud

[Service]
Type=oneshot
ExecStart=/usr/bin/cloud-init init --local
ExecStart=/bin/touch /run/cloud-init/network-config-ready
RemainAfterExit=yes
TimeoutSec=0

# Output needs to appear in instance console output
StandardOutput=journal+console

[Install]
WantedBy=cloud-init.target
```

`/usr/bin/cloud-init init --local`が実行されている

`/usr/bin/cloud-init`の中身
```console
$ cat /usr/bin/cloud-init
```

```python
#!/usr/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'cloud-init==18.2','console_scripts','cloud-init'
__requires__ = 'cloud-init==18.2'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('cloud-init==18.2', 'console_scripts', 'cloud-init')()
    )
```

entrypointの確認
```console
$ cat /usr/lib/python2.7/site-packages/cloud_init-18.2-py2.7.egg-info/entry_points.txt
```
```ini
[console_scripts]
cloud-init = cloudinit.cmd.main:main
```

`/usr/lib/python2.7/site-packages/cloudinit/cmd/main.py`

```
885 if __name__ == '__main__':
886     if 'TZ' not in os.environ:
887         os.environ['TZ'] = ":/etc/localtime"
888     main(sys.argv)
```
`init --local`を引数としてmain関数に渡す



```
713 def main(sysv_args=None):
714     if not sysv_args:
715         sysv_args = sys.argv
716     parser = argparse.ArgumentParser(prog=sysv_args[0])
717     sysv_args = sysv_args[1:]
718
719     # Top level args
720     parser.add_argument('--version', '-v', action='version',
721                         version='%(prog)s ' + (version.version_string()))
---
742     parser_init = subparsers.add_parser('init',
743                                         help=('initializes cloud-init and'
744                                               ' performs initial modules'))
745     parser_init.add_argument("--local", '-l', action='store_true',
746                              help="start in local mode (default: %(default)s)",
747                              default=False)
748     # This is used so that we can know which action is selected +
749     # the functor to use to run this subcommand
750     parser_init.set_defaults(action=('init', main_init))
```

`argparse`[show](https://docs.python.jp/3/library/argparse.html)を利用して引数からサブコマンドへのパースを行っている

```
214 def main_init(name, args):
215     deps = [sources.DEP_FILESYSTEM, sources.DEP_NETWORK]
216     if args.local:
217         deps = [sources.DEP_FILESYSTEM]
218
219     early_logs = [attempt_cmdline_url(
220         path=os.path.join("%s.d" % CLOUD_CONFIG,
221                           "91_kernel_cmdline_url.cfg"),
222         network=not args.local)]
223
224     # Cloud-init 'init' stage is broken up into the following sub-stages
225     # 1. Ensure that the init object fetches its config without errors
226     # 2. Setup logging/output redirections with resultant config (if any)
227     # 3. Initialize the cloud-init filesystem
228     # 4. Check if we can stop early by looking for various files
229     # 5. Fetch the datasource
230     # 6. Connect to the current instance location + update the cache
231     # 7. Consume the userdata (handlers get activated here)
232     # 8. Construct the modules object
233     # 9. Adjust any subsequent logging/output redirections using the modules
234     #    objects config as it may be different from init object
235     # 10. Run the modules for the 'init' stage
236     # 11. Done!
237     if not args.local:
238         w_msg = welcome_format(name)
239     else:
240         w_msg = welcome_format("%s-local" % (name))
241     init = stages.Init(ds_deps=deps, reporter=args.reporter)
242     # Stage 1
243     init.read_cfg(extract_fns(args))
244     # Stage 2
245     outfmt = None
246     errfmt = None
247     try:
248         early_logs.append((logging.DEBUG, "Closing stdin."))
249         util.close_stdin()
250         (outfmt, errfmt) = util.fixup_output(init.cfg, name)
251     except Exception:
252         msg = "Failed to setup output redirection!"
253         util.logexc(LOG, msg)
254         print_exc(msg)
255         early_logs.append((logging.WARN, msg))
256     if args.debug:
257         # Reset so that all the debug handlers are closed out
258         LOG.debug(("Logging being reset, this logger may no"
259                    " longer be active shortly"))
260         logging.resetLogging()
261     logging.setupLogging(init.cfg)
262     apply_reporting_cfg(init.cfg)
263
264     # Any log usage prior to setupLogging above did not have local user log
265     # config applied.  We send the welcome message now, as stderr/out have
266     # been redirected and log now configured.
267     welcome(name, msg=w_msg)
268
269     # re-play early log messages before logging was setup
270     for lvl, msg in early_logs:
271         LOG.log(lvl, msg)
```

この時点では `name = init`  `args = --local`が渡されている


```
 77 def welcome(action, msg=None):
 78     if not msg:
 79         msg = welcome_format(action)
 80     util.multi_log("%s\n" % (msg),
 81                    console=False, stderr=True, log=LOG)
 82     return msg
 83
 84
 85 def welcome_format(action):
 86     return WELCOME_MSG_TPL.format(
 87         version=version.version_string(),
 88         uptime=util.uptime(),
 89         timestamp=util.time_rfc2822(),
 90         action=action)
```

`/usr/lib/python2.7/site-packages/cloudinit/util.py`
```
 538 def multi_log(text, console=True, stderr=True,
 539               log=None, log_level=logging.DEBUG):
 540     if stderr:
 541         sys.stderr.write(text)
 542     if console:
 543         conpath = "/dev/console"
 544         if os.path.exists(conpath):
 545             with open(conpath, 'w') as wfh:
 546                 wfh.write(text)
 547                 wfh.flush()
 548         else:
 549             # A container may lack /dev/console (arguably a container bug).  If
 550             # it does not exist, then write output to stdout.  this will result
 551             # in duplicate stderr and stdout messages if stderr was True.
 552             #
 553             # even though upstart or systemd might have set up output to go to
 554             # /dev/console, the user may have configured elsewhere via
 555             # cloud-config 'output'.  If there is /dev/console, messages will
 556             # still get there.
 557             sys.stdout.write(text)
 558     if log:
 559         if text[-1] == "\n":
 560             log.log(log_level, text[:-1])
 561         else:
 562             log.log(log_level, text)
```

`/var/log/cloud-init.log`に1行目が出力される
```
  1 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Cloud-init v. 18.2-72.amzn2.0.6 running 'init-local' at Wed, 10 Oct 2018 00:52:35 +0000. Up 5.33 seconds.
  2 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: No kernel command line url found.
  3 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: Closing stdin.
```
