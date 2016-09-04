require homebrew

install python
------------
デフォルトでもpythonは入っているがsystemのパーミッションに引っかかると色々エラーがでるのでpythonもbrew経由で入れる。
これでpipも入る。
```bash
brew install python
```

check version
-----------
```bash
python --version
```

```bash
pip --version
```


install powerline
-------------
```bash
pip install powerline-status==2.4
```


install fonts 
------------
これがないところどころ文字化けする。
矢印代わりの三角形が？になる。
```bash
cd ~/Desktop
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
```

download iterm2
---------------
https://www.iterm2.com/
```bash
curl -O https://iterm2.com/downloads/stable/iTerm2-3_0_4.zip
unzip iTerm2-3_0_4.zip
```
Settings Fonts
------------
iTerm2->Preferences->Profiles->Text  
Font-> Sauce Code Powerline   
Non-ASCIIFont -> Sauce Code Powerline  

実際の名前は`Source Code For Powerline`で、Search欄にSauceを入力しても出てこない。

color scheme
------------
```bash
git clone https://github.com/altercation/solarized.git
```
iTerm2->Preferences->Profiles->Colors

Color Presets -> import -> iterm2-colors-solarized

select Solarized Dark

window
-------
iTerm2->Preferences->Profiles->Window

* Transparency
* Blur

それぞれ少し設定すると見栄えが良くなる。

vimrc
-----
```vim

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode
```

install tmux
---------
ステータス欄に色々表示される。
```bash
brew install tmux
```
~.tmux.conf
```
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'
run-shell "powerline-daemon -q"
source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
```

zshrc
-------
zshにするとプロンプトが少しおしゃれになる。powerlineと似たスタイルになる。
~/.zshrc
```
source .bashrc
powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
```

finish
------------

```bash
tmux
zsh
```
powerline-damonによって色々情報が送られるのでgitのブランチの状態もステータスに表示される。





失敗例
------

pip を以下の方法でいれてしまうと色々エラーがでる。

```bash
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
```

このやり方だとsudoつけてもエラーが発生する
```
~ $ pip install --user powerline
Collecting powerline
  Using cached powerline-0.2.4.zip
    Complete output from command python setup.py egg_info:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File "/private/var/folders/rv/d69bl1ys56l_4xm2p7pwv5j93dms5f/T/pip-build-iGI2fg/powerline/setup.py", line 27
        zip_safe = False,
    SyntaxError: keyword argument repeated
    
    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /private/var/folders/rv/d69bl1ys56l_4xm2p7pwv5j93dms5f/T/pip-build-iGI2fg/powerline/
```

```bash
pip install --user git+git://github.com/powerline/powerline
```


