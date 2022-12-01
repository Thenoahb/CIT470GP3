#!/bin/bash
# ip variable: ....
yum update -y
yum install sendmail -y
systemctl start sendmail
systemctl enable sendmail
yum install epel-release -y
yum install monit -y
rm /etc/monitrc
# mv client-monitrc file to /etc and change its name to monitrc
systemctl start firewalld
firewall-cmd --zone=public --add-port=2812/tcp --permanent
firewall-cmd --reload
systemctl start monit
