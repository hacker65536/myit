
mysql 5.7.26 default
```
mysql> show variables like 'sql_mode' \G
*************************** 1. row ***************************
Variable_name: sql_mode
        Value: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
1 row in set (0.01 sec)
```
- ONLY_FULL_GROUP_BY
- STRICT_TRANS_TABLES
- NO_ZERO_IN_DATE
- NO_ZERO_DATE
- ERROR_FOR_DIVISION_BY_ZERO
- NO_AUTO_CREATE_USER
- NO_ENGINE_SUBSTITUTION
