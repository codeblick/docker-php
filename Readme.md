# codeblick/php

##About

This image uses the [official php image](https://hub.docker.com/_/php/) as a base. It contains several additional php modules:

- iconv
- gd
- mcrypt
- mbstring
- pdo
- pdo_mysql
- zip
- opcache
- apcu
- xdebug

## Usage

``````shell
docker run -p 80:80 codeblick/php:7.1-apache
``````

