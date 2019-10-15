#!/bin/bash

if [ ! -f /var/lib/postgresql/yes.txt ];do
  /docker-healthcheck.sh /docker-entrypoint.sh
  touch /var/lib/postgresql/yes.txt
else
  tail -f /var/lib/postgresql/yes.txt
done
