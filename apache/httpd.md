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
```
# httpd -t
Syntax OK
```

```
# httpd -t -D DUMP_INCLUDES
Included configuration files:
  (*) /etc/httpd/conf/httpd.conf
    (56) /etc/httpd/conf.modules.d/00-base.conf
    (56) /etc/httpd/conf.modules.d/00-dav.conf
    (56) /etc/httpd/conf.modules.d/00-lua.conf
    (56) /etc/httpd/conf.modules.d/00-mpm.conf
    (56) /etc/httpd/conf.modules.d/00-optional.conf
    (56) /etc/httpd/conf.modules.d/00-proxy.conf
    (56) /etc/httpd/conf.modules.d/01-cgi.conf
    (56) /etc/httpd/conf.modules.d/10-php.conf
    (353) /etc/httpd/conf.d/autoindex.conf
    (353) /etc/httpd/conf.d/notrace.conf
    (353) /etc/httpd/conf.d/php.conf
    (353) /etc/httpd/conf.d/userdir.conf
    (353) /etc/httpd/conf.d/virhost.conf
    (353) /etc/httpd/conf.d/welcome.conf
```
```
# httpd -T
httpd (pid 24295) already running
```

```
# httpd -V
Server version: Apache/2.4.27 (Amazon)
Server built:   Sep 24 2017 23:19:50
Server's Module Magic Number: 20120211:68
Server loaded:  APR 1.5.2, APR-UTIL 1.5.4
Compiled using: APR 1.5.1, APR-UTIL 1.4.1
Architecture:   64-bit
Server MPM:     prefork
  threaded:     no
    forked:     yes (variable process count)
Server compiled with....
 -D APR_HAS_SENDFILE
 -D APR_HAS_MMAP
 -D APR_HAVE_IPV6 (IPv4-mapped addresses enabled)
 -D APR_USE_SYSVSEM_SERIALIZE
 -D APR_USE_PTHREAD_SERIALIZE
 -D SINGLE_LISTEN_UNSERIALIZED_ACCEPT
 -D APR_HAS_OTHER_CHILD
 -D AP_HAVE_RELIABLE_PIPED_LOGS
 -D DYNAMIC_MODULE_LIMIT=256
 -D HTTPD_ROOT="/etc/httpd"
 -D SUEXEC_BIN="/usr/sbin/suexec"
 -D DEFAULT_PIDLOG="/var/run/httpd/httpd.pid"
 -D DEFAULT_SCOREBOARD="logs/apache_runtime_status"
 -D DEFAULT_ERRORLOG="logs/error_log"
 -D AP_TYPES_CONFIG_FILE="conf/mime.types"
 -D SERVER_CONFIG_FILE="conf/httpd.conf"
```

