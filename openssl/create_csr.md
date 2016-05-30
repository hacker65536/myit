







```bash
$ openssl req -nodes -newkey rsa:2048 -keyout example.key -out example.csr \
-subj "/C=JP/ST=OSAKA/L=London/O=Global Security/OU=IT Department/CN=example.com"

```

|       fields     |   |
|------------------|---|
| CountryName      | C |
| State            | ST|
| LocalityName     | L |
| Organisation     | O |
| OrganisationUnit | OU|
| CommonName       | CN|
