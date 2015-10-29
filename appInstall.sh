#!/bin/bash

# Updating repository
echo "Installing mysql"
sudo apt-get -y update

# Installing MySQL and it's dependencies, Also, setting up root password for MySQL as it will prompt to enter the password during installation

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password welcome1'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password welcome1'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql

echo "Downloading dbsetup file"
sudo wget -O /tmp/dbsetup.sql http://54.202.69.46/dbsetup.sql

echo "excuting dbsetup script"
mysql -u root -pwelcome1  < /tmp/dbsetup.sql

echo "installing JDK"
sudo apt-get -y install default-jdk

echo "installing tomcat7"
sudo apt-get -y install tomcat7

echo "updating the server configuration"
# place tomcat customizations here
sudo sed -ie 's/port\=\"8080\"/port\=\"80\"/' /etc/tomcat7/conf/server.xml

echo "Downloading petclinic war"
sudo wget -O /var/lib/tomcat7/webapps/petclinic.war http://54.202.69.46/petclinic.war
cd /var/lib/tomcat7/webapps
mkdir petclinic
cd petclinic
jar xvf /var/lib/tomcat7/webapps/petclinic.war/

echo "Updating wat file"
sudo sed -ie 's/%DB_TIER_IP%/localhost/' /var/lib/tomcat7/webapps/petclinic/WEB-INF/classes/jdbc.properties

echo "Startgint the tomcat7"
sudo service tomcat7 restart