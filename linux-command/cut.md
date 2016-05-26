#cut


##example
```
 history | tail -10
   73  cut -d ' ' -f 2 his
   74  cut -d ' ' -f 2- his
   75  cut -d ' ' -f 3- his
   76  cut -d ' ' -f 4- his
   77  cut -d ' ' -f 5- his
   78  cut -d ' ' -f 6- his
   79  vim his
   80  history|cut -d ' ' -f 6-
   81  history
   82  history | tail -10
```

```bash
history | tail -10 | cut -d ' ' -f 6-
cut -d ' ' -f 2- his
cut -d ' ' -f 3- his
cut -d ' ' -f 4- his
cut -d ' ' -f 5- his
cut -d ' ' -f 6- his
vim his
history|cut -d ' ' -f 6-
history
history | tail -10
history | tail -10 | cut -d ' ' -f 6-
```
