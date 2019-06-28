
## download ci

https://www.codeigniter.com/

## docker-compose 



```yml
version: "3.7"

services:
  web:
    image: php:7.2-apache
    ports:
      - 80:80
    volumes:
      - ./CodeIgniter-3.1.10:/var/www/html
```
