#! /bin/bash
export OUTPUTDIR=$(realpath ../distribution-output)
export GOPATH=/app
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
mkdir -p /app/src/github.com/docker
ln -s $(pwd) /app/src/github.com/docker/distribution
cd ~
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -zxf go1.12.5.linux-amd64.tar.gz
mv go /usr/local
cd /app/src/github.com/docker/distribution/
make
./bin/registry -v

wget -O certs.json https://sso.sero.network/auth/realms/RobotOne/protocol/openid-connect/certs
cat <(echo "-----BEGIN CERTIFICATE-----") <(jq -r '.keys[0].x5c[0]' certs.json) <(echo "-----END CERTIFICATE-----") > cert.pem

cp ./bin/registry $OUTPUTDIR
cp ./bin/digest $OUTPUTDIR
cp ./bin/registry-api-descriptor-template $OUTPUTDIR
cp ./ci/manifest.yml $OUTPUTDIR
cp ./ci/start.sh $OUTPUTDIR
cp ./ci/config.yml.template $OUTPUTDIR
cp cert.pem $OUTPUTDIR

ls $OUTPUTDIR
