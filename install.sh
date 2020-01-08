#!/bin/bash

OS=$USER
echo "$OS"

if [ $OS == "centos" ]
then
  curl -sL https://rpm.nodesource.com/setup_13.x | sudo -E bash -
  sudo yum install -y nodejs
elif [ $OS == "ubuntu" ] || [ $OS == "debian" ]
then
  curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "!!!$OS install nodejs failed!!!"
fi

curl -sL -H "Authorization: token 0b429980ba9997e62b7772b6aac5f701354d7c0e" https://raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/index.js > index.js
curl -sL -H "Authorization: token 0b429980ba9997e62b7772b6aac5f701354d7c0e" https://raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/package.json > package.json
curl -sL -H "Authorization: token 0b429980ba9997e62b7772b6aac5f701354d7c0e" https://raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/package-lock.json > package-lock.json

sudo fallocate -l 209715200 200m
sudo npm install -g
sudo ./node_modules/.bin/pm2 start index.js
