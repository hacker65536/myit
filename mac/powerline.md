require homebrew


デフォルトでもpythonは入っているがsystemのパーミッションに引っかかると色々エラーがでるのでpythonもbrew経由で入れる。
これでpipも入る。
```bash
brew install python
```

```bash
python --version
```

```bash
pip --version
```

```bash
pip install powerline-status==2.4
```


install fonts これがないところどころ文字化けする。
```bash
cd ~/Desktop
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
```

download iterm2

https://www.iterm2.com/
```bash
curl -O https://iterm2.com/downloads/stable/iTerm2-3_0_4.zip
unzip iTerm2-3_0_4.zip
```






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


