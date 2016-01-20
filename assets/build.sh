#!/bin/bash

set -e
set -x

apt-get update
apt-get install -qqy nginx esmtp unzip subversion libxml2 libcurl4-openssl-dev sqlite3 libsqlite3-dev wget curl php5-cli php5-dev php5-cli php5-sqlite php5-mysql php5-pgsql php5-mcrypt php5-curl php5-json php5-gd php5-fpm php-pear php-apc php5-intl
apt-get clean -qq
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -O /tmp/ioncube_loaders_lin_x86-64.tar.gz
tar -C /tmp -xzf /tmp/ioncube_loaders_lin_x86-64.tar.gz
cp /tmp/ioncube/ioncube_loader_lin_5.6.so /usr/lib/php5/20131226/
rm -rf /tmp/ioncube /tmp/ioncube_loaders_lin_x86-64.tar.gz
#echo "zend_extension=/usr/lib/php5/20131226/ioncube_loader_lin_5.6.so" >> /etc/php5/fpm/php.ini
#echo "zend_extension=/usr/lib/php5/20131226/ioncube_loader_lin_5.6.so" >> /etc/php5/cli/php.ini
#sed -i "s/remote_addr/http_x_real_ip/g" /etc/nginx/fastcgi_params

php5enmod mcrypt

#echo "daemon off;" >> /etc/nginx/nginx.conf
#echo "fix ownership of sock file for php-fpm as our version of nginx runs as root"
#sed -i -e "s/user www-data/user root/g" /etc/nginx/nginx.conf
#sed -i -e "s/www-data/root/g" /etc/php5/fpm/pool.d/www.conf
#sed -i -e "s/;clear_env = no/clear_env = no/g" /etc/php5/fpm/pool.d/www.conf
#sed -i -e "s/DAEMON_ARGS=\"/DAEMON_ARGS=\"--allow-to-run-as-root /g" /etc/init.d/php5-fpm

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
