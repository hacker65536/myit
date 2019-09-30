
```sql
SELECT 
    table_schema, sum(data_length) /1024/1024 AS mb 
FROM 
    information_schema.tables  
GROUP BY 
    table_schema 
ORDER BY       
    sum(data_length+index_length) DESC;
```

```
+--------------------+-------------+
| table_schema       | mb          |
+--------------------+-------------+
| mydata             | 10.93807697 |
| mysql              |  3.67168999 |
| sys                |  0.01562500 |
| information_schema |  0.00000000 |
| performance_schema |  0.00000000 |
+--------------------+-------------+
5 rows in set (0.59 sec)
```



https://qiita.com/ikenji/items/b868877492fee60d85ce
