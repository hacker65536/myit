https://dumps.wikimedia.org/jawiki/  
https://dumps.wikimedia.org/jawiki/latest/  


```
curl -SsLO https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles.gz
gunzip !$:t
```

```console
$ tail -n 10 jawiki-latest-all-titles
829     サンドボックス/Ef3/ExLink/testcases/Twitter
829     サンドボックス/Ef3/ExLink/testcases/Twitter_status
829     サンドボックス/Ef3/ExLink/testcases/facebook
829     サンドボックス/Ef3/ExLink/testcases/timeit
829     サンドボックス/Ef3/HelloWorld
829     サンドボックス/Ef3/Infobox/former
829     サンドボックス/Ef3/Infobox/former/Infobox
829     サンドボックス/Ef3/Infobox/former/建築物
829     サンドボックス/Ef3/SNSuty/testcases
829     開始手順
```

```sql 
create database fulltextsearch;

CREATE TABLE wiki_title_f (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` smallint(6) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL ,
  `delete_time` datetime NOT NULL ,
  PRIMARY KEY (`id`,`delete_time`),
  FULLTEXT KEY `page_title` (`page_title`) /*!50100 WITH PARSER `ngram` */
) ENGINE=InnoDB DEFAULT CHARSET=utf8
```

```
mysql> load data local infile 'jawiki-latest-all-titles' into table wiki_title_f (page_namespace,  page_title);
```


utf8mb4...
