
#openssl req

oneliner

```bash
openssl req \
-nodes \
-x509 \
-newkey rsa:2048 \
-days 3652
-subj "/C=JP/ST=Tokyo/L=Shibuya/O=mycompany/OU=infra/CN=mycompany.com" \
-keyout example.key \
-out example.csr 
```

* -nodes not encrypt
* -newkey rsa:2048 creates a new certificate request and a new private key.
* -x509 this option outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root CA.





subj

|       fields     |   |
|------------------|---|
| CountryName      | C |
| State            | ST|
| LocalityName     | L |
| Organisation     | O |
| OrganisationUnit | OU|
| CommonName       | CN|
