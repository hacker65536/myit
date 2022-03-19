

`awkf`
```awk
#!/usr/bin/awk -f
BEGIN            { print_it = 0 }
/status: active/ { print_it = 1 }
/^($|[^\t])/     { if(print_it) print buffer; buffer = $0; print_it = 0 }
/^\t/            { buffer = buffer "\n" $0 }
END              { if(print_it) print buffer }

```


```
ifconfig -a | awk -f awkf
```

or

require pcre2 (`brew install pcre2`)
```
ifconfig | pcre2grep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'
```


```
sudo ifconfig en8 down
sudo ifconfig en8 up
```
