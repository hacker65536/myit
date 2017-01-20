```
yum install -y postfix
```

/etc/postfix/main.cf

```pfmain
myhostname = mail.domain.com


myorigin = $mydomain
inet_interfaces = all 

mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain

mydestination = $myhostname, localhost.$mydomain, localhost


home_mailbox = Maildir/

smtpd_banner = $myhostname ESMTP unknown


smtpd_sasl_auth_enable = yes
smtpd_sasl_local_domain = $myhostname
smtpd_recipient_restrictions =
    permit_mynetworks
    permit_sasl_authenticated
    reject_unauth_destination


message_size_limit = 1048576
```