```
# httpd -l
Compiled in modules:
  core.c
  mod_so.c
  http_core.c
```
```
# httpd -L
<Directory (core.c)
        Container for directives affecting resources located in the specified directories
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<Location (core.c)
        Container for directives affecting resources accessed through the specified URL paths
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<VirtualHost (core.c)
        Container to map directives to a particular virtual host, takes one or more host addresses
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<Files (core.c)
        Container for directives affecting files matching specified patterns
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<Limit (core.c)
        Container for authentication directives when accessed using specified HTTP methods
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig or Limit
<LimitExcept (core.c)
        Container for authentication directives to be applied when any HTTP method other than those specified is used to access the resource
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig or Limit
<IfModule (core.c)
        Container for directives based on existence of specified modules
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<IfDefine (core.c)
        Container for directives based on existence of command line defines
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<DirectoryMatch (core.c)
        Container for directives affecting resources located in the specified directories
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<LocationMatch (core.c)
        Container for directives affecting resources accessed through the specified URL paths
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<FilesMatch (core.c)
        Container for directives affecting files matching specified patterns
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
AddDefaultCharset (core.c)
        The name of the default charset to add to any Content-Type without one or 'Off' to disable
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AcceptPathInfo (core.c)
        Set to on or off for PATH_INFO to be accepted by handlers, or default for the per-handler preference
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
Define (core.c)
        Define a variable, optionally to a value.  Same as passing -D to the command line.
        Allowed in *.conf anywhere
UnDefine (core.c)
        Undefine the existence of a variable. Undo a Define.
        Allowed in *.conf anywhere
Error (core.c)
        Generate error message from within configuration
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<If (core.c)
        Container for directives to be conditionally applied
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<ElseIf (core.c)
        Container for directives to be conditionally applied
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<Else (core.c)
        Container for directives to be conditionally applied
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
AccessFileName (core.c)
        Name(s) of per-directory config files (default: .htaccess)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DocumentRoot (core.c)
        Root directory of the document tree
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ErrorDocument (core.c)
        Change responses for HTTP errors
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AllowOverride (core.c)
        Controls what groups of directives can be configured by per-directory config files
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AllowOverrideList (core.c)
        Controls what individual directives can be configured by per-directory config files
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
Options (core.c)
        Set a number of attributes for a given directory
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
DefaultType (core.c)
        the default media type for otherwise untyped files (DEPRECATED)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
FileETag (core.c)
        Specify components used to construct a file's ETag
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
EnableMMAP (core.c)
        Controls whether memory-mapping may be used to read files
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
EnableSendfile (core.c)
        Controls whether sendfile may be used to transmit files
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
Protocol (core.c)
        Set the Protocol for httpd to use.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AcceptFilter (core.c)
        Set the Accept Filter to use for a protocol
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Port (core.c)
        Port was replaced with Listen in Apache 2.0
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
HostnameLookups (core.c)
        "on" to enable, "off" to disable reverse DNS lookups, or "double" to enable double-reverse DNS lookups
        Allowed in *.conf anywhere
ServerAdmin (core.c)
        The email address of the server administrator
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerName (core.c)
        The hostname and port of the server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerSignature (core.c)
        En-/disable server signature (on|off|email)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
ServerRoot (core.c)
        Common directory of server-related files (logs, confs, etc.)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DefaultRuntimeDir (core.c)
        Common directory for run-time files (shared memory, locks, etc.)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ErrorLog (core.c)
        The filename of the error log
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ErrorLogFormat (core.c)
        Format string for the ErrorLog
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerAlias (core.c)
        A name or names alternately used to access the server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerPath (core.c)
        The pathname the server can be reached at
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Timeout (core.c)
        Timeout duration (sec)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ContentDigest (core.c)
        whether or not to send a Content-MD5 header with each request
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
UseCanonicalName (core.c)
        How to work out the ServerName : Port when constructing URLs
        Allowed in *.conf anywhere
UseCanonicalPhysicalPort (core.c)
        Whether to use the physical Port when constructing URLs
        Allowed in *.conf anywhere
Include (core.c)
        Name(s) of the config file(s) to be included; fails if the wildcard does not match at least one file
        Allowed in *.conf anywhere
IncludeOptional (core.c)
        Name or pattern of the config file(s) to be included; ignored if the file does not exist or the pattern does not match any files
        Allowed in *.conf anywhere
LogLevel (core.c)
        Level of verbosity in error logging
        Allowed in *.conf anywhere
NameVirtualHost (core.c)
        A numeric IP address:port, or the name of a host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerTokens (core.c)
        Determine tokens displayed in the Server: header - Min(imal), Major, Minor, Prod(uctOnly), OS, or Full
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LimitRequestLine (core.c)
        Limit on maximum size of an HTTP request line
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LimitRequestFieldsize (core.c)
        Limit on maximum size of an HTTP request header field
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LimitRequestFields (core.c)
        Limit (0 = unlimited) on max number of header fields in a request message
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LimitRequestBody (core.c)
        Limit (in bytes) on maximum size of request message body
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LimitXMLRequestBody (core.c)
        Limit (in bytes) on maximum size of an XML-based request body
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
Mutex (core.c)
        mutex (or "default") and mechanism
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxRanges (core.c)
        Maximum number of Ranges in a request before returning the entire resource, or 0 for unlimited
        Allowed in *.conf anywhere
MaxRangeOverlaps (core.c)
        Maximum number of overlaps in Ranges in a request before returning the entire resource, or 0 for unlimited
        Allowed in *.conf anywhere
MaxRangeReversals (core.c)
        Maximum number of reversals in Ranges in a request before returning the entire resource, or 0 for unlimited
        Allowed in *.conf anywhere
RLimitCPU (core.c)
        Soft/hard limits for max CPU usage in seconds
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
RLimitMEM (core.c)
        Soft/hard limits for max memory usage per process
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
RLimitNPROC (core.c)
        soft/hard limits for max number of processes per uid
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LimitInternalRecursion (core.c)
        maximum recursion depth of internal redirects and subrequests
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CGIPassAuth (core.c)
        Controls whether HTTP authorization headers, normally hidden, will be passed to scripts
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
CGIVar (core.c)
        Controls how some CGI variables are set
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
QualifyRedirectURL (core.c)
        Controls whether HTTP authorization headers, normally hidden, will be passed to scripts
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
ForceType (core.c)
        a mime type that overrides other configured type
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetHandler (core.c)
        a handler name that overrides any other configured handler
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetOutputFilter (core.c)
        filter (or ; delimited list of filters) to be run on the request content
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetInputFilter (core.c)
        filter (or ; delimited list of filters) to be run on the request body
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AllowEncodedSlashes (core.c)
        Allow URLs containing '/' encoded as '%2F'
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScoreBoardFile (core.c)
        A file for Apache to maintain runtime process management information
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ExtendedStatus (core.c)
        "On" to track extended status information, "Off" to disable
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SeeRequestTail (core.c)
        For extended status, "On" to see the last 63 chars of the request line, "Off" (default) to see the first 63
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
PidFile (core.c)
        A file for logging the server process ID
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxRequestsPerChild (core.c)
        Maximum number of connections a particular child serves before dying. (DEPRECATED, use MaxConnectionsPerChild)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxConnectionsPerChild (core.c)
        Maximum number of connections a particular child serves before dying.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CoreDumpDirectory (core.c)
        The location of the directory Apache changes to before dumping core
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxMemFree (core.c)
        Maximum number of 1k blocks a particular child's allocator may hold.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ThreadStackSize (core.c)
        Size in bytes of stack used by threads handling client connections
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
TraceEnable (core.c)
        'on' (default), 'off' or 'extended' to trace request body content
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MergeTrailers (core.c)
        merge request trailers into request headers or not
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Protocols (core.c)
        Controls which protocols are allowed
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProtocolsHonorOrder (core.c)
        'off' (default) or 'on' to respect given order of protocols, by default the client specified order determines selection
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
HttpProtocolOptions (core.c)
        'Allow0.9' or 'Require1.0' (default); 'RegisteredMethods' or 'LenientMethods' (default); 'Unsafe' or 'Strict' (default). Sets HTTP acceptance rules
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RegisterHttpMethod (core.c)
        Registers non-standard HTTP methods
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LoadModule (mod_so.c)
        a module name and the name of a shared object file to load it from
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LoadFile (mod_so.c)
        shared object file or library to load into the server at runtime
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
KeepAliveTimeout (http_core.c)
        Keep-Alive timeout duration (sec)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxKeepAliveRequests (http_core.c)
        Maximum number of Keep-Alive requests per connection, or 0 for infinite
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
KeepAlive (http_core.c)
        Whether persistent connections should be On or Off
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
order (mod_access_compat.c)
        'allow,deny', 'deny,allow', or 'mutual-failure'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
allow (mod_access_compat.c)
        'from' followed by hostnames or IP-address wildcards
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
deny (mod_access_compat.c)
        'from' followed by hostnames or IP-address wildcards
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
Satisfy (mod_access_compat.c)
        access policy if both allow and require used ('all' or 'any')
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
Action (mod_actions.c)
        a media type followed by a script name
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
Script (mod_actions.c)
        a method followed by a script name
        Allowed in *.conf anywhere
Alias (mod_alias.c)
        a fakename and a realname, or a realname in a Location
        Allowed in *.conf anywhere
ScriptAlias (mod_alias.c)
        a fakename and a realname, or a realname in a Location
        Allowed in *.conf anywhere
Redirect (mod_alias.c)
        an optional status, then document to be redirected and destination URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AliasMatch (mod_alias.c)
        a regular expression and a filename
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptAliasMatch (mod_alias.c)
        a regular expression and a filename
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RedirectMatch (mod_alias.c)
        an optional status, then a regular expression and destination URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RedirectTemp (mod_alias.c)
        a document to be redirected, then the destination URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RedirectPermanent (mod_alias.c)
        a document to be redirected, then the destination URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AllowMethods (mod_allowmethods.c)
        only allow specific methods
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthBasicProvider (mod_auth_basic.c)
        specify the auth providers for a directory or location
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthBasicAuthoritative (mod_auth_basic.c)
        Set to 'Off' to allow access control to be passed along to lower modules if the UserID is not known to this module
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthBasicFake (mod_auth_basic.c)
        Fake basic authentication using the given expressions for username and password, 'off' to disable. Password defaults to 'password' if missing.
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthBasicUseDigestAlgorithm (mod_auth_basic.c)
        Set to 'MD5' to use the auth provider's authentication check for digest auth, using a hash of 'user:realm:pass'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthName (mod_auth_digest.c)
        The authentication realm (e.g. "Members Only")
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestProvider (mod_auth_digest.c)
        specify the auth providers for a directory or location
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestQop (mod_auth_digest.c)
        A list of quality-of-protection options
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestNonceLifetime (mod_auth_digest.c)
        Maximum lifetime of the server nonce (seconds)
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestNonceFormat (mod_auth_digest.c)
        The format to use when generating the server nonce
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestNcCheck (mod_auth_digest.c)
        Whether or not to check the nonce-count sent by the client
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestAlgorithm (mod_auth_digest.c)
        The algorithm used for the hash calculation
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestDomain (mod_auth_digest.c)
        A list of URI's which belong to the same protection space as the current URI
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDigestShmemSize (mod_auth_digest.c)
        The amount of shared memory to allocate for keeping track of clients
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Anonymous (mod_authn_anon.c)
        a space-separated list of user IDs
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
Anonymous_MustGiveEmail (mod_authn_anon.c)
        Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
Anonymous_NoUserId (mod_authn_anon.c)
        Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
Anonymous_VerifyEmail (mod_authn_anon.c)
        Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
Anonymous_LogEmail (mod_authn_anon.c)
        Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthType (mod_authn_core.c)
        an HTTP authorization type (e.g., "Basic")
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthName (mod_authn_core.c)
        the authentication realm (e.g. "Members Only")
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
<AuthnProviderAlias (mod_authn_core.c)
        container for grouping an authentication provider's directives under a provider alias
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AuthDBDUserPWQuery (mod_authn_dbd.c)
        Query used to fetch password for user
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthDBDUserRealmQuery (mod_authn_dbd.c)
        Query used to fetch password for user+realm
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthDBMUserFile (mod_authn_dbm.c)
        dbm database file containing user IDs and passwords
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthDBMType (mod_authn_dbm.c)
        what type of DBM file the user file is
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthUserFile (mod_authn_file.c)
        text file containing user IDs and passwords
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthnCacheSOCache (mod_authn_socache.c)
        socache provider for authn cache
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AuthnCacheEnable (mod_authn_socache.c)
        enable socache configuration in htaccess even if not enabled anywhere else
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AuthnCacheProvideFor (mod_authn_socache.c)
        Determine what authn providers to cache for
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthnCacheTimeout (mod_authn_socache.c)
        Timeout (secs) for cached credentials
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthnCacheContext (mod_authn_socache.c)
        Context for authn cache
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
<AuthzProviderAlias (mod_authz_core.c)
        container for grouping an authorization provider's directives under a provider alias
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Require (mod_authz_core.c)
        specifies authorization directives which one must pass (or not) for a request to suceeed
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
<RequireAll (mod_authz_core.c)
        container for grouping authorization directives of which none must fail and at least one must pass for a request to succeed
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
<RequireAny (mod_authz_core.c)
        container for grouping authorization directives of which one must pass for a request to succeed
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
<RequireNone (mod_authz_core.c)
        container for grouping authorization directives of which none must pass for a request to succeed
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthMerging (mod_authz_core.c)
        controls how a <Directory>, <Location>, or similar directive's authorization directives are combined with those of its predecessor
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthzSendForbiddenOnFailure (mod_authz_core.c)
        Controls if an authorization failure should result in a '403 FORBIDDEN' response instead of the HTTP-conforming '401 UNAUTHORIZED'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthzDBDLoginToReferer (mod_authz_dbd.c)
        Whether to redirect to referer on successful login
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthzDBDQuery (mod_authz_dbd.c)
        SQL query for DBD Authz or login
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthzDBDRedirectQuery (mod_authz_dbd.c)
        SQL query to get per-user redirect URL after login
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
AuthDBMGroupFile (mod_authz_dbm.c)
        database file containing group names and member user IDs
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthzDBMType (mod_authz_dbm.c)
        what type of DBM file the group file is
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AuthGroupFile (mod_authz_groupfile.c)
        text file containing group names and member user IDs
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes AuthConfig
AddIcon (mod_autoindex.c)
        an icon URL followed by one or more filenames
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddIconByType (mod_autoindex.c)
        an icon URL followed by one or more MIME types
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddIconByEncoding (mod_autoindex.c)
        an icon URL followed by one or more content encodings
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddAlt (mod_autoindex.c)
        alternate descriptive text followed by one or more filenames
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddAltByType (mod_autoindex.c)
        alternate descriptive text followed by one or more MIME types
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddAltByEncoding (mod_autoindex.c)
        alternate descriptive text followed by one or more content encodings
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexOptions (mod_autoindex.c)
        one or more index options [+|-][]
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexOrderDefault (mod_autoindex.c)
        {Ascending,Descending} {Name,Size,Description,Date}
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexIgnore (mod_autoindex.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexIgnoreReset (mod_autoindex.c)
        Reset the inherited list of IndexIgnore filenames
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
AddDescription (mod_autoindex.c)
        Descriptive text followed by one or more filenames
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
HeaderName (mod_autoindex.c)
        a filename
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
ReadmeName (mod_autoindex.c)
        a filename
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
FancyIndexing (mod_autoindex.c)
        The FancyIndexing directive is no longer supported. Use IndexOptions FancyIndexing.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
DefaultIcon (mod_autoindex.c)
        an icon URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexStyleSheet (mod_autoindex.c)
        URL to style sheet
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
IndexHeadInsert (mod_autoindex.c)
        String to insert in HTML HEAD section
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
CacheEnable (mod_cache.c)
        A cache type and partial URL prefix below which caching is enabled
        Allowed in *.conf anywhere
CacheDisable (mod_cache.c)
        A partial URL prefix below which caching is disabled
        Allowed in *.conf anywhere
CacheMaxExpire (mod_cache.c)
        The maximum time in seconds to cache a document
        Allowed in *.conf anywhere
CacheMinExpire (mod_cache.c)
        The minimum time in seconds to cache a document
        Allowed in *.conf anywhere
CacheDefaultExpire (mod_cache.c)
        The default time in seconds to cache a document
        Allowed in *.conf anywhere
CacheQuickHandler (mod_cache.c)
        Run the cache in the quick handler, default on
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheIgnoreNoLastMod (mod_cache.c)
        Ignore Responses where there is no Last Modified Header
        Allowed in *.conf anywhere
CacheIgnoreCacheControl (mod_cache.c)
        Ignore requests from the client for uncached content
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheStoreExpired (mod_cache.c)
        Ignore expiration dates when populating cache, resulting in an If-Modified-Since request to the backend on retrieval
        Allowed in *.conf anywhere
CacheStorePrivate (mod_cache.c)
        Ignore 'Cache-Control: private' and store private content
        Allowed in *.conf anywhere
CacheStoreNoStore (mod_cache.c)
        Ignore 'Cache-Control: no-store' and store sensitive content
        Allowed in *.conf anywhere
CacheIgnoreHeaders (mod_cache.c)
        A space separated list of headers that should not be stored by the cache
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheIgnoreQueryString (mod_cache.c)
        Ignore query-string when caching
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheIgnoreURLSessionIdentifiers (mod_cache.c)
        A space separated list of session identifiers that should be ignored for creating the key of the cached entity.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheLastModifiedFactor (mod_cache.c)
        The factor used to estimate Expires date from LastModified date
        Allowed in *.conf anywhere
CacheLock (mod_cache.c)
        Enable or disable the thundering herd lock.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheLockPath (mod_cache.c)
        The thundering herd lock path. Defaults to the '/mod_cache-lock' directory in the system temp directory.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheLockMaxAge (mod_cache.c)
        Maximum age of any thundering herd lock.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheHeader (mod_cache.c)
        Add a X-Cache header to responses. Default is off.
        Allowed in *.conf anywhere
CacheDetailHeader (mod_cache.c)
        Add a X-Cache-Detail header to responses. Default is off.
        Allowed in *.conf anywhere
CacheKeyBaseURL (mod_cache.c)
        Override the base URL of reverse proxied cache keys.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheStaleOnError (mod_cache.c)
        Serve stale content on 5xx errors if present. Defaults to on.
        Allowed in *.conf anywhere
CacheRoot (mod_cache_disk.c)
        The directory to store cache files
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheDirLevels (mod_cache_disk.c)
        The number of levels of subdirectories in the cache
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheDirLength (mod_cache_disk.c)
        The number of characters in subdirectory names
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheMinFileSize (mod_cache_disk.c)
        The minimum file size to cache a document
        Allowed in *.conf anywhere
CacheMaxFileSize (mod_cache_disk.c)
        The maximum file size to cache a document
        Allowed in *.conf anywhere
CacheReadSize (mod_cache_disk.c)
        The maximum quantity of data to attempt to read and cache in one go
        Allowed in *.conf anywhere
CacheReadTime (mod_cache_disk.c)
        The maximum time taken to attempt to read and cache in go
        Allowed in *.conf anywhere
CacheSocache (mod_cache_socache.c)
        The shared object cache to store cache files
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CacheSocacheMaxTime (mod_cache_socache.c)
        The maximum cache expiry age to cache a document in seconds
        Allowed in *.conf anywhere
CacheSocacheMinTime (mod_cache_socache.c)
        The minimum cache expiry age to cache a document in seconds
        Allowed in *.conf anywhere
CacheSocacheMaxSize (mod_cache_socache.c)
        The maximum cache entry size (headers and body) to cache a document
        Allowed in *.conf anywhere
CacheSocacheReadSize (mod_cache_socache.c)
        The maximum quantity of data to attempt to read and cache in one go
        Allowed in *.conf anywhere
CacheSocacheReadTime (mod_cache_socache.c)
        The maximum time taken to attempt to read and cache in go
        Allowed in *.conf anywhere
DBDriver (mod_dbd.c)
        SQL Driver
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDParams (mod_dbd.c)
        SQL Driver Params
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDPersist (mod_dbd.c)
        Use persistent connection/pool
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDPrepareSQL (mod_dbd.c)
        SQL statement to prepare (or nothing, to override statement inherited from main server) and label
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDInitSQL (mod_dbd.c)
        SQL statement to be executed after connection is created
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDMin (mod_dbd.c)
        Minimum number of connections
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDKeep (mod_dbd.c)
        Maximum number of sustained connections
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDMax (mod_dbd.c)
        Maximum number of connections
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DBDExptime (mod_dbd.c)
        Keepalive time for idle connections
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateFilterNote (mod_deflate.c)
        Set a note to report on compression ratio
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateWindowSize (mod_deflate.c)
        Set the Deflate window size (1-15)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateBufferSize (mod_deflate.c)
        Set the Deflate Buffer Size
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateMemLevel (mod_deflate.c)
        Set the Deflate Memory Level (1-9)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateCompressionLevel (mod_deflate.c)
        Set the Deflate Compression Level (1-9)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DeflateInflateLimitRequestBody (mod_deflate.c)
        Set a limit on size of inflated input
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
DeflateInflateRatioLimit (mod_deflate.c)
        Set the inflate ratio limit above which inflation is aborted (default: 200)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
DeflateInflateRatioBurst (mod_deflate.c)
        Set the maximum number of following inflate ratios above limit (default: 3)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
FallbackResource (mod_dir.c)
        Set a default handler
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
DirectoryIndex (mod_dir.c)
        a list of file names
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
DirectorySlash (mod_dir.c)
        On or Off
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
DirectoryCheckHandler (mod_dir.c)
        On or Off
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
DirectoryIndexRedirect (mod_dir.c)
        On, Off, or a 3xx status code.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
DumpIOInput (mod_dumpio.c)
        Enable I/O Dump on Input Data
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DumpIOOutput (mod_dumpio.c)
        Enable I/O Dump on Output Data
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProtocolEcho (mod_echo.c)
        Run an echo server on this host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
PassEnv (mod_env.c)
        a list of environment variables to pass to CGI.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetEnv (mod_env.c)
        an environment variable name and optional value to pass to CGI.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
UnsetEnv (mod_env.c)
        a list of variables to remove from the CGI environment.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
ExpiresActive (mod_expires.c)
        Limited to 'on' or 'off'
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
ExpiresByType (mod_expires.c)
        a MIME type followed by an expiry date code
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
ExpiresDefault (mod_expires.c)
        an expiry date code
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Indexes
ExtFilterOptions (mod_ext_filter.c)
        valid options: LogStderr, NoLogStderr
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
ExtFilterDefine (mod_ext_filter.c)
        Define an external filter
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
FilterDeclare (mod_filter.c)
        filter-name [filter-type]
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
FilterProvider (mod_filter.c)
        filter-name provider-name match-expression
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
FilterChain (mod_filter.c)
        list of filter names with optional [+-=!@]
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
FilterTrace (mod_filter.c)
        filter-name debug-level
        Allowed in *.conf anywhere
AddOutputFilterByType (mod_filter.c)
        output filter name followed by one or more content-types
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
FilterProtocol (mod_filter.c)
        filter-name [provider-name] protocol-args
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
Header (mod_headers.c)
        an optional condition, an action, header and value followed by optional env clause
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RequestHeader (mod_headers.c)
        an action, header and value followed by optional env clause
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
H2MaxSessionStreams (mod_http2.c)
        maximum number of open streams per session
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2WindowSize (mod_http2.c)
        window size on client DATA
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2MinWorkers (mod_http2.c)
        minimum number of worker threads per child
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2MaxWorkers (mod_http2.c)
        maximum number of worker threads per child
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2MaxWorkerIdleSeconds (mod_http2.c)
        maximum number of idle seconds before a worker shuts down
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2StreamMaxMemSize (mod_http2.c)
        maximum number of bytes buffered in memory for a stream
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2AltSvc (mod_http2.c)
        adds an Alt-Svc for this server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2AltSvcMaxAge (mod_http2.c)
        set the maximum age (in seconds) that client can rely on alt-svc information
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2SerializeHeaders (mod_http2.c)
        on to enable header serialization for compatibility
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2ModernTLSOnly (mod_http2.c)
        off to not impose RFC 7540 restrictions on TLS
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2Upgrade (mod_http2.c)
        on to allow HTTP/1 Upgrades to h2/h2c
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2Direct (mod_http2.c)
        on to enable direct HTTP/2 mode
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2SessionExtraFiles (mod_http2.c)
        number of extra file a session might keep open (obsolete)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2TLSWarmUpSize (mod_http2.c)
        number of bytes on TLS connection before doing max writes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2TLSCoolDownSecs (mod_http2.c)
        seconds of idle time on TLS before shrinking writes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2Push (mod_http2.c)
        off to disable HTTP/2 server push
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2PushPriority (mod_http2.c)
        define priority of PUSHed resources per content type
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2PushDiarySize (mod_http2.c)
        size of push diary
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
H2CopyFiles (mod_http2.c)
        on to perform copy of file data
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
H2PushResource (mod_http2.c)
        add a resource to be pushed in this location/on this server.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
H2EarlyHints (mod_http2.c)
        on to enable interim status 103 responses
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
XBitHack (mod_include.c)
        Off, On, or Full
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
SSIErrorMsg (mod_include.c)
        a string
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
SSITimeFormat (mod_include.c)
        a strftime(3) formatted string
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
SSIStartTag (mod_include.c)
        SSI Start String Tag
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SSIEndTag (mod_include.c)
        SSI End String Tag
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SSIUndefinedEcho (mod_include.c)
        String to be displayed if an echoed variable is undefined
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
SSILegacyExprParser (mod_include.c)
        Whether to use the legacy expression parser compatible with <= 2.2.x. Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
SSILastModified (mod_include.c)
        Whether to set the last modified header or respect an existing header. Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
SSIEtag (mod_include.c)
        Whether to allow the generation of ETags within the server. Existing ETags will be preserved. Limited to 'on' or 'off'
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If> and in .htaccess
        when AllowOverride includes Limit
AddModuleInfo (mod_info.c)
        a module name and additional information on that module
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
CustomLog (mod_log_config.c)
        a file name, a custom log format string or format name, and an optional "env=" or "expr=" clause (see docs)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
GlobalLog (mod_log_config.c)
        Same as CustomLog, but forces virtualhosts to inherit the log
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
TransferLog (mod_log_config.c)
        the filename of the access log
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LogFormat (mod_log_config.c)
        a log format string (see docs) and an optional format name
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BufferedLogs (mod_log_config.c)
        Enable Buffered Logging (experimental)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LogIOTrackTTFB (mod_logio.c)
        Set to 'ON' to enable tracking time to first byte
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<Macro (mod_macro.c)
        Beginning of a macro definition section.
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride isn't None
Use (mod_macro.c)
        Use of a macro.
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride isn't None
UndefMacro (mod_macro.c)
        Remove a macro definition.
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride isn't None
MimeMagicFile (mod_mime_magic.c)
        Path to MIME Magic file (in file(1) format)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AddCharset (mod_mime.c)
        a charset (e.g., iso-2022-jp), followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddEncoding (mod_mime.c)
        an encoding (e.g., gzip), followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddHandler (mod_mime.c)
        a handler name followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddInputFilter (mod_mime.c)
        input filter name (or ; delimited names) followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddLanguage (mod_mime.c)
        a language (e.g., fr), followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddOutputFilter (mod_mime.c)
        output filter name (or ; delimited names) followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
AddType (mod_mime.c)
        a mime type followed by one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
DefaultLanguage (mod_mime.c)
        language to use for documents with no other language file extension
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
MultiviewsMatch (mod_mime.c)
        NegotiatedOnly (default), Handlers and/or Filters, or Any
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveCharset (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveEncoding (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveHandler (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveInputFilter (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveLanguage (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveOutputFilter (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoveType (mod_mime.c)
        one or more file extensions
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
TypesConfig (mod_mime.c)
        the MIME types config file
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ModMimeUsePathInfo (mod_mime.c)
        Set to 'yes' to allow mod_mime to use path info for type checking
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
CacheNegotiatedDocs (mod_negotiation.c)
        Either 'on' or 'off' (default)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LanguagePriority (mod_negotiation.c)
        space-delimited list of MIME language abbreviations
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
ForceLanguagePriority (mod_negotiation.c)
        Force LanguagePriority elections, either None, or Fallback and/or Prefer
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RemoteIPHeader (mod_remoteip.c)
        Specifies a request header to trust as the client IP, e.g. X-Forwarded-For
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RemoteIPProxiesHeader (mod_remoteip.c)
        Specifies a request header to record proxy IP's, e.g. X-Forwarded-By; if not given then do not record
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RemoteIPTrustedProxy (mod_remoteip.c)
        Specifies one or more proxies which are trusted to present IP headers
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RemoteIPInternalProxy (mod_remoteip.c)
        Specifies one or more internal (transparent) proxies which are trusted to present IP headers
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RemoteIPTrustedProxyList (mod_remoteip.c)
        The filename to read the list of trusted proxies, see the RemoteIPTrustedProxy directive
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RemoteIPInternalProxyList (mod_remoteip.c)
        The filename to read the list of internal proxies, see the RemoteIPInternalProxy directive
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
RequestReadTimeout (mod_reqtimeout.c)
        Set various timeout parameters for reading request headers and body
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
KeptBodySize (mod_request.c)
        Maximum size of request bodies kept aside for use by filters
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
RewriteEngine (mod_rewrite.c)
        On or Off to enable or disable (default) the whole rewriting engine
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RewriteOptions (mod_rewrite.c)
        List of option strings to set
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RewriteBase (mod_rewrite.c)
        the base URL of the per-directory context
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RewriteCond (mod_rewrite.c)
        an input string and a to be applied regexp-pattern
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RewriteRule (mod_rewrite.c)
        an URL-applied regexp-pattern and a substitution URL
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
RewriteMap (mod_rewrite.c)
        a mapname and a filename
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SetEnvIf (mod_setenvif.c)
        A header-name, regex and a list of variables.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetEnvIfNoCase (mod_setenvif.c)
        a header-name, regex and a list of variables.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SetEnvIfExpr (mod_setenvif.c)
        an expression and a list of variables.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
BrowserMatch (mod_setenvif.c)
        A browser regex and a list of variables.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
BrowserMatchNoCase (mod_setenvif.c)
        A browser regex and a list of variables.
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
MemcacheConnTTL (mod_socache_memcache.c)
        TTL used for the connection with the memcache server(s)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Substitute (mod_substitute.c)
        Pattern to filter the response content (s/foo/bar/[inf])
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SubstituteMaxLineLength (mod_substitute.c)
        Maximum line length
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SubstituteInheritBefore (mod_substitute.c)
        Apply inherited patterns before those of the current context
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
SuexecUserGroup (mod_suexec.c)
        User and group for spawned processes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
User (mod_unixd.c)
        Effective user id for this server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Group (mod_unixd.c)
        Effective group id for this server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ChrootDir (mod_unixd.c)
        The directory to chroot(2) into
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Suexec (mod_unixd.c)
        Enable or disable suEXEC support
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
UserDir (mod_userdir.c)
        the public subdirectory in users' home directories, or 'disabled', or 'disabled username username...', or 'enabled username username...'
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<IfVersion (mod_version.c)
        a comparison operator, a version (and a delimiter)
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride isn't None
VirtualScriptAlias (mod_vhost_alias.c)
        how to create a ScriptAlias based on the host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
VirtualDocumentRoot (mod_vhost_alias.c)
        how to create the DocumentRoot based on the host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
VirtualScriptAliasIP (mod_vhost_alias.c)
        how to create a ScriptAlias based on the host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
VirtualDocumentRootIP (mod_vhost_alias.c)
        how to create the DocumentRoot based on the host
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
WatchdogInterval (mod_watchdog.c)
        Watchdog interval in seconds
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DAV (mod_dav.c)
        specify the DAV provider for a directory or location
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
DAVMinTimeout (mod_dav.c)
        specify minimum allowed timeout
        Allowed in *.conf anywhere
DAVDepthInfinity (mod_dav.c)
        allow Depth infinity PROPFIND requests
        Allowed in *.conf anywhere
DAVLockDB (mod_dav_fs.c)
        specify a lock database
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
DAVGenericLockDB (mod_dav_lock.c)
        specify a lock database
        Allowed in *.conf only inside <Directory>, <Files>, <Location>, or <If>
LuaRoot (mod_lua.c)
        Specify the base path for resolving relative paths for mod_lua directives
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaPackagePath (mod_lua.c)
        Add a directory to lua's package.path
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaPackageCPath (mod_lua.c)
        Add a directory to lua's package.cpath
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaAuthzProvider (mod_lua.c)
        Provide an authorization provider
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
LuaHookTranslateName (mod_lua.c)
        Provide a hook for the translate name phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookTranslateName (mod_lua.c)
        Provide a hook for the translate name phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookFixups (mod_lua.c)
        Provide a hook for the fixups phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookFixups (mod_lua.c)
        Provide a inline hook for the fixups phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookMapToStorage (mod_lua.c)
        Provide a hook for the map_to_storage phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookMapToStorage (mod_lua.c)
        Provide a hook for the map_to_storage phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookCheckUserID (mod_lua.c)
        Provide a hook for the check_user_id phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookCheckUserID (mod_lua.c)
        Provide a hook for the check_user_id phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookTypeChecker (mod_lua.c)
        Provide a hook for the type_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookTypeChecker (mod_lua.c)
        Provide a hook for the type_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookAccessChecker (mod_lua.c)
        Provide a hook for the access_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookAccessChecker (mod_lua.c)
        Provide a hook for the access_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookAuthChecker (mod_lua.c)
        Provide a hook for the auth_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaHookAuthChecker (mod_lua.c)
        Provide a hook for the auth_checker phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookInsertFilter (mod_lua.c)
        Provide a hook for the insert_filter phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaHookLog (mod_lua.c)
        Provide a hook for the logging phase of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaScope (mod_lua.c)
        One of once, request, conn, server -- default is once
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaInherit (mod_lua.c)
        Controls how Lua scripts in parent contexts are merged with the current  context: none|parent-last|parent-first (default: parent-first)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaCodeCache (mod_lua.c)
        Controls the behavior of the in-memory code cache  context: stat|forever|never (default: stat)
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaQuickHandler (mod_lua.c)
        Provide a hook for the quick handler of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
<LuaQuickHandler (mod_lua.c)
        Provide a hook for the quick handler of request processing
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
Lua_____ByteCodeHack (mod_lua.c)
        (internal) Byte code handler
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaMapHandler (mod_lua.c)
        Maps a path to a lua handler
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaOutputFilter (mod_lua.c)
        Registers a Lua function as an output filter
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
LuaInputFilter (mod_lua.c)
        Registers a Lua function as an input filter
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride isn't None
ListenBacklog (prefork.c)
        Maximum length of the queue of pending connections, as used by listen(2)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ListenCoresBucketsRatio (prefork.c)
        Ratio between the number of CPU cores (online) and the number of listeners buckets
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
Listen (prefork.c)
        A port number or a numeric IP address and a port number, and an optional protocol
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
SendBufferSize (prefork.c)
        Send buffer size in bytes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ReceiveBufferSize (prefork.c)
        Receive buffer size in bytes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
StartServers (prefork.c)
        Number of child processes launched at server startup
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MinSpareServers (prefork.c)
        Minimum number of idle children, to handle request spikes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxSpareServers (prefork.c)
        Maximum number of idle children
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxClients (prefork.c)
        Deprecated name of MaxRequestWorkers
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
MaxRequestWorkers (prefork.c)
        Maximum number of children alive at the same time
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ServerLimit (prefork.c)
        Maximum value of MaxRequestWorkers for this run of Apache
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
GracefulShutdownTimeout (prefork.c)
        Maximum time in seconds to wait for child processes to complete transactions during shutdown
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<Proxy (mod_proxy.c)
        Container for directives affecting resources located in the proxied location
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
<ProxyMatch (mod_proxy.c)
        Container for directives affecting resources located in the proxied location, in regular expression syntax
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRequests (mod_proxy.c)
        on if the true proxy requests should be accepted
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRemote (mod_proxy.c)
        a scheme, partial URL or '*' and a proxy server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyRemoteMatch (mod_proxy.c)
        a regex pattern and a proxy server
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyPassInterpolateEnv (mod_proxy.c)
        Interpolate Env Vars in reverse Proxy
        Allowed in *.conf anywhere
ProxyPass (mod_proxy.c)
        a virtual path and a URL
        Allowed in *.conf anywhere
ProxyPassMatch (mod_proxy.c)
        a virtual path and a URL
        Allowed in *.conf anywhere
ProxyPassReverse (mod_proxy.c)
        a virtual path and a URL for reverse proxy behaviour
        Allowed in *.conf anywhere
ProxyPassReverseCookiePath (mod_proxy.c)
        Path rewrite rule for proxying cookies
        Allowed in *.conf anywhere
ProxyPassReverseCookieDomain (mod_proxy.c)
        Domain rewrite rule for proxying cookies
        Allowed in *.conf anywhere
ProxyBlock (mod_proxy.c)
        A list of names, hosts or domains to which the proxy will not connect
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyReceiveBufferSize (mod_proxy.c)
        Receive buffer size for outgoing HTTP and FTP connections in bytes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyIOBufferSize (mod_proxy.c)
        IO buffer size for outgoing HTTP and FTP connections in bytes
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyMaxForwards (mod_proxy.c)
        The maximum number of proxies a request may be forwarded through.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
NoProxy (mod_proxy.c)
        A list of domains, hosts, or subnets to which the proxy will connect directly
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyDomain (mod_proxy.c)
        The default intranet domain name (in absence of a domain in the URL)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyVia (mod_proxy.c)
        Configure Via: proxy header header to one of: on | off | block | full
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyErrorOverride (mod_proxy.c)
        use our error handling pages instead of the servers' we are proxying
        Allowed in *.conf anywhere
ProxyPreserveHost (mod_proxy.c)
        on if we should preserve host header while proxying
        Allowed in *.conf anywhere
ProxyTimeout (mod_proxy.c)
        Set the timeout (in seconds) for a proxied connection. This overrides the server timeout
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyBadHeader (mod_proxy.c)
        How to handle bad header line in response: IsError | Ignore | StartBody
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BalancerMember (mod_proxy.c)
        A balancer name and scheme with list of params
        Allowed in *.conf anywhere
BalancerGrowth (mod_proxy.c)
        Number of additional Balancers that can be added post-config
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BalancerPersist (mod_proxy.c)
        on if the balancer should persist changes on reboot/restart made via the Balancer Manager
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
BalancerInherit (mod_proxy.c)
        on if this server should inherit Balancers and Workers defined in the main server (Setting to off recommended if using the Balancer Manager)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyPassInherit (mod_proxy.c)
        on if this server should inherit all ProxyPass directives defined in the main server (Setting to off recommended if using the Balancer Manager)
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyStatus (mod_proxy.c)
        Configure Status: proxy status to one of: on | off | full
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxySet (mod_proxy.c)
        A balancer or worker name with list of params
        Allowed in *.conf anywhere
ProxySourceAddress (mod_proxy.c)
        Configure local source IP used for request forward
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyAddHeaders (mod_proxy.c)
        on if X-Forwarded-* headers should be added or completed
        Allowed in *.conf anywhere
HeartbeatStorage (mod_lbmethod_heartbeat.c)
        Path to read heartbeat data.
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
AllowCONNECT (mod_proxy_connect.c)
        A list of ports or port ranges which CONNECT may connect to
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxyExpressEnable (mod_proxy_express.c)
        Enable the ProxyExpress functionality
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride includes FileInfo
ProxyExpressDBMFile (mod_proxy_express.c)
        Location of ProxyExpressDBMFile file
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride includes FileInfo
ProxyExpressDBMType (mod_proxy_express.c)
        Type of ProxyExpressDBMFile file
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride includes FileInfo
ProxyFCGIBackendType (mod_proxy_fcgi.c)
        Specify the type of FastCGI server: 'Generic', 'FPM'
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
ProxyFCGISetEnvIf (mod_proxy_fcgi.c)
        expr-condition env-name expr-value
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes FileInfo
ProxyFtpListOnWildcard (mod_proxy_ftp.c)
        Whether wildcard characters in a path cause mod_proxy_ftp to list the files instead of trying to get them. Defaults to on.
        Allowed in *.conf anywhere
ProxyFtpEscapeWildcards (mod_proxy_ftp.c)
        Whether the proxy should escape wildcards in paths before sending them to the FTP server.  Defaults to on, but most FTP servers will need it turned off if you need to manage paths that contain wildcard characters.
        Allowed in *.conf anywhere
ProxyFtpDirCharset (mod_proxy_ftp.c)
        Define the character set for proxied FTP listings
        Allowed in *.conf anywhere
ProxyHCTemplate (mod_proxy_hcheck.c)
        Health check template
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride includes FileInfo
ProxyHCExpr (mod_proxy_hcheck.c)
        Define a health check condition ruleset expression
        Allowed in *.conf anywhere [no per-dir config] and in .htaccess
        when AllowOverride includes FileInfo
ProxyHCTPsize (mod_proxy_hcheck.c)
        Set size of health check thread pool
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ProxySCGISendfile (mod_proxy_scgi.c)
        The name of the X-Sendfile pseudo response header or On or Off
        Allowed in *.conf anywhere
ProxySCGIInternalRedirect (mod_proxy_scgi.c)
        The name of the pseudo response header or On or Off
        Allowed in *.conf anywhere
ScriptLog (mod_cgi.c)
        the name of a log for script debugging info
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptLogLength (mod_cgi.c)
        the maximum length (in bytes) of the script debug log
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
ScriptLogBuffer (mod_cgi.c)
        the maximum size (in bytes) to record of a POST request
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
php_value (mod_php5.c)
        PHP Value Modifier
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
php_flag (mod_php5.c)
        PHP Flag Modifier
        Allowed in *.conf anywhere and in .htaccess
        when AllowOverride includes Options
php_admin_value (mod_php5.c)
        PHP Value Modifier (Admin)
        Allowed in *.conf anywhere
php_admin_flag (mod_php5.c)
        PHP Flag Modifier (Admin)
        Allowed in *.conf anywhere
PHPINIDir (mod_php5.c)
        Directory containing the php.ini file
        Allowed in *.conf only outside <Directory>, <Files>, <Location>, or <If>
```
