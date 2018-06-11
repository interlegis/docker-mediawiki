#!/bin/sh

if [ ! -f /var/wikidata/placeholder ]; then
  chown -R apache:apache /var/wikidata
  echo "placeholder" > /var/wikidata/placeholder
fi
chown apache:apache /var/wikidata

exec /usr/sbin/httpd -D FOREGROUND
