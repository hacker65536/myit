php
------------
```bash
sudo rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
sudo yum install newrelic-php5
sudo newrelic-install install #type api_key
```


```
vim -R  /etc/php.d/newrelic.ini
```

```
extension = "newrelic.so"
[newrelic]
newrelic.license = "??????????????????????????????????????????"
newrelic.logfile = "/var/log/newrelic/php_agent.log"
newrelic.appname = "PHP Applicationtest"
newrelic.daemon.logfile = "/var/log/newrelic/newrelic-daemon.log"
```

```
php -i | grep newrelic
/etc/php-5.6.d/newrelic.ini,
newrelic
newrelic.daemon.app_timeout => no value
newrelic.daemon.auditlog => no value
newrelic.daemon.collector_host => collector.newrelic.com
newrelic.daemon.dont_launch => no value
newrelic.daemon.location => /usr/bin/newrelic-daemon
newrelic.daemon.logfile => /var/log/newrelic/newrelic-daemon.log
newrelic.daemon.loglevel => no value
newrelic.daemon.pidfile => no value
newrelic.daemon.port => /tmp/.newrelic.sock
newrelic.daemon.proxy => no value
newrelic.daemon.ssl => enabled
newrelic.daemon.ssl_ca_bundle => no value
newrelic.daemon.ssl_ca_path => no value
newrelic.daemon.utilization.detect_aws => enabled
newrelic.daemon.utilization.detect_azure => enabled
newrelic.daemon.utilization.detect_docker => enabled
newrelic.daemon.utilization.detect_gcp => enabled
newrelic.daemon.utilization.detect_pcf => enabled
newrelic.feature_flag => no value
newrelic.high_security => 0
newrelic.logfile => /var/log/newrelic/php_agent.log
newrelic.loglevel => info
newrelic.analytics_events.capture_attributes => enabled => enabled
newrelic.analytics_events.enabled => enabled => enabled
newrelic.appname => PHP Applicationtest => PHP Applicationtest
newrelic.attributes.enabled => enabled => enabled
newrelic.attributes.exclude => no value => no value
newrelic.attributes.include => no value => no value
newrelic.browser_monitoring.attributes.enabled => disabled => disabled
newrelic.browser_monitoring.attributes.exclude => no value => no value
newrelic.browser_monitoring.attributes.include => no value => no value
newrelic.browser_monitoring.auto_instrument => enabled => enabled
newrelic.browser_monitoring.capture_attributes => disabled => disabled
newrelic.browser_monitoring.debug => disabled => disabled
newrelic.browser_monitoring.loader => rum => rum
newrelic.capture_params => off => off
newrelic.cross_application_tracer.enabled => enabled => enabled
newrelic.custom_insights_events.enabled => enabled => enabled
newrelic.datastore_tracer.database_name_reporting.enabled => enabled => enabled
newrelic.datastore_tracer.instance_reporting.enabled => enabled => enabled
newrelic.enabled => yes => yes
newrelic.error_collector.attributes.enabled => enabled => enabled
newrelic.error_collector.attributes.exclude => no value => no value
newrelic.error_collector.attributes.include => no value => no value
newrelic.error_collector.capture_attributes => enabled => enabled
newrelic.error_collector.capture_events => enabled => enabled
newrelic.error_collector.enabled => enabled => enabled
newrelic.error_collector.ignore_errors => no value => no value
newrelic.error_collector.ignore_exceptions => no value => no value
newrelic.error_collector.ignore_user_exception_handler => no => no
newrelic.error_collector.prioritize_api_errors => no => no
newrelic.error_collector.record_database_errors => yes => yes
newrelic.framework => auto-detect => auto-detect
newrelic.framework.drupal.modules => on => on
newrelic.framework.wordpress.hooks => on => on
newrelic.guzzle.enabled => 1 => 1
newrelic.ignored_params => no value => no value
newrelic.labels => no value => no value
newrelic.license => 1f...b8 => 1f...b8
newrelic.phpunit_events.enabled => disabled => disabled
newrelic.process_host.display_name => no value => no value
newrelic.special.max_nesting_level => -1 => -1
newrelic.synthetics.enabled => enabled => enabled
newrelic.transaction_events.attributes.enabled => enabled => enabled
newrelic.transaction_events.attributes.exclude => no value => no value
newrelic.transaction_events.attributes.include => no value => no value
newrelic.transaction_events.enabled => enabled => enabled
newrelic.transaction_tracer.attributes.enabled => enabled => enabled
newrelic.transaction_tracer.attributes.exclude => no value => no value
newrelic.transaction_tracer.attributes.include => no value => no value
newrelic.transaction_tracer.capture_attributes => enabled => enabled
newrelic.transaction_tracer.custom => no value => no value
newrelic.transaction_tracer.detail => 1 => 1
newrelic.transaction_tracer.enabled => enabled => enabled
newrelic.transaction_tracer.explain_enabled => enabled => enabled
newrelic.transaction_tracer.explain_threshold => 500 => 500
newrelic.transaction_tracer.gather_input_queries => 1 => 1
newrelic.transaction_tracer.record_sql => obfuscated => obfuscated
newrelic.transaction_tracer.slow_sql => enabled => enabled
newrelic.transaction_tracer.stack_trace_threshold => 500 => 500
newrelic.transaction_tracer.threshold => apdex_f => apdex_f
newrelic.webtransaction.name.files => no value => no value
newrelic.webtransaction.name.functions => no value => no value
newrelic.webtransaction.name.remove_trailing_path => no => no
```
