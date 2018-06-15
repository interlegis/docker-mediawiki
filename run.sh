#!/bin/sh

# Se não existe wikidata, então é instalação inicial
if [ ! -d /var/wikidata ]; then
  mkdir /var/wikidata
fi

if [ ! -f /var/wikidata/dummy ]; then 
  chown -R apache:apache /var/wikidata
  echo "placeholder" > /var/wikidata/dummy
  cp /var/www/localhost/htdocs/LocalSettings.php /var/www/localhost/htdocs/LocalSettings.php
fi

# Atribui proprietário do moodledata e config.php
chown apache:apache /var/www/localhost/htdocs/ -R
chown apache:apache /var/wikidata -R

# Inicializa o servidor web
exec /usr/sbin/httpd -D FOREGROUND
