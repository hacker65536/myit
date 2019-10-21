

dump mysql data with gzip 

```
mysqldump - u user -p dbname | gzip > dbname.sql.gz
```


restore dump file compressed with gzip
```
zcat dbname.sql.gz | mysql -u user -p dbname
```
