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

```console
# ls -la /etc/systemd/system/cloud-init.target.wants/
total 0
drwxr-xr-x  2 root root 119 Oct  7 22:17 .
drwxr-xr-x 10 root root 264 Oct  7 22:17 ..
lrwxrwxrwx  1 root root  44 Oct  7 22:17 cloud-config.service -> /usr/lib/systemd/system/cloud-config.service
lrwxrwxrwx  1 root root  43 Oct  7 22:17 cloud-final.service -> /usr/lib/systemd/system/cloud-final.service
lrwxrwxrwx  1 root root  48 Oct  7 22:17 cloud-init-local.service -> /usr/lib/systemd/system/cloud-init-local.service
lrwxrwxrwx  1 root root  42 Oct  7 22:17 cloud-init.service -> /usr/lib/systemd/system/cloud-init.service
```

```console
# cat /usr/lib/systemd/system/cloud-init-local.service
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

```console
# cat /usr/bin/cloud-init
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

```console
# cat /usr/lib/python2.7/site-packages/cloud_init-18.2-py2.7.egg-info/entry_points.txt
[console_scripts]
cloud-init = cloudinit.cmd.main:main
```

`/var/log/cloud-init.log`
```
  1 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Cloud-init v. 18.2-72.amzn2.0.6 running 'init-local' at Wed, 10 Oct 2018 00:52:35 +0000. Up 5.33 seconds.
  2 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: No kernel command line url found.
  3 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: Closing stdin.
  4 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Writing to /var/log/cloud-init.log - ab: [644] 0 bytes
  5 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/instance/boot-finished
  6 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/data/no-net
  7 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: start: init-local/check-cache: attempting to read from cache [check]
  8 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Reading from /var/lib/cloud/instance/obj.pkl (quiet=False)
  9 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: no cache found
 10 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: finish: init-local/check-cache: SUCCESS: no cache found
 11 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/instance
 12 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: Using distro class <class 'cloudinit.distros.amazon.Distro'>
 13 Oct 10 00:52:35 cloud-init[2662]: __init__.py[DEBUG]: Looking for data source in: ['Ec2', 'None'], via packages ['', u'cloudinit.sources'] that matches dependencies ['FILESYSTEM']
 14 Oct 10 00:52:35 cloud-init[2662]: __init__.py[DEBUG]: Searching for local data source in: []
 15 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: No local datasource found
 16 Oct 10 00:52:35 cloud-init[2662]: stages.py[DEBUG]: network config disabled by system_cfg
 17 Oct 10 00:52:35 cloud-init[2662]: stages.py[INFO]: network config is disabled by system_cfg
 18 Oct 10 00:52:35 cloud-init[2662]: main.py[DEBUG]: [local] Exiting without datasource in local mode
 19 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Reading from /proc/uptime (quiet=False)
 20 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: Read 10 bytes from /proc/uptime
 21 Oct 10 00:52:35 cloud-init[2662]: util.py[DEBUG]: cloud-init mode 'init' took 0.058 seconds (0.06)
 22 Oct 10 00:52:35 cloud-init[2662]: handlers.py[DEBUG]: finish: init-local: SUCCESS: searching for local datasources
```

 `/usr/lib/python2.7/site-packages/cloudinit/cmd/main.py`
```
280     mode = sources.DSMODE_LOCAL if args.local else sources.DSMODE_NETWORK
```
```
335         if mode == sources.DSMODE_LOCAL:
336             LOG.debug("No local datasource found")
337         else:
338             util.logexc(LOG, ("No instance datasource found!"
339                               " Likely bad things to come!"))
340         if not args.force:
341             init.apply_network_config(bring_up=not args.local)
342             LOG.debug("[%s] Exiting without datasource in local mode", mode)
343             if mode == sources.DSMODE_LOCAL:
344                 return (None, [])
345             else:
346                 return (None, ["No instance datasource found."])
347         else:
348             LOG.debug("[%s] barreling on in force mode without datasource",
349                       mode)
```

