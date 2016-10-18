#!/bin/bash

yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/spanosg/lamp/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/spanosg/lamp/master/files/info.php

service httpd restart
