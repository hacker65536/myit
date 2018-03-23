
https://www.google.com/linuxrepositories/


ubuntu
-----------
```
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```

```
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable
```