`/var/log/cloud-init.log`
```
 23 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Cloud-init v. 18.2-72.amzn2.0.6 running 'init' at Wed, 10 Oct 2018 00:52:37 +0000. Up 7.65 seconds.
 24 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: No kernel command line url found.
 25 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Closing stdin.
 26 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Writing to /var/log/cloud-init.log - ab: [644] 0 bytes
 27 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', 'addr', 'show'] with allowed return codes [0] (shell=False, capture=True)
 28 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', '-o', 'route', 'list'] with allowed return codes [0] (shell=False, capture=True)
 29 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['ip', '--oneline', '-6', 'route', 'list', 'table', 'all'] with allowed return codes [0, 1] (shell=False, capture=True)
 30 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Checking to see if files that we need already exist from a previous run that would allow us to stop early.
 31 Oct 10 00:52:37 cloud-init[3038]: main.py[DEBUG]: Execution continuing, no previous run detected that would allow us to stop early.
 32 Oct 10 00:52:37 cloud-init[3038]: handlers.py[DEBUG]: start: init-network/check-cache: attempting to read from cache [trust]
 33 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /var/lib/cloud/instance/obj.pkl (quiet=False)
 34 Oct 10 00:52:37 cloud-init[3038]: stages.py[DEBUG]: no cache found
 35 Oct 10 00:52:37 cloud-init[3038]: handlers.py[DEBUG]: finish: init-network/check-cache: SUCCESS: no cache found
```


 `/usr/lib/python2.7/site-packages/cloudinit/cmd/main.py`
```
280     mode = sources.DSMODE_LOCAL if args.local else sources.DSMODE_NETWORK
281
282     if mode == sources.DSMODE_NETWORK:
283         existing = "trust"
284         sys.stderr.write("%s\n" % (netinfo.debug_info()))
285         LOG.debug(("Checking to see if files that we need already"
286                    " exist from a previous run that would allow us"
287                    " to stop early."))
288         # no-net is written by upstart cloud-init-nonet when network failed
289         # to come up
290         stop_files = [
291             os.path.join(path_helper.get_cpath("data"), "no-net"),
292         ]
293         existing_files = []
294         for fn in stop_files:
295             if os.path.isfile(fn):
296                 existing_files.append(fn)
297
298         if existing_files:
299             LOG.debug("[%s] Exiting. stop file %s existed",
300                       mode, existing_files)
301             return (None, [])
302         else:
303             LOG.debug("Execution continuing, no previous run detected that"
304                       " would allow us to stop early.")
```


```
241     init = stages.Init(ds_deps=deps, reporter=args.reporter)
```
```
321     # Stage 5
322     try:
323         init.fetch(existing=existing)
```

`/usr/lib/python2.7/site-packages/cloudinit/stages.py`
```
347     def fetch(self, existing="check"):
348         return self._get_data_source(existing=existing)
```
```
234     def _get_data_source(self, existing):
235         if self.datasource is not NULL_DATA_SOURCE:
236             return self.datasource
237
238         with events.ReportEventStack(
239                 name="check-cache",
240                 description="attempting to read from cache [%s]" % existing,
241                 parent=self.reporter) as myrep:
242
243             ds, desc = self._restore_from_checked_cache(existing)
244             myrep.description = desc
245             self.ds_restored = bool(ds)
246             LOG.debug(myrep.description)

```
```
209     def _restore_from_checked_cache(self, existing):
210         if existing not in ("check", "trust"):
211             raise ValueError("Unexpected value for existing: %s" % existing)
212
213         ds = self._restore_from_cache()
214         if not ds:
215             return (None, "no cache found")
```
```
182     def _restore_from_cache(self):
183         # We try to restore from a current link and static path
184         # by using the instance link, if purge_cache was called
185         # the file wont exist.
186         return _pkl_load(self.paths.get_ipath_cur('obj_pkl'))
```

