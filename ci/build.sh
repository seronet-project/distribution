#! /bin/bash
pwd
ln -s distribution/ /app/src/github.com/docker/distribution
ln -s distribution-output /app/src/github.com/docker/distribution-output
cd ~
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -zxf go1.12.5.linux-amd64.tar.gz
mv go /usr/local
export GOPATH=/app
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
cd /app/src/github.com/docker/distribution/
make
./bin/registry -v

wget -O certs.json https://sso.sero.network/auth/realms/RobotOne/protocol/openid-connect/certs
cat <(echo "-----BEGIN CERTIFICATE-----") <(jq -r '.keys[0].x5c[0]' certs.json) <(echo "-----END CERTIFICATE-----") > cert.pem
cp ./bin/registry ../distribution-output/
cp ./bin/digest ../distribution-output/
cp ./bin/registry-api-descriptor-template ../distribution-output/
cp ./ci/manifest.yml ../distribution-output/
cp ./ci/start.sh ../distribution-output/
cp ./ci/config.yml.template ../distribution-output/
cp cert.pem ../distribution-output/
