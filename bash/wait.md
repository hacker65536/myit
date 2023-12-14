```bash
#!/bin/env bash

function randomsec {
  echo $(( ( RANDOM % 10 )  + 1 ))
}


function myfunc() {
  sleep $(randomsec)
  echo $(date)
}
pids=()

for i in {1..10}; do
  echo $i
  myfunc &
  pids+=($!)
done



wait ${pids[@]}
```
