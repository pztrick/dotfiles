#!/bin/bash
# git pulls, pip installs/updates, django migrates, django collects static files, ssar

cd /var/www/gridpar.io/public/
git pull
source /usr/local/bin/virtualenvwrapper.sh
workon gpenv
pip install -r requirements.txt
/var/www/gridpar.io/virtualenv/bin/python /var/www/gridpar.io/public/manage.py migrate
/var/www/gridpar.io/virtualenv/bin/python /var/www/gridpar.io/public/manage.py collectstatic --noinput
sudo service apache2 restart
