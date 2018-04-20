
install rust
----------
```
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
```
```
# rustc --version
rustc 1.25.0 (84203cac6 2018-03-25)
```


install jupyter
---------
```
yum install -y python-pip python-devel gcc
pip install --upgrade pip
```
```
# pip --version
pip 10.0.1 from /usr/lib/python2.7/site-packages/pip (python 2.7)
```
```
pip install jupyter
```
```
jupyter notebook password
```
```
sed -e "s/#\(c.NotebookApp.ip .*\)/c.NotebookApp.ip = '*'/" -i .jupyter/jupyter_notebook_config.py
```

```
jupyter notebook --allow-root
```


install kernel
---------

ref https://github.com/m0riiiii/jupyter-rust-kernel

```
git clone https://github.com/m0riiiii/jupyter-rust-kernel.git
cd jupyter-rust-kernel.git
sh install.sh
```
