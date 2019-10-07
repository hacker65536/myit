
```
sudo amazon-linux-extras install -y docker golang1.11
```


```
sudo usermod -a -G docker $(whoami)
newgrp docker
```


```
cat <<'EOF' | sudo tee /etc/docker/daemon.json
{
    "experimental": true
}
EOF
```

```
sudo systemctl start docker
```

```
sudo yum install -y device-mapper-devel
```

```
git clone -b v19.03.2 https://github.com/docker/engine.git
cd engine
```

```
make
sudo GOPATH=$(go env GOPATH) make install
```

```
sudo systemctl stop docker
```

```
sudo sed -r -e 's|^(Defaults\s+secure_path.*)|\1:/usr/local/bin|' -i /etc/sudoers
```
```
sudo /usr/local/bin/dockerd -D
```


```
git clone -b v19.03.2  https://github.com/docker/cli.git
cd cli
```

```
make -f docker.Makefile binary
sudo mv build/docker* /usr/local/bin/
```

```
sudo yum remove -y docker
```

```
mkdir -p ~/.docker/cli-plugins/
mkdir -p testdir && cd testdir
export DOCKER_BUILDKIT=1
docker build --platform=local -o . git://github.com/docker/buildx
mv buildx ~/.docker/cli-plugins/docker-buildx
```


```
curl -SsL -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
source ~/.bashrc
nvm install --lts
```

```
sudo curl -SsL -o /etc/yum.repos.d/shells:fish:release:3.repo  https://download.opensuse.org/repositories/shells:fish:release:/3/RHEL_7/shells:fish:release:3.repo
sudo yum install -y fish
```

```
curl -SsL https://get.oh-my.fish | fish
```

```
omf install bobthefish
```
