#!/bin/bash

set -e

sed -e "s/PORT/${PORT:-8080}/" \
-e "s,WEBHOOK,${WEBHOOK:-https://chat.sero.network}," \
-e "s/AWSACCESSKEY/$AWS_ACCESS_KEY_ID/" \
-e "s/AWSSECRETKEY/$AWS_SECRET_ACCESS_KEY/" \
-e "s,AWSENDPOINT,$AWS_ENDPOINT," \
-e "s/AWSBUCKETNAME/$AWS_BUCKET/" \
-e "s,AUTHSERVICE,$AUTH_SERVICE," \
-e "s,AUTHREALM,$AUTH_REALM," \
-e "s,AUTHISSUER,$AUTH_ISSUER," \
config.yml.template > config.yml

echo "PORT set to ${PORT:-8080}"
echo "S3 Endpoint set to $AWS_ENDPOINT"
