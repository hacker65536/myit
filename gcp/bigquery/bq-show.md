```bash
dataset=mydataset
for i in $(bq --format sparse ls $dataset | awk '{print $1}' | sed -ne '3,$p') ;do bq show $dataset.$i ;done
```
