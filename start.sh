#!/usr/bin/env bash

FILE=/etc/apache2/apdoro.txt

if [ -f "$FILE" ]; then
    echo "APACHE DOCUMENT ROOT already set up!"
else
    sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
    sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
    touch $FILE
fi



exec apache2-foreground
