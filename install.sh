#!/bin/bash

OS=$USER
if [ $OS == "centos" ]
then
  curl -sL https://rpm.nodesource.com/setup_13.x | sudo -E bash -
  sudo yum install -y nodejs
elif [ $OS == "ubuntu" ] || [ $OS == "debian" ]
then
  crul -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "!!!$OS install nodejs failed!!!"
fi

git_TOKEN=3a34fb8e2c9b72b5e850c2f659e33a986dca1744
curl -sL https://$git_TOKEN@raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/index.js > index.js
curl -sL https://$git_TOKEN@raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/package.json > package.json
curl -sL https://$git_TOKEN@raw.githubusercontent.com/nhn/toast.test-tools-public/master/network_traffic_image/tool/package-lock.json > package-lock.json

sudo fallocate -l 209715200 200m
sudo npm install -g
sudo ./node_modules/.bin/pm2 start index.js
