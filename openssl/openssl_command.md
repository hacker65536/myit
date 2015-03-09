

#SYNOPSIS
openssl command [ command_opts ] [ command_args ]

##command

- rsa RSAkey management.
- req X.509 Certificate Signing Request(CSR) Manegement.
- genrsa Generation of RSA Private key.  Superceded by genpkey.
- x509 X.509 Certificate Data Management.

## example

###generate csr

```bash
openssl genrsa -des3 -out ./private.key 2048
```

```bash
openssl req -new -key ./private.key -out ./mydomain.com.csr
```
