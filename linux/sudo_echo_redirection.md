
```
sudo echo "aaa" > /usr/local/src/test
-bash: /usr/local/src/test: Permission denied
```



```bash
sudo sh -c "echo 'aaa' >> /usr/local/src/test"
```


or



```bash
echo "aaa" | sudo tee --append /usr/local/src/test
```

recommend 
