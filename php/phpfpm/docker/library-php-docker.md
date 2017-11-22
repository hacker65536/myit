```
phpinfo()
PHP Version => 5.6.32

System => Linux ec743c59caef 4.9.51-10.52.amzn1.x86_64 #1 SMP Fri Sep 29 01:16:19 UTC 2017 x86_64
Build Date => Nov  4 2017 11:42:03
Configure Command =>  './configure'  '--build=x86_64-linux-musl' '--with-config-file-path=/usr/local/etc/php' '--with-config-file-scan-dir=/usr/local/etc/php/conf.d' '--disable-cgi' '--enable-ftp' '--enable-mbstring' '--enable-mysqlnd' '--with-curl' '--with-libedit' '--with-openssl' '--with-zlib' '--with-pcre-regex=/usr' '--enable-fpm' '--with-fpm-user=www-data' '--with-fpm-group=www-data' 'build_alias=x86_64-linux-musl' 'CFLAGS=-fstack-protector-strong '-fpic' '-fpie' '-O2'' 'LDFLAGS=-Wl,-O1 '-Wl,--hash-style=both' '-pie'' 'CPPFLAGS=-fstack-protector-strong '-fpic' '-fpie' '-O2''
Server API => Command Line Interface
Virtual Directory Support => disabled
Configuration File (php.ini) Path => /usr/local/etc/php
Loaded Configuration File => (none)
Scan this dir for additional .ini files => /usr/local/etc/php/conf.d
Additional .ini files parsed => (none)
PHP API => 20131106
PHP Extension => 20131226
Zend Extension => 220131226
Zend Extension Build => API220131226,NTS
PHP Extension Build => API20131226,NTS
Debug Build => no
Thread Safety => disabled
Zend Signal Handling => disabled
Zend Memory Manager => enabled
Zend Multibyte Support => provided by mbstring
IPv6 Support => enabled
DTrace Support => disabled

Registered PHP Streams => https, ftps, compress.zlib, php, file, glob, data, http, ftp, phar
Registered Stream Socket Transports => tcp, udp, unix, udg, ssl, sslv3, sslv2, tls, tlsv1.0, tlsv1.1, tlsv1.2
Registered Stream Filters => zlib.*, convert.iconv.*, string.rot13, string.toupper, string.tolower, string.strip_tags, convert.*, consumed, dechunk

This program makes use of the Zend Scripting Language Engine:
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies


 _______________________________________________________________________


Configuration

Core

PHP Version => 5.6.32

Directive => Local Value => Master Value
allow_url_fopen => On => On
allow_url_include => Off => Off
always_populate_raw_post_data => 0 => 0
arg_separator.input => & => &
arg_separator.output => & => &
asp_tags => Off => Off
auto_append_file => no value => no value
auto_globals_jit => On => On
auto_prepend_file => no value => no value
browscap => no value => no value
default_charset => UTF-8 => UTF-8
default_mimetype => text/html => text/html
disable_classes => no value => no value
disable_functions => no value => no value
display_errors => STDOUT => STDOUT
display_startup_errors => Off => Off
doc_root => no value => no value
docref_ext => no value => no value
docref_root => no value => no value
enable_dl => On => On
enable_post_data_reading => On => On
error_append_string => no value => no value
error_log => no value => no value
error_prepend_string => no value => no value
error_reporting => no value => no value
exit_on_timeout => Off => Off
expose_php => On => On
extension_dir => /usr/local/lib/php/extensions/no-debug-non-zts-20131226 => /usr/local/lib/php/extensions/no-debug-non-zts-20131226
file_uploads => On => On
highlight.comment => <font style="color: #FF8000">#FF8000</font> => <font style="color: #FF8000">#FF8000</font>
highlight.default => <font style="color: #0000BB">#0000BB</font> => <font style="color: #0000BB">#0000BB</font>
highlight.html => <font style="color: #000000">#000000</font> => <font style="color: #000000">#000000</font>
highlight.keyword => <font style="color: #007700">#007700</font> => <font style="color: #007700">#007700</font>
highlight.string => <font style="color: #DD0000">#DD0000</font> => <font style="color: #DD0000">#DD0000</font>
html_errors => Off => Off
ignore_repeated_errors => Off => Off
ignore_repeated_source => Off => Off
ignore_user_abort => Off => Off
implicit_flush => On => On
include_path => .:/usr/local/lib/php => .:/usr/local/lib/php
input_encoding => no value => no value
internal_encoding => no value => no value
log_errors => Off => Off
log_errors_max_len => 1024 => 1024
mail.add_x_header => Off => Off
mail.force_extra_parameters => no value => no value
mail.log => no value => no value
max_execution_time => 0 => 0
max_file_uploads => 20 => 20
max_input_nesting_level => 64 => 64
max_input_time => -1 => -1
max_input_vars => 1000 => 1000
memory_limit => 128M => 128M
open_basedir => no value => no value
output_buffering => 0 => 0
output_encoding => no value => no value
output_handler => no value => no value
post_max_size => 8M => 8M
precision => 14 => 14
realpath_cache_size => 16K => 16K
realpath_cache_ttl => 120 => 120
register_argc_argv => On => On
report_memleaks => On => On
report_zend_debug => Off => Off
request_order => no value => no value
sendmail_from => no value => no value
sendmail_path => /usr/sbin/sendmail -t -i  => /usr/sbin/sendmail -t -i
serialize_precision => 17 => 17
short_open_tag => On => On
SMTP => localhost => localhost
smtp_port => 25 => 25
sql.safe_mode => Off => Off
sys_temp_dir => no value => no value
track_errors => Off => Off
unserialize_callback_func => no value => no value
upload_max_filesize => 2M => 2M
upload_tmp_dir => no value => no value
user_dir => no value => no value
user_ini.cache_ttl => 300 => 300
user_ini.filename => .user.ini => .user.ini
variables_order => EGPCS => EGPCS
xmlrpc_error_number => 0 => 0
xmlrpc_errors => Off => Off
zend.detect_unicode => On => On
zend.enable_gc => On => On
zend.multibyte => Off => Off
zend.script_encoding => no value => no value

ctype

ctype functions => enabled

curl

cURL support => enabled
cURL Information => 7.55.0
Age => 3
Features
AsynchDNS => No
CharConv => No
Debug => No
GSS-Negotiate => No
IDN => No
IPv6 => Yes
krb4 => No
Largefile => Yes
libz => Yes
NTLM => Yes
NTLMWB => Yes
SPNEGO => No
SSL => Yes
SSPI => No
TLS-SRP => Yes
Protocols => dict, file, ftp, ftps, gopher, http, https, imap, imaps, pop3, pop3s, rtsp, scp, sftp, smb, smbs, smtp, smtps, telnet, tftp
Host => x86_64-alpine-linux-musl
SSL Version => OpenSSL/1.0.2k
ZLib Version => 1.2.11
libSSH Version => libssh2/1.7.0

date

date/time support => enabled
"Olson" Timezone Database Version => 2016.10
Timezone Database => internal
Default timezone => UTC

Directive => Local Value => Master Value
date.default_latitude => 31.7667 => 31.7667
date.default_longitude => 35.2333 => 35.2333
date.sunrise_zenith => 90.583333 => 90.583333
date.sunset_zenith => 90.583333 => 90.583333
date.timezone => no value => no value

dom

DOM/XML => enabled
DOM/XML API Version => 20031129
libxml Version => 2.9.4
HTML Support => enabled
XPath Support => enabled
XPointer Support => enabled
Schema Support => enabled
RelaxNG Support => enabled

ereg

Regex Library => Bundled library enabled

fileinfo

fileinfo support => enabled
version => 1.0.5
libmagic => 517

filter

Input Validation and Filtering => enabled
Revision => $Id: 5b79667bd9a68977a9b4f7505223a8e216e04908 $

Directive => Local Value => Master Value
filter.default => unsafe_raw => unsafe_raw
filter.default_flags => no value => no value

ftp

FTP support => enabled

hash

hash support => enabled
Hashing Engines => md2 md4 md5 sha1 sha224 sha256 sha384 sha512 ripemd128 ripemd160 ripemd256 ripemd320 whirlpool tiger128,3 tiger160,3 tiger192,3 tiger128,4 tiger160,4 tiger192,4 snefru snefru256 gost gost-crypto adler32 crc32 crc32b fnv132 fnv1a32 fnv164 fnv1a64 joaat haval128,3 haval160,3 haval192,3 haval224,3 haval256,3 haval128,4 haval160,4 haval192,4 haval224,4 haval256,4 haval128,5 haval160,5 haval192,5 haval224,5 haval256,5

iconv

iconv support => enabled
iconv implementation => unknown
iconv library version => unknown

Directive => Local Value => Master Value
iconv.input_encoding => no value => no value
iconv.internal_encoding => no value => no value
iconv.output_encoding => no value => no value

json

json support => enabled
json version => 1.2.1

libxml

libXML support => active
libXML Compiled Version => 2.9.4
libXML Loaded Version => 20904
libXML streams => enabled

mbstring

Multibyte Support => enabled
Multibyte string engine => libmbfl
HTTP input encoding translation => disabled
libmbfl version => 1.3.2

mbstring extension makes use of "streamable kanji code filter and converter", which is distributed under the GNU Lesser General Public License version 2.1.

Multibyte (japanese) regex support => enabled
Multibyte regex (oniguruma) backtrack check => On
Multibyte regex (oniguruma) version => 5.9.5

Directive => Local Value => Master Value
mbstring.detect_order => no value => no value
mbstring.encoding_translation => Off => Off
mbstring.func_overload => 0 => 0
mbstring.http_input => no value => no value
mbstring.http_output => no value => no value
mbstring.http_output_conv_mimetypes => ^(text/|application/xhtml\+xml) => ^(text/|application/xhtml\+xml)
mbstring.internal_encoding => no value => no value
mbstring.language => neutral => neutral
mbstring.strict_detection => Off => Off
mbstring.substitute_character => no value => no value

mysqlnd

mysqlnd => enabled
Version => mysqlnd 5.0.11-dev - 20120503 - $Id: 76b08b24596e12d4553bd41fc93cccd5bac2fe7a $
Compression => supported
core SSL => supported
extended SSL => supported
Command buffer size => 4096
Read buffer size => 32768
Read timeout => 31536000
Collecting statistics => Yes
Collecting memory statistics => No
Tracing => n/a
Loaded plugins => mysqlnd,debug_trace,auth_plugin_mysql_native_password,auth_plugin_mysql_clear_password,auth_plugin_sha256_password
API Extensions =>

mysqlnd statistics =>
bytes_sent => 0
bytes_received => 0
packets_sent => 0
packets_received => 0
protocol_overhead_in => 0
protocol_overhead_out => 0
bytes_received_ok_packet => 0
bytes_received_eof_packet => 0
bytes_received_rset_header_packet => 0
bytes_received_rset_field_meta_packet => 0
bytes_received_rset_row_packet => 0
bytes_received_prepare_response_packet => 0
bytes_received_change_user_packet => 0
packets_sent_command => 0
packets_received_ok => 0
packets_received_eof => 0
packets_received_rset_header => 0
packets_received_rset_field_meta => 0
packets_received_rset_row => 0
packets_received_prepare_response => 0
packets_received_change_user => 0
result_set_queries => 0
non_result_set_queries => 0
no_index_used => 0
bad_index_used => 0
slow_queries => 0
buffered_sets => 0
unbuffered_sets => 0
ps_buffered_sets => 0
ps_unbuffered_sets => 0
flushed_normal_sets => 0
flushed_ps_sets => 0
ps_prepared_never_executed => 0
ps_prepared_once_executed => 0
rows_fetched_from_server_normal => 0
rows_fetched_from_server_ps => 0
rows_buffered_from_client_normal => 0
rows_buffered_from_client_ps => 0
rows_fetched_from_client_normal_buffered => 0
rows_fetched_from_client_normal_unbuffered => 0
rows_fetched_from_client_ps_buffered => 0
rows_fetched_from_client_ps_unbuffered => 0
rows_fetched_from_client_ps_cursor => 0
rows_affected_normal => 0
rows_affected_ps => 0
rows_skipped_normal => 0
rows_skipped_ps => 0
copy_on_write_saved => 0
copy_on_write_performed => 0
command_buffer_too_small => 0
connect_success => 0
connect_failure => 0
connection_reused => 0
reconnect => 0
pconnect_success => 0
active_connections => 0
active_persistent_connections => 0
explicit_close => 0
implicit_close => 0
disconnect_close => 0
in_middle_of_command_close => 0
explicit_free_result => 0
implicit_free_result => 0
explicit_stmt_close => 0
implicit_stmt_close => 0
mem_emalloc_count => 0
mem_emalloc_amount => 0
mem_ecalloc_count => 0
mem_ecalloc_amount => 0
mem_erealloc_count => 0
mem_erealloc_amount => 0
mem_efree_count => 0
mem_efree_amount => 0
mem_malloc_count => 0
mem_malloc_amount => 0
mem_calloc_count => 0
mem_calloc_amount => 0
mem_realloc_count => 0
mem_realloc_amount => 0
mem_free_count => 0
mem_free_amount => 0
mem_estrndup_count => 0
mem_strndup_count => 0
mem_estndup_count => 0
mem_strdup_count => 0
proto_text_fetched_null => 0
proto_text_fetched_bit => 0
proto_text_fetched_tinyint => 0
proto_text_fetched_short => 0
proto_text_fetched_int24 => 0
proto_text_fetched_int => 0
proto_text_fetched_bigint => 0
proto_text_fetched_decimal => 0
proto_text_fetched_float => 0
proto_text_fetched_double => 0
proto_text_fetched_date => 0
proto_text_fetched_year => 0
proto_text_fetched_time => 0
proto_text_fetched_datetime => 0
proto_text_fetched_timestamp => 0
proto_text_fetched_string => 0
proto_text_fetched_blob => 0
proto_text_fetched_enum => 0
proto_text_fetched_set => 0
proto_text_fetched_geometry => 0
proto_text_fetched_other => 0
proto_binary_fetched_null => 0
proto_binary_fetched_bit => 0
proto_binary_fetched_tinyint => 0
proto_binary_fetched_short => 0
proto_binary_fetched_int24 => 0
proto_binary_fetched_int => 0
proto_binary_fetched_bigint => 0
proto_binary_fetched_decimal => 0
proto_binary_fetched_float => 0
proto_binary_fetched_double => 0
proto_binary_fetched_date => 0
proto_binary_fetched_year => 0
proto_binary_fetched_time => 0
proto_binary_fetched_datetime => 0
proto_binary_fetched_timestamp => 0
proto_binary_fetched_string => 0
proto_binary_fetched_json => 0
proto_binary_fetched_blob => 0
proto_binary_fetched_enum => 0
proto_binary_fetched_set => 0
proto_binary_fetched_geometry => 0
proto_binary_fetched_other => 0
init_command_executed_count => 0
init_command_failed_count => 0
com_quit => 0
com_init_db => 0
com_query => 0
com_field_list => 0
com_create_db => 0
com_drop_db => 0
com_refresh => 0
com_shutdown => 0
com_statistics => 0
com_process_info => 0
com_connect => 0
com_process_kill => 0
com_debug => 0
com_ping => 0
com_time => 0
com_delayed_insert => 0
com_change_user => 0
com_binlog_dump => 0
com_table_dump => 0
com_connect_out => 0
com_register_slave => 0
com_stmt_prepare => 0
com_stmt_execute => 0
com_stmt_send_long_data => 0
com_stmt_close => 0
com_stmt_reset => 0
com_stmt_set_option => 0
com_stmt_fetch => 0
com_deamon => 0
bytes_received_real_data_normal => 0
bytes_received_real_data_ps => 0

openssl

OpenSSL support => enabled
OpenSSL Library Version => OpenSSL 1.0.2k  26 Jan 2017
OpenSSL Header Version => OpenSSL 1.0.2k  26 Jan 2017
Openssl default config => /etc/ssl/openssl.cnf

Directive => Local Value => Master Value
openssl.cafile => no value => no value
openssl.capath => no value => no value

pcre

PCRE (Perl Compatible Regular Expressions) Support => enabled
PCRE Library Version => 8.38 2015-11-23

Directive => Local Value => Master Value
pcre.backtrack_limit => 1000000 => 1000000
pcre.recursion_limit => 100000 => 100000

PDO

PDO support => enabled
PDO drivers => sqlite

pdo_sqlite

PDO Driver for SQLite 3.x => enabled
SQLite Library => 3.8.10.2

Phar

Phar: PHP Archive support => enabled
Phar EXT version => 2.0.2
Phar API version => 1.1.1
SVN revision => $Id: 780be432570e80dd34c1a9c217ef87ade22bf136 $
Phar-based phar archives => enabled
Tar-based phar archives => enabled
ZIP-based phar archives => enabled
gzip compression => enabled
bzip2 compression => disabled (install pecl/bz2)
Native OpenSSL support => enabled


Phar based on pear/PHP_Archive, original concept by Davey Shafik.
Phar fully realized by Gregory Beaver and Marcus Boerger.
Portions of tar implementation Copyright (c) 2003-2009 Tim Kientzle.
Directive => Local Value => Master Value
phar.cache_list => no value => no value
phar.readonly => On => On
phar.require_hash => On => On

posix

Revision => $Id: 5f4acc20904b1406142f2a0ede068db048c77e77 $

readline

Readline Support => enabled
Readline library => EditLine wrapper

Directive => Local Value => Master Value
cli.pager => no value => no value
cli.prompt => \b \>  => \b \>

Reflection

Reflection => enabled
Version => $Id: 5f15287237d5f78d75b19c26915aa7bd83dee8b8 $

session

Session Support => enabled
Registered save handlers => files user
Registered serializer handlers => php_serialize php php_binary

Directive => Local Value => Master Value
session.auto_start => Off => Off
session.cache_expire => 180 => 180
session.cache_limiter => nocache => nocache
session.cookie_domain => no value => no value
session.cookie_httponly => Off => Off
session.cookie_lifetime => 0 => 0
session.cookie_path => / => /
session.cookie_secure => Off => Off
session.entropy_file => /dev/urandom => /dev/urandom
session.entropy_length => 32 => 32
session.gc_divisor => 100 => 100
session.gc_maxlifetime => 1440 => 1440
session.gc_probability => 1 => 1
session.hash_bits_per_character => 4 => 4
session.hash_function => 0 => 0
session.name => PHPSESSID => PHPSESSID
session.referer_check => no value => no value
session.save_handler => files => files
session.save_path => no value => no value
session.serialize_handler => php => php
session.upload_progress.cleanup => On => On
session.upload_progress.enabled => On => On
session.upload_progress.freq => 1% => 1%
session.upload_progress.min_freq => 1 => 1
session.upload_progress.name => PHP_SESSION_UPLOAD_PROGRESS => PHP_SESSION_UPLOAD_PROGRESS
session.upload_progress.prefix => upload_progress_ => upload_progress_
session.use_cookies => On => On
session.use_only_cookies => On => On
session.use_strict_mode => Off => Off
session.use_trans_sid => 0 => 0

SimpleXML

Simplexml support => enabled
Revision => $Id: d7077fc935154236afb4fe70814ba358efdbdca4 $
Schema support => enabled

SPL

SPL support => enabled
Interfaces => Countable, OuterIterator, RecursiveIterator, SeekableIterator, SplObserver, SplSubject
Classes => AppendIterator, ArrayIterator, ArrayObject, BadFunctionCallException, BadMethodCallException, CachingIterator, CallbackFilterIterator, DirectoryIterator, DomainException, EmptyIterator, FilesystemIterator, FilterIterator, GlobIterator, InfiniteIterator, InvalidArgumentException, IteratorIterator, LengthException, LimitIterator, LogicException, MultipleIterator, NoRewindIterator, OutOfBoundsException, OutOfRangeException, OverflowException, ParentIterator, RangeException, RecursiveArrayIterator, RecursiveCachingIterator, RecursiveCallbackFilterIterator, RecursiveDirectoryIterator, RecursiveFilterIterator, RecursiveIteratorIterator, RecursiveRegexIterator, RecursiveTreeIterator, RegexIterator, RuntimeException, SplDoublyLinkedList, SplFileInfo, SplFileObject, SplFixedArray, SplHeap, SplMinHeap, SplMaxHeap, SplObjectStorage, SplPriorityQueue, SplQueue, SplStack, SplTempFileObject, UnderflowException, UnexpectedValueException

sqlite3

SQLite3 support => enabled
SQLite3 module version => 0.7-dev
SQLite Library => 3.8.10.2

Directive => Local Value => Master Value
sqlite3.extension_dir => no value => no value

standard

Dynamic Library Support => enabled
Path to sendmail => /usr/sbin/sendmail -t -i

Directive => Local Value => Master Value
assert.active => 1 => 1
assert.bail => 0 => 0
assert.callback => no value => no value
assert.quiet_eval => 0 => 0
assert.warning => 1 => 1
auto_detect_line_endings => 0 => 0
default_socket_timeout => 60 => 60
from => no value => no value
url_rewriter.tags => a=href,area=href,frame=src,form=,fieldset= => a=href,area=href,frame=src,form=,fieldset=
user_agent => no value => no value

tokenizer

Tokenizer Support => enabled

xml

XML Support => active
XML Namespace Support => active
libxml2 Version => 2.9.4

xmlreader

XMLReader => enabled

xmlwriter

XMLWriter => enabled

zlib

ZLib Support => enabled
Stream Wrapper => compress.zlib://
Stream Filter => zlib.inflate, zlib.deflate
Compiled Version => 1.2.11
Linked Version => 1.2.11

Directive => Local Value => Master Value
zlib.output_compression => Off => Off
zlib.output_compression_level => -1 => -1
zlib.output_handler => no value => no value

Additional Modules

Module Name

Environment

Variable => Value
PHP_EXTRA_CONFIGURE_ARGS => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data
PHP_INI_DIR => /usr/local/etc/php
HOSTNAME => ec743c59caef
SHLVL => 1
HOME => /root
PHP_LDFLAGS => -Wl,-O1 -Wl,--hash-style=both -pie
PHP_MD5 =>
PHP_CFLAGS => -fstack-protector-strong -fpic -fpie -O2
PHP_VERSION => 5.6.32
GPG_KEYS => 0BD78B5F97500D450838F95DFE857D9A90D90EC1 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3
PHP_ASC_URL => https://secure.php.net/get/php-5.6.32.tar.xz.asc/from/this/mirror
PHP_CPPFLAGS => -fstack-protector-strong -fpic -fpie -O2
PHP_URL => https://secure.php.net/get/php-5.6.32.tar.xz/from/this/mirror
TERM => xterm
PATH => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD => /var/www/html
PHPIZE_DEPS => autoconf                 dpkg-dev dpkg           file            g++             gcc             libc-dev                make            pcre-dev                pkgconf                 re2c
PHP_SHA256 => 8c2b4f721c7475fb9eabda2495209e91ea933082e6f34299d11cba88cd76e64b

PHP Variables

Variable => Value
_SERVER["PHP_EXTRA_CONFIGURE_ARGS"] => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data
_SERVER["PHP_INI_DIR"] => /usr/local/etc/php
_SERVER["HOSTNAME"] => ec743c59caef
_SERVER["SHLVL"] => 1
_SERVER["HOME"] => /root
_SERVER["PHP_LDFLAGS"] => -Wl,-O1 -Wl,--hash-style=both -pie
_SERVER["PHP_MD5"] =>
_SERVER["PHP_CFLAGS"] => -fstack-protector-strong -fpic -fpie -O2
_SERVER["PHP_VERSION"] => 5.6.32
_SERVER["GPG_KEYS"] => 0BD78B5F97500D450838F95DFE857D9A90D90EC1 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3
_SERVER["PHP_ASC_URL"] => https://secure.php.net/get/php-5.6.32.tar.xz.asc/from/this/mirror
_SERVER["PHP_CPPFLAGS"] => -fstack-protector-strong -fpic -fpie -O2
_SERVER["PHP_URL"] => https://secure.php.net/get/php-5.6.32.tar.xz/from/this/mirror
_SERVER["TERM"] => xterm
_SERVER["PATH"] => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_SERVER["PWD"] => /var/www/html
_SERVER["PHPIZE_DEPS"] => autoconf              dpkg-dev dpkg           file            g++             gcc             libc-dev                make            pcre-dev                pkgconf                 re2c
_SERVER["PHP_SHA256"] => 8c2b4f721c7475fb9eabda2495209e91ea933082e6f34299d11cba88cd76e64b
_SERVER["PHP_SELF"] =>
_SERVER["SCRIPT_NAME"] =>
_SERVER["SCRIPT_FILENAME"] =>
_SERVER["PATH_TRANSLATED"] =>
_SERVER["DOCUMENT_ROOT"] =>
_SERVER["REQUEST_TIME_FLOAT"] => 1511345502.6564
_SERVER["REQUEST_TIME"] => 1511345502
_SERVER["argv"] => Array
(
)

_SERVER["argc"] => 0
_ENV["PHP_EXTRA_CONFIGURE_ARGS"] => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data
_ENV["PHP_INI_DIR"] => /usr/local/etc/php
_ENV["HOSTNAME"] => ec743c59caef
_ENV["SHLVL"] => 1
_ENV["HOME"] => /root
_ENV["PHP_LDFLAGS"] => -Wl,-O1 -Wl,--hash-style=both -pie
_ENV["PHP_MD5"] =>
_ENV["PHP_CFLAGS"] => -fstack-protector-strong -fpic -fpie -O2
_ENV["PHP_VERSION"] => 5.6.32
_ENV["GPG_KEYS"] => 0BD78B5F97500D450838F95DFE857D9A90D90EC1 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3
_ENV["PHP_ASC_URL"] => https://secure.php.net/get/php-5.6.32.tar.xz.asc/from/this/mirror
_ENV["PHP_CPPFLAGS"] => -fstack-protector-strong -fpic -fpie -O2
_ENV["PHP_URL"] => https://secure.php.net/get/php-5.6.32.tar.xz/from/this/mirror
_ENV["TERM"] => xterm
_ENV["PATH"] => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_ENV["PWD"] => /var/www/html
_ENV["PHPIZE_DEPS"] => autoconf                 dpkg-dev dpkg           file            g++             gcc             libc-dev                make            pcre-dev                pkgconf                 re2c
_ENV["PHP_SHA256"] => 8c2b4f721c7475fb9eabda2495209e91ea933082e6f34299d11cba88cd76e64b

PHP License
This program is free software; you can redistribute it and/or modify
it under the terms of the PHP License as published by the PHP Group
and included in the distribution in the file:  LICENSE

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

If you did not receive a copy of the PHP license, or have any
questions about PHP licensing, please contact license@php.net.
```
