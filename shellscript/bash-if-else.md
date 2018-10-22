

### String Comparison
- [ ] -z STR   if the string `is null` retruns `true`

regardless of declaration
```bash
if [[ "$empty" == "" ]]
then
        echo "empty"
fi

if [[ -z "$empty" ]]
then
        echo "empty"
fi
```
- [ ] -n STR   if the string  `is not null` returns `true`
- [ ] STR1 = STR2 if the strings are `equal` retruns `true`
- [ ] STR1 != STR2 if the strings `are not equal` retruns `true`
- [ ] -v ENV if environament variable exist

### File Conditionals
- [ ] -d FILE if the file is a `directory`
- [ ] -e FILE if the file `exists`
- [ ] -f FILE if the provided string is a file
- [ ] -s FILE if the file has a `non-zero size`
- [ ] -r if the file is `readable`
- [ ] -w if the file is `writable`
- [ ] -x if the file is `executable`
- [ ] -g 


### Numeric Comparison
　|　|mean
---|---|:---:
 -eq | == |equal
 -ne | != |not equal
 -lt | < |less than
 -le | <= |less than or equal
 -gt | > |greater than
 -ge | >= |greater than or equeal
 
 
