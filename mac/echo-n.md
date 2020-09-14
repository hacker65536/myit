# echo -n 

https://www.shellscript.sh/tips/echo/


```bash
if [ "`echo -n`" = "-n" ]; then
  n=""
  c="\c"
else
  n="-n"
  c=""
fi

echo $n "Enter your name: $c"
read name
echo "Hello, $name"
```
