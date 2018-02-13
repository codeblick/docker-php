# codeblick/php

## About

This image uses the [official php image](https://hub.docker.com/_/php/) as a base. It contains several additional php modules:

- iconv
- gd
- mcrypt
- mbstring
- mysql
- mysqli
- pdo
- pdo_mysql
- zip
- opcache
- apcu
- xdebug
- curl
- xml
- json
- bcmath
- soap
- tokenizer
- ioncube
- ZendGuardLoader

## Usage

```shell
docker run -p 80:80 -v $PWD:/var/www/html codeblick/php:5.6-apache
```

