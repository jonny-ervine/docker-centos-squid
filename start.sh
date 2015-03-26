#!/bin/bash
##
## Start up script for squid on CentOS docker container
##

## Initialise any variables being called:
# Set the correct timezone
TZ=${TZ:-UTC}
setup=/etc/squid/.setup

if [ ! -f "${setup}" ]; then
  /usr/sbin/squid -z
  rm -f /etc/localtime
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  touch $setup
fi

## Start up squid web caching server daemon via supervisord
/usr/bin/supervisord -n -c /etc/supervisord.conf
