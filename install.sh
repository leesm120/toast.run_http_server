#!/bin/bash

if [ $pwd=="/home/ubuntu" ] || [ $pwd=="/home/debian" ]
then
  apt-get install xz-utils
fi

wget https://nodejs.org/dist/latest-v10.x/node-v10.19.1-linux-x64.tar.xz
tar xf node-v10.18.1-linux-x64.tar.xz

export PATH=./node-v10.18.1-linux-x64/bin/:$PATH

curl -sL https://raw.githubusercontent.com/leesm120/test.public/master/tool/index.js > index.js
curl -sL https://raw.githubusercontent.com/leesm120/test.public/master/tool/package.json > package.json
curl -sL https://raw.githubusercontent.com/leesm120/test.public/master/tool/package-lock.json > package-lock.json

fallocate -l 209715200 200m
npm install -g
./node_modules/.bin/pm2 start index.js
