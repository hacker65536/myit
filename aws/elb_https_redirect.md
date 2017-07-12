
```apache
RewriteEngine On
RewriteCond %{HTTP:X-Forwarded-Proto} !https
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R,NE,L]
```


## elb


| LB Protocol | LB Port | Instance Protocol | Instance Port | Cipher |     SSL Certificate    |
|:-----------:|:-------:|:-----------------:|:-------------:|:------:|:----------------------:|
|     HTTP    |    80   |        HTTP       |       80      |   N/A  |           N/A          |
|    HTTPS    |   443   |        HTTP       |       80      | Change | xxxxx-xxxx-xxx-xx(AMC) |


### HealthCheck


| key | value|
|:-----------|------------:|
|     Ping Target     | **TCP:80** |
|       Timeout       |  5sec  |
|       Interval      |  30sec |
| Unhealthy threshold | 2      |
| Healthy threshold   | 3      |

`Ping Target` を `HTTP:80/index.html`のようにファイル等にするとステータスコード302を返してしまい、200以外ではELBからHealthとしてみられないために`OutOfService`となってしまう。
その場合だと

```apache
RewriteEngine On
RewriteCond %{HTTP:X-Forwarded-Port} !^443$
RewriteCond %{HTTP_USER_AGENT} !^ELB-HealthChecker
RewriteRule ^(.*)?$ https://%{HTTP_HOST}$1 [R=301,L]
```
のようにELB-HealthCheckerのからアクセスを除外しておく必要がある。
