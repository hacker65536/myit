
```
sudo amazon-linux-extras install -y docker golang1.11
```


```
sudo usermod -a -G docker $(whoami)
newgrp docker
```


```
cat <'EOF' | sudo tee /etc/docker/daemon.json
{
    "experimental": true
}
EOF
```
