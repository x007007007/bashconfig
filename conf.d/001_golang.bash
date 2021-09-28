if [[ -d /usr/local/go ]]; then
    export GOPATH=/usr/local/go
    export PATH=$PATH:$GOPATH/bin
fi
