
```
start=($(date '+%s %3N')); \
for i in {1..2}; do { sl="$(($RANDOM % 10)).$(($RANDOM % 1000))"; echo $sl; sleep $sl & };done ; \
wait ; end=($(date '+%s %3N')); \
echo "scale=3; (${end[0]} - ${start[0]}) + ((${end[1]} - ${start[1]}) / 1000)" | bc; \
echo ${end[@]} - ${start[@]}
```
```
9.39
[1] 30023
7.305
[2] 30024
[1]-  Done                    sleep $sl
[2]+  Done                    sleep $sl
9.393
1523004562 495 - 1523004553 102
```
