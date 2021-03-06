
#openssl req

3line
```bash
openssl genrsa 2048 > server.key
openssl req -new -key server.key > server.csr
openssl x509 -days 3652 -req -signkey server.key < server.csr > server.crt
```


oneliner

```bash
openssl req \
-batch \
-nodes \
-x509 \
-newkey rsa:2048 \
-days 3652 \
-subj "/C=JP/ST=Tokyo/L=Shibuya/O=mycompany/OU=infra/CN=mycompany.com" \
-keyout example.key \
-out example.crt 
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
