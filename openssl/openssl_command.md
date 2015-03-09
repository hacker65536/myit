

#SYNOPSIS
openssl command [ command_opts ] [ command_args ]

##command

- rsa RSAkey management.
- req X.509 Certificate Signing Request(CSR) Manegement.
- genrsa Generation of RSA Private key.  Superceded by genpkey.
- x509 X.509 Certificate Data Management.

## example

###generate csr

1. generate key  
```bash
openssl genrsa -des3 -out ./private.key 2048
```
2. generate csr  
```bash
openssl req -new -key ./private.key -out ./mydomain.com.csr
```
