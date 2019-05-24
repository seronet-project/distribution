#! /bin/bash
# wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
cd ~
tar -zxf go1.12.5.linux-amd64.tar.gz
mv go /usr/local
export GOPATH=/app
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
cd /app/src/github.com/docker/distribution/
make