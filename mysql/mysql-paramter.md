

### max_prepared_stmt_count

https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_max_prepared_stmt_count

- system variable max_prepared_stmt_count
- scope global
- dynamic 
- int
- default 16382 (0 - 1048576)

the sum of the number of prepared stmt across all session  
for dos attack

if using sysbench , shoud change this value. 
