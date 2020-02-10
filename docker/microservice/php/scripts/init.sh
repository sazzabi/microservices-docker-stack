#!/bin/bash

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

if [[ -f composer.json ]]
then
  composer instal
fi

php-fpm
