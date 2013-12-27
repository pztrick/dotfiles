#!/bin/bash
# git pulls, ssar

cd /var/www/gridpar.io/public/
git pull
sudo service apache2 restart
