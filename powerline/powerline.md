

for amzlinux
```
sudo pip install --upgrade pip
```
```
pip install --user powerline-status

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

```
cat <<'EOF' >> ~/.bashrc
export PATH=/usr/local/bin:/home/ec2-user/.local/bin/:$PATH

export TERM="screen-256color"

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  .  ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
EOF
```

```
chmod +x ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
```

vimrc

```
cat <<'EOF' >> ~/.vimrc
set  rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
EOF
```
