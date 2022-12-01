#!/bin/bash
monit summary
echo "All processes are up: "
echo "systemctl stop sshd"
echo "systemctl stop rsyslog"
echo "systemctl stop slapd"
echo "systemctl stop nfs"
echo "systemctl stop httpd"
systemctl stop sshd
systemctl stop rsyslog
systemctl stop slapd
systemctl stop nfs
systemctl stop httpd
echo "Waiting for monit to recognize that the processes are down..."
sleep 1m
monit summary
echo "Waiting for monit to bring the processes back up..."
sleep 2m
monit summary
echo "All processes have been brought back up."
