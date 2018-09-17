
```console
cat <<'EOF' >> ~/.bashrc
export GOPATH=$HOME/go
export PATH=$PATH:${GOPATH//://bin:}/bin
EOF

. ~/.bashrc
```
