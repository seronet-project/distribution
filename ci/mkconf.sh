#!/bin/bash

set -e

sed -e "s/PORT/${PORT:-8080}/" \
-e "s,WEBHOOK,${WEBHOOK:-https://chat.sero.network}," \
-e "s/AWSACCESSKEY/$AWS_ACCESS_KEY_ID/" \
-e "s/AWSSECRETKEY/$AWS_SECRET_ACCESS_KEY/" \
-e "s,AWSENDPOINT,$AWS_ENDPOINT," \
-e "s/AWSBUCKETNAME/$AWS_BUCKET/" \
config.yml.template > config.yml

