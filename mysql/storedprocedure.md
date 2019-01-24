
```sql
DELIMITER //
CREATE PROCEDURE sample01()
BEGIN
DECLARE i INT;
SET i=1;
myloop: LOOP
    SET i=i+1;
    SELECT i;
    SELECT sleep(0.5);
    IF i=120 then
            LEAVE myloop;
    END IF;
END LOOP myloop;
SELECT 'I can count to 10';

END
//
DELIMITER ;
```

```
mysql> call sample01();                                                                                                                    +------+
| i    |
+------+
|    2 |
+------+
1 row in set (0.00 sec)

----snip----------

+------------+
| sleep(0.5) |
+------------+
|          0 |
+------------+
1 row in set (59.54 sec)

+-------------------+
| I can count to 10 |
+-------------------+
| I can count to 10 |
+-------------------+
1 row in set (59.54 sec)

Query OK, 0 rows affected (59.54 sec)
```
