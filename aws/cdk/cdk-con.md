

OS

amzlinux2

sensitive data
--

- aws credential
- github token

development environment
--


```
echo "export PROMPT_COMMAND='history -a'" >> ~/.bashrc
echo 'HISTSIZE=100000' >> ~/.bashrc
```


```
sudo yum update -y
```
```
sudo reboot
```


```
mkdir ~/workdir
```

install jq 1.6
```
sudo curl -SsL -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
sudo chmod +x jq
sudo mv jq /usr/local/bin/jq
```


install golang
```
sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo 
sudo yum install -y gcc
sudo yum install -y golang --disablerepo=amzn2-core,amzn2extra-golang* --enablerepo=go-repo
```

install git 2.23.0
```
sudo yum install -y git zlib-devel autoconf 
```
```
cd ~/workdir
git clone -b v2.23.0 https://github.com/git/git
cd git
```
```
make configure
./configure --prefix=/usr
make all
```

```
sudo yum remove -y git
```
```
sudo make install
```

install hub
```
cd ~/workdir
curl -SsL https://github.com/github/hub/releases/download/v2.12.8/hub-linux-amd64-2.12.8.tgz | tar zxvf -
cd hub-linux-amd64-2.12.8/
sudo prefix=/usr/local ./install
```

```
sudo curl -SsL -o /usr/local/bin/hub.bash_completion.sh https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh
sudo chmod 755 /usr/local/bin/hub.bash_completion.sh
```
```
cat <<EOF >> ~/.bashrc
if [ -f $(which hub).bash_completion.sh ]; then
  . $(which hub).bash_completion.sh
fi
EOF
```
```
source ~/.bashrc
```



fish

```
sudo curl -SsL -o /etc/yum.repos.d/shells:fish:release:3.repo  https://download.opensuse.org/repositories/shells:fish:release:/3/RHEL_7/shells:fish:release:3.repo
```
```
sudo yum install -y fish
```
```
mkdir -p touch ~/.config/fish/functions/
touch ~/.config/fish/functions/fish_right_prompt.fish
```

omf
```
curl -SsL https://get.oh-my.fish | fish
```
```
omf install bobthefish
```
```
omf install aws
```

`~/.config/fish/config.fish`
```
alias ef 'vim ~/.config/fish/config.fish'

function reload
  source ~/.config/fish/config.fish
end
```
docker environment
--

Independent docker that is new version 

```
sudo amazon-linux-extras install -y docker
```
```
sudo usermod -a -G docker $(whoami)
# newgrp docker   re-login
```

for building docker enging with DinD
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
cd ~/workdir
git clone -b v19.03.3 https://github.com/docker/engine.git
cd engine
```


`[+] Building 162.6s (67/67) FINISHED`
```
make
```

```
sudo GOPATH=$(go env GOPATH) make install
```

```
sudo systemctl stop docker
```


for root to excute command in /usr/local/bin
```
sudo sed -r -e 's|^(Defaults\s+secure_path.*)|\1:/usr/local/bin|' -i /etc/sudoers
```

run service of docker
```
nohup sudo /usr/local/bin/dockerd -D > /dev/null &
```



install docker cli

```
cd ~/workdir
git clone -b v19.03.3  https://github.com/docker/cli.git
cd cli
```
```
make -f docker.Makefile binary
sudo mv build/docker* /usr/local/bin/
```

```
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc
source  ~/.bashrc
```

```
cat /etc/docker/daemon.json | jq '.|= .+{"features":{"buildkit":true}}'| sudo tee /etc/docker/daemon.json
```

```json
{
  "experimental": true,
  "features": {
    "buildkit": true
  }
}
```

```
sudo kill -HUP $(pgrep dockerd)
```

```
cd ~/workdir
mkdir -p ~/.docker/cli-plugins/
mkdir -p testdir && cd testdir
```

```
docker build --platform=local -o . git://github.com/docker/buildx
mv buildx ~/.docker/cli-plugins/docker-buildx
```




javascript  environment
--
- nvm
- node
- typescript
- yarn

```
curl -SsL -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm install node
nvm alias default node
```



for tsuquyomi
```
npm -g install typescript
```

```
npm -g install yarn
```

editor environemnt
--


- vim
- for vscode
- syntax

```
sudo yum install -y python3-devel ncurses-devel
```
```
cd ~/workdir
git clone -b v8.1.2151 https://github.com/vim/vim.git
cd vim
```
```
 ./configure --enable-python3interp
make
```
```
sudo make install
```
```
sudo yum remove -y vim-enhanced vim-common vim-filesystem
```

vim plugins(vundle)
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


`~/.vimrc`

```vim
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"----custom-start---
Plugin 'prettier/vim-prettier'
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" cd ~/.vim/bundle/vim-prettier/ && yarn install && cd -
let g:prettier#autoformat = 0
let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

Plugin 'fatih/vim-go'
"Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1

" tsuquyomi
Plugin 'quramy/tsuquyomi'
autocmd FileType typescript setlocal completeopt+=menu,preview
" npm -g install typescript

" numbertoggle
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber

" deoplete
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
" pip3 install --user pynvim
let g:deoplete#enable_at_startup = 1

"----custom-end----

call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

```

```
cd ~/.vim/bundle/vim-prettier/ && yarn install && cd -
```
```
npm -g install typescript
```
```
pip3 install --user pynvim
```

aws environment
--

install and configure awscli

```
pip3 install --user awscli
```
```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

```
aws configure set aws_access_key_id xxxxxx
aws configure set aws_secret_access_key yyyyy
aws configure set cli_follow_urlparam false
```


`myprofile=myprofile`
`myses=mysessionname`
```
aws configure --profile $myprof set role_arn arn:aws:iam::000000000000:role/assumegroup
aws configure --profile $myprof set source_profile  default
aws configure --profile $myprof set role_session_name  $myses
```
```
echo "export AWS_DEFAULT_PROFILE=$myprof" >> ~/.bashrc
```
```
source ~/.bashrc
```

check your iam
```
aws sts get-caller-identity
```


completion for fish
```
omf install aws
```
Or attach a IAM role that can operate as a administrator.


fork and clone
--

```
hub clone aws/aws-cdk
```

```
cd aws-cdk
hub fork --remote-name=origin
```

```
git remote -v
```
```
origin  git@github.com:hacker65536/aws-cdk.git (fetch)
origin  git@github.com:hacker65536/aws-cdk.git (push)
upstream        git://github.com/aws/aws-cdk.git (fetch)
upstream        git://github.com/aws/aws-cdk.git (push)
```

```
git branch -u origin/master master
```
```
git status -sb
## master...origin/master
```

alias
--

bash
```bash
# runs an npm script via lerna for a the current module
alias lr='lerna run --stream --scope $(node -p "require(\"./package.json\").name")'

# runs "npm run build" (build + test) for the current module
alias lb='lr build'
alias lt='lr test'

# runs "npm run watch" for the current module (recommended to run in a separate terminal session):
alias lw='lr watch'
```

fish
```fish
# runs an npm script via lerna for a the current module
alias lr 'lerna run --stream --scope (node -p "require(\"./package.json\").name")'

# runs "npm run build" (build + test) for the current module
alias lb 'lr build'
alias lt 'lr test'

# runs "npm run watch" for the current module (recommended to run in a separate terminal session):
alias lw 'lr watch'
```