`/var/log/cloud-init.log`
```
 36 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Attempting to remove /var/lib/cloud/instance
 37 Oct 10 00:52:37 cloud-init[3038]: stages.py[DEBUG]: Using distro class <class 'cloudinit.distros.amazon.Distro'>
 38 Oct 10 00:52:37 cloud-init[3038]: __init__.py[DEBUG]: Looking for data source in: ['Ec2', 'None'], via packages ['', u'cloudinit.sources'] that matches dependencies ['FILESYSTEM', 'NETWORK']
 39 Oct 10 00:52:37 cloud-init[3038]: __init__.py[DEBUG]: Searching for network data source in: [u'DataSourceEc2', u'DataSourceNone']
 40 Oct 10 00:52:37 cloud-init[3038]: handlers.py[DEBUG]: start: init-network/search-Ec2: searching for network data from DataSourceEc2
 41 Oct 10 00:52:37 cloud-init[3038]: __init__.py[DEBUG]: Seeing if we can get any data from <class 'cloudinit.sources.DataSourceEc2.DataSourceEc2'>
 42 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /sys/hypervisor/uuid (quiet=False)
 43 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Read 37 bytes from /sys/hypervisor/uuid
 44 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['systemd-detect-virt', '--quiet', '--container'] with allowed return codes [0] (shell=False, capture=True)
 45 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['running-in-container'] with allowed return codes [0] (shell=False, capture=True)
 46 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Running command ['lxc-is-container'] with allowed return codes [0] (shell=False, capture=True)
 47 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /proc/1/environ (quiet=False)
 48 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Read 0 bytes from /proc/1/environ
 49 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /proc/self/status (quiet=False)
 50 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Read 1298 bytes from /proc/self/status
 51 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: querying dmi data /sys/class/dmi/id/product_serial
 52 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Reading from /sys/class/dmi/id/product_serial (quiet=False)
 53 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: Read 37 bytes from /sys/class/dmi/id/product_serial
 54 Oct 10 00:52:37 cloud-init[3038]: util.py[DEBUG]: dmi data /sys/class/dmi/id/product_serial returned ec23e5e6-3996-d6a8-c001-0cafdb88a415
 55 Oct 10 00:52:37 cloud-init[3038]: DataSourceEc2.py[DEBUG]: strict_mode: warn, cloud_platform=AWS
 56 Oct 10 00:52:38 cloud-init[3038]: util.py[DEBUG]: Resolving URL: http://169.254.169.254 took 0.073 seconds
 57 Oct 10 00:52:38 cloud-init[3038]: util.py[DEBUG]: Resolving URL: http://instance-data.:8773 took 0.003 seconds
 58 Oct 10 00:52:38 cloud-init[3038]: DataSourceEc2.py[DEBUG]: Removed the following from metadata urls: ['http://instance-data.:8773']
 59 Oct 10 00:52:38 cloud-init[3038]: url_helper.py[DEBUG]: [0/1] open 'http://169.254.169.254/2009-04-04/meta-data/instance-id' with {'url': 'http://169.254.169.254/2009-04-04/meta-data/instance-id', 'headers': {'
 60 Oct 10 00:52:38 cloud-init[3038]: url_helper.py[DEBUG]: Read from http://169.254.169.254/2009-04-04/meta-data/instance-id (200, 19b) after 1 attempts
 61 Oct 10 00:52:38 cloud-init[3038]: DataSourceEc2.py[DEBUG]: Using metadata source: 'http://169.254.169.254'
 62 Oct 10 00:52:38 cloud-init[3038]: url_helper.py[DEBUG]: [0/1] open 'http://169.254.169.254/2016-09-02/meta-data/instance-id' with {'url': 'http://169.254.169.254/2016-09-02/meta-data/instance-id', 'headers': {'
 63 Oct 10 00:52:38 cloud-init[3038]: url_helper.py[DEBUG]: Read from http://169.254.169.254/2016-09-02/meta-data/instance-id (200, 19b) after 1 attempts
 64 Oct 10 00:52:38 cloud-init[3038]: DataSourceEc2.py[DEBUG]: Found preferred metadata version 2016-09-02
```

`/usr/lib/python2.7/site-packages/cloudinit/stages.py`
```
247
248         if not ds:
249             util.del_file(self.paths.instance_link)
250             (cfg_list, pkg_list) = self._get_datasources()
251             # Deep copy so that user-data handlers can not modify
252             # (which will affect user-data handlers down the line...)
253             (ds, dsname) = sources.find_source(self.cfg,
254                                                self.distro,
255                                                self.paths,
256                                                copy.deepcopy(self.ds_deps),
257                                                cfg_list,
258                                                pkg_list, self.reporter)
259             LOG.info("Loaded datasource %s - %s", dsname, ds)
260         self.datasource = ds
261         # Ensure we adjust our path members datasource
262         # now that we have one (thus allowing ipath to be used)
263         self._reset()
264         return ds
```
```
199     def _get_datasources(self):
200         # Any config provided???
201         pkg_list = self.cfg.get('datasource_pkg_list') or []
202         # Add the defaults at the end
203         for n in ['', type_utils.obj_name(sources)]:
204             if n not in pkg_list:
205                 pkg_list.append(n)
206         cfg_list = self.cfg.get('datasource_list') or []
207         return (cfg_list, pkg_list)
```

