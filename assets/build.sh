#!/bin/bash

set -e
set -x

apt-get update
apt-get install -qqy nginx esmtp-run unzip subversion libxml2 libcurl4-openssl-dev sqlite3 libsqlite3-dev wget curl php5-cli php5-dev php5-cli php5-sqlite php5-mysql php5-pgsql php5-mcrypt php5-curl php5-json php5-gd php5-fpm php-pear php-apc php5-intl php5-xmlrpc php5-imap cron
apt-get clean -qq
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install ioncube
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -O /tmp/ioncube_loaders_lin_x86-64.tar.gz
tar -C /tmp -xzf /tmp/ioncube_loaders_lin_x86-64.tar.gz
cp /tmp/ioncube/ioncube_loader_lin_5.6.so /usr/lib/php5/20131226/
rm -rf /tmp/ioncube /tmp/ioncube_loaders_lin_x86-64.tar.gz

# enable mcrypt
php5enmod mcrypt

#install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
