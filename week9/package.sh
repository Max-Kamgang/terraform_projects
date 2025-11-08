#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo yum install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable 
yum install php php-mysqlnd -
yum install php-gd -
sudo cd /tmp
sudo yum install wget -y