`/etc/cloud/cloud.cfg`
```
  1 # WARNING: Modifications to this file may be overridden by files in
  2 # /etc/cloud/cloud.cfg.d
  3
  4 users:
  5  - default
  6
  7 disable_root: true
  8 ssh_pwauth:   false
  9
 10 mount_default_fields: [~, ~, 'auto', 'defaults,nofail', '0', '2']
 11 resize_rootfs: noblock
 12 resize_rootfs_tmp: /dev
 13 ssh_deletekeys:   false
 14 ssh_genkeytypes:  ~
 15 syslog_fix_perms: ~
 16
 17 datasource_list: [ Ec2, None ]
 18 repo_upgrade: security
 19 repo_upgrade_exclude:

```

`/usr/lib/python2.7/site-packages/cloudinit/type_utils.py`
```
 33 def obj_name(obj):
 34     if isinstance(obj, _NAME_TYPES):
 35         return six.text_type(obj.__name__)
 36     else:
 37         if not hasattr(obj, '__class__'):
 38             return repr(obj)
 39         else:
 40             return obj_name(obj.__class__)
 41
```


`/usr/lib/python2.7/site-packages/cloudinit/sources/__init__.py`
```
523 def find_source(sys_cfg, distro, paths, ds_deps, cfg_list, pkg_list, reporter):
524     ds_list = list_sources(cfg_list, ds_deps, pkg_list)
525     ds_names = [type_utils.obj_name(f) for f in ds_list]
526     mode = "network" if DEP_NETWORK in ds_deps else "local"
527     LOG.debug("Searching for %s data source in: %s", mode, ds_names)
528
529     for name, cls in zip(ds_names, ds_list):
530         myrep = events.ReportEventStack(
531             name="search-%s" % name.replace("DataSource", ""),
532             description="searching for %s data from %s" % (mode, name),
533             message="no %s data found from %s" % (mode, name),
534             parent=reporter)
535         try:
536             with myrep:
537                 LOG.debug("Seeing if we can get any data from %s", cls)
538                 s = cls(sys_cfg, distro, paths)
539                 if s.get_data():
540                     myrep.message = "found %s data from %s" % (mode, name)
541                     return (s, type_utils.obj_name(cls))
542         except Exception:
543             util.logexc(LOG, "Getting data from %s failed", cls)
544
545     msg = ("Did not find any data source,"
546            " searched classes: (%s)") % (", ".join(ds_names))
547     raise DataSourceNotFoundException(msg)
```
```
554 def list_sources(cfg_list, depends, pkg_list):
555     src_list = []
556     LOG.debug(("Looking for data source in: %s,"
557                " via packages %s that matches dependencies %s"),
558               cfg_list, pkg_list, depends)
```
`/usr/lib/python2.7/site-packages/cloudinit/stages.py`
```
 74     @property
 75     def distro(self):
 76         if not self._distro:
 77             # Try to find the right class to use
 78             system_config = self._extract_cfg('system')
 79             distro_name = system_config.pop('distro', 'ubuntu')
 80             distro_cls = distros.fetch(distro_name)
 81             LOG.debug("Using distro class %s", distro_cls)
 82             self._distro = distro_cls(distro_name, system_config, self.paths)
 83             # If we have an active datasource we need to adjust
 84             # said datasource and move its distro/system config
 85             # from whatever it was to a new set...
 86             if self.datasource is not NULL_DATA_SOURCE:
 87                 self.datasource.distro = self._distro
 88                 self.datasource.sys_cfg = system_config
 89         return self._distro
 90
 91     @property
 92     def cfg(self):
 93         return self._extract_cfg('restricted')
 94
 95     def _extract_cfg(self, restriction):
 96         # Ensure actually read
 97         self.read_cfg()
 98         # Nobody gets the real config
 99         ocfg = copy.deepcopy(self._cfg)
100         if restriction == 'restricted':
101             ocfg.pop('system_info', None)
102         elif restriction == 'system':
103             ocfg = util.get_cfg_by_path(ocfg, ('system_info',), {})
104         elif restriction == 'paths':
105             ocfg = util.get_cfg_by_path(ocfg, ('system_info', 'paths'), {})
106         if not isinstance(ocfg, (dict)):
107             ocfg = {}
108         return ocfg
```

