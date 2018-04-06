
```
start=($(date '+%s %3N')); \
for i in {1..2}; do { sleep 0.$(($RANDOM % 1000)) & } ; done ; \
wait ; end=($(date '+%s %3N')); \
echo "scale=3; (${end[0]} - ${start[0]}) + ((${end[1]} - ${start[1]}) / 1000)" | bc; \
echo ${end[@]} - ${start[@]}
```
```
[1] 29673
[2] 29674
[1]-  Done                    sleep 0.$(($RANDOM % 1000))
[2]+  Done                    sleep 0.$(($RANDOM % 1000))
.370
1523004047 354 - 1523004046 984
```
