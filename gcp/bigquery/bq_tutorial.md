
```
$ bq shell
test-project-1111> mk new_dataset
Dataset 'test-project-1111:new_dataset' successfully created.
test-project-1111> quit
Goodbye.
```

```
$ bq shell
Welcome to BigQuery! (Type help for more information.)
test-project-1111> ls
   datasetId
 -------------
  new_dataset
test-project-1111> mk --schema id:integer,name:string -t new_dataset.testtable
Table 'test-project-1111:new_dataset.testtable' successfully created.
```

```
$ echo '{"id":1, "name":"John"}' > bq.json
$ bq shell
test-project-1111> insert new_dataset.testtable /home/ec2-user/bq.json
test-project-1111> query select * from new_dataset.testtable
Waiting on bqjob_r5a75egac23bf397c_0002015f6c4520b6_1 ... (0s) Current status: DONE
+----+------+
| id | name |
+----+------+
|  1 | John |
+----+------+
test-project-1111> exit
Goodbye.
```