`/etc/cloud/cloud.cfg`
```
 66 system_info:
 67   # This will affect which distro class gets used
 68   distro: amazon
 69   distro_short: amzn
 70   default_user:
 71     name: ec2-user
 72     lock_passwd: true
 73     gecos: EC2 Default User
 74     groups: [wheel, adm, systemd-journal]
 75     sudo: ["ALL=(ALL) NOPASSWD:ALL"]
 76     shell: /bin/bash
 77   paths:
 78     cloud_dir: /var/lib/cloud
 79     templates_dir: /etc/cloud/templates
 80   ssh_svcname: sshd
```
`/usr/lib/python2.7/site-packages/cloudinit/sources/DataSourceEc2.py`
```
 72     def __init__(self, sys_cfg, distro, paths):
 73         super(DataSourceEc2, self).__init__(sys_cfg, distro, paths)
 74         self.metadata_address = None
 75         self.seed_dir = os.path.join(paths.seed_dir, "ec2")
```
`/usr/lib/python2.7/site-packages/cloudinit/sources/__init__.py`
```
137     def get_data(self):
138         """Datasources implement _get_data to setup metadata and userdata_raw.
139
140         Minimally, the datasource should return a boolean True on success.
141         """
142         return_value = self._get_data()
143         json_file = os.path.join(self.paths.run_dir, INSTANCE_JSON_FILE)
144         if not return_value:
145             return return_value
146
147         instance_data = {
148             'ds': {
149                 'meta-data': self.metadata,
150                 'user-data': self.get_userdata_raw_text(),
151                 'vendor-data': self.get_vendordata_raw()}}
152         if hasattr(self, 'network_json'):
153             network_json = getattr(self, 'network_json')
154             if network_json != UNSET:
155                 instance_data['ds']['network_json'] = network_json
156         if hasattr(self, 'ec2_metadata'):
157             ec2_metadata = getattr(self, 'ec2_metadata')
158             if ec2_metadata != UNSET:
159                 instance_data['ds']['ec2_metadata'] = ec2_metadata
160         instance_data.update(
161             self._get_standardized_metadata())
162         try:
163             # Process content base64encoding unserializable values
164             content = util.json_dumps(instance_data)
165             # Strip base64: prefix and return base64-encoded-keys
166             processed_data = process_base64_metadata(json.loads(content))
167         except TypeError as e:
168             LOG.warning('Error persisting instance-data.json: %s', str(e))
169             return return_value
170         except UnicodeDecodeError as e:
171             LOG.warning('Error persisting instance-data.json: %s', str(e))
172             return return_value
173         write_json(json_file, processed_data, mode=0o600)
174         return return_value
```

`/usr/lib/python2.7/site-packages/cloudinit/sources/DataSourceEc2.py`
```
 81     def _get_data(self):
 82         seed_ret = {}
 83         if util.read_optional_seed(seed_ret, base=(self.seed_dir + "/")):
 84             self.userdata_raw = seed_ret['user-data']
 85             self.metadata = seed_ret['meta-data']
 86             LOG.debug("Using seeded ec2 data from %s", self.seed_dir)
 87             self._cloud_platform = Platforms.SEEDED
 88             return True
 89
 90         strict_mode, _sleep = read_strict_mode(
 91             util.get_cfg_by_path(self.sys_cfg, STRICT_ID_PATH,
 92                                  STRICT_ID_DEFAULT), ("warn", None))
 93
 94         LOG.debug("strict_mode: %s, cloud_platform=%s",
 95                   strict_mode, self.cloud_platform)
 96         if strict_mode == "true" and self.cloud_platform == Platforms.UNKNOWN:
 97             return False
 98         elif self.cloud_platform == Platforms.NO_EC2_METADATA:
 99             return False
100
101         if self.perform_dhcp_setup:  # Setup networking in init-local stage.
102             if util.is_FreeBSD():
103                 LOG.debug("FreeBSD doesn't support running dhclient with -sf")
104                 return False
105             try:
106                 with EphemeralDHCPv4(self.fallback_interface):
107                     return util.log_time(
108                         logfunc=LOG.debug, msg='Crawl of metadata service',
109                         func=self._crawl_metadata)
110             except NoDHCPLeaseError:
111                 return False
112         else:
113             return self._crawl_metadata()
```
```
285     @property
286     def cloud_platform(self):  # TODO rename cloud_name
287         if self._cloud_platform is None:
288             self._cloud_platform = identify_platform()
289         return self._cloud_platform
290
291     def activate(self, cfg, is_new_instance):
292         if not is_new_instance:
293             return
294         if self.cloud_platform == Platforms.UNKNOWN:
295             warn_if_necessary(
296                 util.get_cfg_by_path(cfg, STRICT_ID_PATH, STRICT_ID_DEFAULT),
297                 cfg)
```

