#!/bin/bash

for folder in {"public","var/cache","var/logs/apache"}; do 
  mkdir -p "$PRPJECT_DIR/$folder"
done
# chown www-data:www-data "$PRPJECT_DIR"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

if [ -f composer.json ]
then
  composer instal
fi

apachectl  -DFOREGROUND -e info
