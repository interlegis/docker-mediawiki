#!/bin/sh

/usr/bin/php /var/www/localhost/htdocs/maintenance/install.php --dbtype=mysql --dbname="$WIKI_DB_NAME" --dbserver="$WIKI_DB_HOST" --installdbuser="$WIKI_DB_USER" --installdbpass="$WIKI_DB_PASS" --dbuser="$WIKI_DB_USER" --dbpass="$WIKI_DB_PASS" --server="$WIKI_URL" --scriptpath="" --lang=pt_BR --pass="$WIKI_ADMIN_PASS" "$WIKI_SITE_NAME" "Admin";