```
465 def identify_platform():
466     # identify the platform and return an entry in Platforms.
467     data = _collect_platform_data()
468     checks = (identify_aws, identify_brightbox, lambda x: Platforms.UNKNOWN)
469     for checker in checks:
470         try:
471             result = checker(data)
472             if result:
473                 return result
474         except Exception as e:
475             LOG.warning("calling %s with %s raised exception: %s",
476                         checker, data, e)
```
```
479 def _collect_platform_data():
480     """Returns a dictionary of platform info from dmi or /sys/hypervisor.
481
482     Keys in the dictionary are as follows:
483        uuid: system-uuid from dmi or /sys/hypervisor
484        uuid_source: 'hypervisor' (/sys/hypervisor/uuid) or 'dmi'
485        serial: dmi 'system-serial-number' (/sys/.../product_serial)
486
487     On Ec2 instances experimentation is that product_serial is upper case,
488     and product_uuid is lower case.  This returns lower case values for both.
489     """
490     data = {}
491     try:
492         uuid = util.load_file("/sys/hypervisor/uuid").strip()
493         data['uuid_source'] = 'hypervisor'
494     except Exception:
495         uuid = util.read_dmi_data('system-uuid')
496         data['uuid_source'] = 'dmi'
497
498     if uuid is None:
499         uuid = ''
500     data['uuid'] = uuid.lower()
501
502     serial = util.read_dmi_data('system-serial-number')
503     if serial is None:
504         serial = ''
505
506     data['serial'] = serial.lower()
507
508     return data
```

`/usr/lib/python2.7/site-packages/cloudinit/util.py`
```
1331 def load_file(fname, read_cb=None, quiet=False, decode=True):
1332     LOG.debug("Reading from %s (quiet=%s)", fname, quiet)
1333     ofh = six.BytesIO()
1334     try:
1335         with open(fname, 'rb') as ifh:
1336             pipe_in_out(ifh, ofh, chunk_cb=read_cb)
1337     except IOError as e:
1338         if not quiet:
1339             raise
1340         if e.errno != ENOENT:
1341             raise
1342     contents = ofh.getvalue()
1343     LOG.debug("Read %s bytes from %s", len(contents), fname)
1344     if decode:
1345         return decode_binary(contents)
1346     else:
1347         return contents
```
```console
# dmidecode
# dmidecode 3.0
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.
11 structures occupying 359 bytes.
Table at 0x000EB01F.

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
        Vendor: Xen
        Version: 4.2.amazon
        Release Date: 08/24/2006
        Address: 0xE8000
        Runtime Size: 96 kB
        ROM Size: 64 kB
        Characteristics:
                PCI is supported
                EDD is supported
                Targeted content distribution is supported
        BIOS Revision: 4.2

Handle 0x0100, DMI type 1, 27 bytes
System Information
        Manufacturer: Xen
        Product Name: HVM domU
        Version: 4.2.amazon
        Serial Number: ec23e5e6-3996-d6a8-c001-0cafdb88a415
        UUID: EC23E5E6-3996-D6A8-C001-0CAFDB88A415
```

```console
# cat /sys/hypervisor/uuid
ec23e5e6-3996-d6a8-c001-0cafdb88a415
```

