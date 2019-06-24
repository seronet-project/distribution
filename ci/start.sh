#!/bin/bash

set -e

sed -e "s/PORT/$PORT/" \
-e "s/AWSACCESSKEY/$AWS_ACCESS_KEY_ID/" \
-e "s/AWSSECRETKEY/$AWS_SECRET_ACCESS_KEY/" \
-e "s,AWSENDPOINT,$AWS_ENDPOINT," \
-e "s/AWSBUCKETNAME/$AWS_BUCKET/" \
config.yml.template > config.yml

echo "Docker Registry port set to ${PORT}."
./registry serve config.yml
