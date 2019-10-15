#!/bin/bash

if [ -f /var/lib/postgresql/yes.txt ];then
  tail -f /var/lib/postgresql/yes.txt;
else
  /docker-healthcheck.sh /docker-entrypoint.sh;
  touch /var/lib/postgresql/yes.txt;
fi
