https://stackoverflow.com/questions/8988824/generating-random-number-between-1-and-10-in-bash-shell-script

```
echo $RANDOM
```


between values

1<>10
```
shuf -i1-10 -n1

echo $((RANDOM % 10 + 1))
```
90<>100
```
shuf -i90-100 -n1
echo $((RANDOM % 11 + 90)) 
```

40<>190
```
shuf -i40-190 -n1
echo $((RANDOM % 151 + 40)) 
```
