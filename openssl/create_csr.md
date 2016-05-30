






oneliner

```bash
openssl req \
-nodes \
-x509 \
-newkey rsa:2048 \
-subj "/C=JP/ST=Tokyo/L=Shibuya/O=mycompany/OU=infra/CN=mycompany.com" \
-keyout example.key \
-out example.csr 
```


```

|       fields     |   |
|------------------|---|
| CountryName      | C |
| State            | ST|
| LocalityName     | L |
| Organisation     | O |
| OrganisationUnit | OU|
| CommonName       | CN|
