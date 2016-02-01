#! /bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive

if [ -z "$1" ]; then
    exit 1
fi

mkdir -p /var/vagrant

apt-get update
apt-get upgrade -y

if [ ! -f /var/vagrant/mysql-server ]; then
    echo "mysql-server mysql-server/root_password password $1" \
        | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password $1" \
        | debconf-set-selections

    apt-get install mysql-server

    touch /var/vagrant/mysql-server
fi

if [ ! -f /var/vagrant/mysql-server-config ]; then
    cp /vagrant/etc/lr-dev.cnf /etc/mysql/mysql.conf.d/z_liferay.cnf
    
    sed "s/{{password}}/$1/" /vagrant/etc/init-db.sql | mysql -uroot -p$1

    service mysql restart
    
    touch /var/vagrant/mysql-server-config
fi
