https://asciinema.org/docs/installation

## pip
```
yum install python3 -y
sudo pip3 install asciinema
```

## running in  docker 
default command run in acontainer is `asciinema rec`

```
docker pull asciinema/asciinema
docker run --rm -ti -v "$HOME/.config/asciinema":/root/.config/asciinema asciinema/asciinema
```
Ctrl-D or type "exit" to finish.


manually start 
```
docker run --rm -ti -v "$HOME/.config/asciinema":/root/.config/asciinema asciinema/asciinema /bin/bash
root@6689517d99a1:~# apt-get install somepackage
root@6689517d99a1:~# asciinema rec
```


get token to connect 
```
asciinema auth
```
```
Open the following URL in a browser to register your API token and assign any recorded asciicasts to your profile:
https://asciinema.org/connect/<your-api-token-here>
```


https://asciinema.org/docs/config

sample config
```
[api]
token = <your-api-token-here>
url = https://asciinema.example.com

[record]
command = /bin/bash -l
maxwait = 2
yes = true
quiet = true

[play]
maxwait = 1
```
