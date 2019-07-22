# neovim

install
--


https://github.com/neovim/neovim/wiki/Installing-Neovim


```console
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python{2,3}-neovim
```





problem
--

```
Error: Package: python2-neovim-0.3.2-1.el7.noarch (epel)
           Requires: python-greenlet
 You could try using --skip-broken to work around the problem
 You could try running: rpm -Va --nofiles --nodigest
```
