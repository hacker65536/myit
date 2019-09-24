
prepare pkg
--
```
sudo amazon-linux-extras install -y docker golang1.11
```

experimental true
--
```
cat <<'EOF' | sudo tee /etc/docker/daemon.json
{
    "experimental": true
}
EOF
```


run docker for build
--
```
sudo systemctl start docker
```

chgrp 
--

```
sudo usermod -a -G docker $(whoami)
newgrp docker
```

download source and make
--
```
git clone -b v19.03.2 https://github.com/docker/engine.git
cd engine
export GOPATH=$(go env GOPATH)
make 
```

install
--
```
sudo GOPATH=$(go env GOPATH) make install
```