`/usr/lib/python2.7/site-packages/cloudinit/util.py`
```
2649 def read_dmi_data(key):
2650     """
2651     Wrapper for reading DMI data.
2652
2653     If running in a container return None.  This is because DMI data is
2654     assumed to be not useful in a container as it does not represent the
2655     container but rather the host.
2656
2657     This will do the following (returning the first that produces a
2658     result):
2659         1) Use a mapping to translate `key` from dmidecode naming to
2660            sysfs naming and look in /sys/class/dmi/... for a value.
2661         2) Use `key` as a sysfs key directly and look in /sys/class/dmi/...
2662         3) Fall-back to passing `key` to `dmidecode --string`.
2663
2664     If all of the above fail to find a value, None will be returned.
2665     """
2666
2667     if is_container():
2668         return None
2669
2670     syspath_value = _read_dmi_syspath(key)
2671     if syspath_value is not None:
2672         return syspath_value
2673
2674     # running dmidecode can be problematic on some arches (LP: #1243287)
2675     uname_arch = os.uname()[4]
2676     if not (uname_arch == "x86_64" or
2677             (uname_arch.startswith("i") and uname_arch[2:] == "86") or
2678             uname_arch == 'aarch64' or
2679             uname_arch == 'amd64'):
2680         LOG.debug("dmidata is not supported on %s", uname_arch)
2681         return None
2682
2683     dmidecode_path = which('dmidecode')
2684     if dmidecode_path:
2685         return _call_dmidecode(key, dmidecode_path)
2686
2687     LOG.warning("did not find either path %s or dmidecode command",
2688                 DMI_SYS_PATH)
2689     return None
```

```
2115 def is_container():
2116     """
2117     Checks to see if this code running in a container of some sort
2118     """
2119
2120     for helper in CONTAINER_TESTS:
2121         try:
2122             # try to run a helper program. if it returns true/zero
2123             # then we're inside a container. otherwise, no
2124             subp(helper)
2125             return True
2126         except (IOError, OSError):
2127             pass
2128
2129     # this code is largely from the logic in
2130     # ubuntu's /etc/init/container-detect.conf
2131     try:
2132         # Detect old-style libvirt
2133         # Detect OpenVZ containers
2134         pid1env = get_proc_env(1)
2135         if "container" in pid1env:
2136             return True
2137         if "LIBVIRT_LXC_UUID" in pid1env:
2138             return True
2139     except (IOError, OSError):
2140         pass
```
```
  77 # Helper utils to see if running in a container
  78 CONTAINER_TESTS = (['systemd-detect-virt', '--quiet', '--container'],
  79                    ['running-in-container'],
  80                    ['lxc-is-container'])
```
```
2160 def get_proc_env(pid):
2161     """
2162     Return the environment in a dict that a given process id was started with.
2163     """
2164
2165     env = {}
2166     fn = os.path.join("/proc/", str(pid), "environ")
2167     try:
2168         contents = load_file(fn)
2169         toks = contents.split("\x00")
2170         for tok in toks:
2171             if tok == "":
2172                 continue
2173             (name, val) = tok.split("=", 1)
2174             if name:
2175                 env[name] = val
2176     except (IOError, OSError):
2177         pass
2178     return env
```

