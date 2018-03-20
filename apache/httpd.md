```
# httpd -t -D DUMP_VHOSTS
VirtualHost configuration:
*:80                   testserver (/etc/httpd/conf.d/virhost.conf:1)
```

```
# httpd -S
VirtualHost configuration:
*:80                   testserver (/etc/httpd/conf.d/virhost.conf:1)
ServerRoot: "/etc/httpd"
Main DocumentRoot: "/var/www/html"
Main ErrorLog: "/etc/httpd/logs/error_log"
Mutex default: dir="/var/run/httpd/" mechanism=default
Mutex mpm-accept: using_defaults
Mutex cache-socache: using_defaults
Mutex authdigest-opaque: using_defaults
Mutex watchdog-callback: using_defaults
Mutex proxy-balancer-shm: using_defaults
Mutex rewrite-map: using_defaults
Mutex authdigest-client: using_defaults
Mutex lua-ivm-shm: using_defaults
Mutex proxy: using_defaults
Mutex authn-socache: using_defaults
PidFile: "/var/run/httpd/httpd.pid"
Define: DUMP_VHOSTS
Define: DUMP_RUN_CFG
User: name="apache" id=48 not_used
Group: name="apache" id=48 not_used
```

```
# httpd -M
Loaded Modules:
 core_module (static)
 so_module (static)
 http_module (static)
 access_compat_module (shared)
 actions_module (shared)
 alias_module (shared)
 allowmethods_module (shared)
 auth_basic_module (shared)
 auth_digest_module (shared)
 authn_anon_module (shared)
 authn_core_module (shared)
 authn_dbd_module (shared)
 authn_dbm_module (shared)
 authn_file_module (shared)
 authn_socache_module (shared)
 authz_core_module (shared)
 authz_dbd_module (shared)
 authz_dbm_module (shared)
 authz_groupfile_module (shared)
 authz_host_module (shared)
 authz_owner_module (shared)
 authz_user_module (shared)
 autoindex_module (shared)
 cache_module (shared)
 cache_disk_module (shared)
 cache_socache_module (shared)
 data_module (shared)
 dbd_module (shared)
 deflate_module (shared)
 dir_module (shared)
 dumpio_module (shared)
 echo_module (shared)
 env_module (shared)
 expires_module (shared)
 ext_filter_module (shared)
 filter_module (shared)
 headers_module (shared)
 http2_module (shared)
 include_module (shared)
 info_module (shared)
 log_config_module (shared)
 logio_module (shared)
 macro_module (shared)
 mime_magic_module (shared)
 mime_module (shared)
 negotiation_module (shared)
 remoteip_module (shared)
 reqtimeout_module (shared)
 request_module (shared)
 rewrite_module (shared)
 setenvif_module (shared)
 slotmem_plain_module (shared)
 slotmem_shm_module (shared)
 socache_dbm_module (shared)
 socache_memcache_module (shared)
 socache_shmcb_module (shared)
 status_module (shared)
 substitute_module (shared)
 suexec_module (shared)
 unixd_module (shared)
 userdir_module (shared)
 version_module (shared)
 vhost_alias_module (shared)
 watchdog_module (shared)
 dav_module (shared)
 dav_fs_module (shared)
 dav_lock_module (shared)
 lua_module (shared)
 mpm_prefork_module (shared)
 proxy_module (shared)
 lbmethod_bybusyness_module (shared)
 lbmethod_byrequests_module (shared)
 lbmethod_bytraffic_module (shared)
 lbmethod_heartbeat_module (shared)
 proxy_ajp_module (shared)
 proxy_balancer_module (shared)
 proxy_connect_module (shared)
 proxy_express_module (shared)
 proxy_fcgi_module (shared)
 proxy_fdpass_module (shared)
 proxy_ftp_module (shared)
 proxy_http_module (shared)
 proxy_hcheck_module (shared)
 proxy_scgi_module (shared)
 proxy_wstunnel_module (shared)
 cgi_module (shared)
 php5_module (shared)
```

```
# httpd -t -D DUMP_MODULES
Loaded Modules:
 core_module (static)
 so_module (static)
 http_module (static)
 access_compat_module (shared)
 actions_module (shared)
 alias_module (shared)
 allowmethods_module (shared)
 auth_basic_module (shared)
 auth_digest_module (shared)
 authn_anon_module (shared)
 authn_core_module (shared)
 authn_dbd_module (shared)
 authn_dbm_module (shared)
 authn_file_module (shared)
 authn_socache_module (shared)
 authz_core_module (shared)
 authz_dbd_module (shared)
 authz_dbm_module (shared)
 authz_groupfile_module (shared)
 authz_host_module (shared)
 authz_owner_module (shared)
 authz_user_module (shared)
 autoindex_module (shared)
 cache_module (shared)
 cache_disk_module (shared)
 cache_socache_module (shared)
 data_module (shared)
 dbd_module (shared)
 deflate_module (shared)
 dir_module (shared)
 dumpio_module (shared)
 echo_module (shared)
 env_module (shared)
 expires_module (shared)
 ext_filter_module (shared)
 filter_module (shared)
 headers_module (shared)
 http2_module (shared)
 include_module (shared)
 info_module (shared)
 log_config_module (shared)
 logio_module (shared)
 macro_module (shared)
 mime_magic_module (shared)
 mime_module (shared)
 negotiation_module (shared)
 remoteip_module (shared)
 reqtimeout_module (shared)
 request_module (shared)
 rewrite_module (shared)
 setenvif_module (shared)
 slotmem_plain_module (shared)
 slotmem_shm_module (shared)
 socache_dbm_module (shared)
 socache_memcache_module (shared)
 socache_shmcb_module (shared)
 status_module (shared)
 substitute_module (shared)
 suexec_module (shared)
 unixd_module (shared)
 userdir_module (shared)
 version_module (shared)
 vhost_alias_module (shared)
 watchdog_module (shared)
 dav_module (shared)
 dav_fs_module (shared)
 dav_lock_module (shared)
 lua_module (shared)
 mpm_prefork_module (shared)
 proxy_module (shared)
 lbmethod_bybusyness_module (shared)
 lbmethod_byrequests_module (shared)
 lbmethod_bytraffic_module (shared)
 lbmethod_heartbeat_module (shared)
 proxy_ajp_module (shared)
 proxy_balancer_module (shared)
 proxy_connect_module (shared)
 proxy_express_module (shared)
 proxy_fcgi_module (shared)
 proxy_fdpass_module (shared)
 proxy_ftp_module (shared)
 proxy_http_module (shared)
 proxy_hcheck_module (shared)
 proxy_scgi_module (shared)
 proxy_wstunnel_module (shared)
 cgi_module (shared)
 php5_module (shared)
```

```
# service httpd configtest
Syntax OK
```
