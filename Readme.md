[![Docker Pulls](https://img.shields.io/docker/pulls/codeblick/php.svg)](https://hub.docker.com/r/codeblick/php/)
[![Docker Stars](https://img.shields.io/docker/stars/codeblick/php.svg)](https://hub.docker.com/r/codeblick/php/)

# codeblick/php

## About

This image uses the [official php image](https://hub.docker.com/_/php/) as a base. It contains several additional php modules:

- iconv
- gd
- mcrypt
- mbstring
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

## Usage

```shell
docker run -p 80:80 -v $PWD:/var/www/html codeblick/php:7.1-apache
```