```
2598 def _read_dmi_syspath(key):
2599     """
2600     Reads dmi data with from /sys/class/dmi/id
2601     """
2602     if key not in DMIDECODE_TO_DMI_SYS_MAPPING:
2603         return None
2604     mapped_key = DMIDECODE_TO_DMI_SYS_MAPPING[key]
2605     dmi_key_path = "{0}/{1}".format(DMI_SYS_PATH, mapped_key)
2606     LOG.debug("querying dmi data %s", dmi_key_path)
2607     try:
2608         if not os.path.exists(dmi_key_path):
2609             LOG.debug("did not find %s", dmi_key_path)
2610             return None
2611
2612         key_data = load_file(dmi_key_path, decode=False)
2613         if not key_data:
2614             LOG.debug("%s did not return any data", dmi_key_path)
2615             return None
2616
2617         # uninitialized dmi values show as all \xff and /sys appends a '\n'.
2618         # in that event, return a string of '.' in the same length.
2619         if key_data == b'\xff' * (len(key_data) - 1) + b'\n':
2620             key_data = b""
2621
2622         str_data = key_data.decode('utf8').strip()
2623         LOG.debug("dmi data %s returned %s", dmi_key_path, str_data)
2624         return str_data
2625
2626     except Exception:
2627         logexc(LOG, "failed read of %s", dmi_key_path)
2628         return None
```
```
348     def _crawl_metadata(self):
349         """Crawl metadata service when available.
350
351         @returns: True on success, False otherwise.
352         """
353         if not self.wait_for_metadata_service():
354             return False
355         api_version = self.get_metadata_api_version()
356         try:
357             self.userdata_raw = ec2.get_instance_userdata(
358                 api_version, self.metadata_address)
359             self.metadata = ec2.get_instance_metadata(
360                 api_version, self.metadata_address)
361             if self.cloud_platform == Platforms.AWS:
362                 self.identity = ec2.get_instance_identity(
363                     api_version, self.metadata_address).get('document', {})
364         except Exception:
365             util.logexc(
366                 LOG, "Failed reading from metadata address %s",
367                 self.metadata_address)
368             return False
369         return True

```
`/usr/lib/python2.7/site-packages/cloudinit/sources/DataSourceEc2.py`
```
161     def wait_for_metadata_service(self):
162         mcfg = self.ds_cfg
163
164         url_params = self.get_url_params()
165         if url_params.max_wait_seconds <= 0:
166             return False
167
168         # Remove addresses from the list that wont resolve.
169         mdurls = mcfg.get("metadata_urls", self.metadata_urls)
170         filtered = [x for x in mdurls if util.is_resolvable_url(x)]
171
172         if set(filtered) != set(mdurls):
173             LOG.debug("Removed the following from metadata urls: %s",
174                       list((set(mdurls) - set(filtered))))
175
176         if len(filtered):
177             mdurls = filtered
178         else:
179             LOG.warning("Empty metadata url list! using default list")
180             mdurls = self.metadata_urls
181
182         urls = []
183         url2base = {}
184         for url in mdurls:
185             cur = '{0}/{1}/meta-data/instance-id'.format(
186                 url, self.min_metadata_version)
187             urls.append(cur)
188             url2base[cur] = url
189
190         start_time = time.time()
191         url = uhelp.wait_for_url(
192             urls=urls, max_wait=url_params.max_wait_seconds,
193             timeout=url_params.timeout_seconds, status_cb=LOG.warn)
194
195         if url:
196             self.metadata_address = url2base[url]
197             LOG.debug("Using metadata source: '%s'", self.metadata_address)
198         else:
199             LOG.critical("Giving up on md from %s after %s seconds",
200                          urls, int(time.time() - start_time))
201
202         return bool(url)
```
`/usr/lib/python2.7/site-packages/cloudinit/sources/__init__.py`
```
181     def get_url_params(self):
182         """Return the Datasource's prefered url_read parameters.
183
184         Subclasses may override url_max_wait, url_timeout, url_retries.
185
186         @return: A URLParams object with max_wait_seconds, timeout_seconds,
187             num_retries.
188         """
189         max_wait = self.url_max_wait
190         try:
191             max_wait = int(self.ds_cfg.get("max_wait", self.url_max_wait))
192         except ValueError:
193             util.logexc(
194                 LOG, "Config max_wait '%s' is not an int, using default '%s'",
195                 self.ds_cfg.get("max_wait"), max_wait)
196
197         timeout = self.url_timeout
198         try:
199             timeout = max(
200                 0, int(self.ds_cfg.get("timeout", self.url_timeout)))
201         except ValueError:
202             timeout = self.url_timeout
203             util.logexc(
204                 LOG, "Config timeout '%s' is not an int, using default '%s'",
205                 self.ds_cfg.get('timeout'), timeout)
206
207         retries = self.url_retries
208         try:
209             retries = int(self.ds_cfg.get("retries", self.url_retries))
210         except Exception:
211             util.logexc(
212                 LOG, "Config retries '%s' is not an int, using default '%s'",
213                 self.ds_cfg.get('retries'), retries)
214
215         return URLParams(max_wait, timeout, retries)
```
`/usr/lib/python2.7/site-packages/cloudinit/sources/DataSourceEc2.py`
```
 52     metadata_urls = ["http://169.254.169.254", "http://instance-data.:8773"]
```

`/usr/lib/python2.7/site-packages/cloudinit/util.py`
```
1196 def is_resolvable_url(url):
1197     """determine if this url is resolvable (existing or ip)."""
1198     return log_time(logfunc=LOG.debug, msg="Resolving URL: " + url,
1199                     func=is_resolvable,
1200                     args=(urlparse.urlparse(url).hostname,))
```
