#/bin/bash
set -e

curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /tmp/n
sudo bash /tmp/n lts
sudo npm install -g n
sudo n latest

