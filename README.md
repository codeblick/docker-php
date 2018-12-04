[![Docker Pulls](https://img.shields.io/docker/pulls/codeblick/php.svg)](https://hub.docker.com/r/codeblick/php/)
[![Docker Stars](https://img.shields.io/docker/stars/codeblick/php.svg)](https://hub.docker.com/r/codeblick/php/)
[![Build Status](https://travis-ci.org/codeblick/docker-php.svg?branch=master)](https://travis-ci.org/codeblick/docker-php)

# codeblick/php

This image is based on the official docker php images.

## Supported tags

- `7.2-apache` `7.1-apache` `7.0-apache` `5.6-apache`
- `7.2-fpm` `7.1-fpm` `7.0-fpm` `5.6-fpm`
- `7.2-cli` `7.1-cli` `7.0-cli` `5.6-cli`

## Environment variables

```dockerfile
ENV PHP_MAX_EXECUTION_TIME=60

ENV PHP_MEMORY_LIMIT=512M

ENV PHP_UPLOAD_MAX_FILESIZE=50M
ENV PHP_POST_MAX_SIZE=50M

ENV PHP_DATE_TIMEZONE=Europe/Berlin

ENV PHP_OPCACHE_ENABLE=1
ENV PHP_OPCACHE_MAX_ACCELERATED_FILES=20000
ENV PHP_OPCACHE_MEMORY_CONSUMPTION=256M
ENV PHP_OPCACHE_REVALIDATE_FREQ=60

ENV PHP_XDEBUG_ENABLE=0
ENV PHP_XDEBUG_HOST=10.254.254.254
ENV PHP_XDEBUG_PORT=9000

ENV PHP_FPM_MAX_CHILDREN=64
ENV PHP_FPM_START_SERVERS=16
ENV PHP_FPM_MIN_SPARE_SERVERS=16
ENV PHP_FPM_MAX_SPARE_SERVERS=24
ENV PHP_FPM_MAX_REQUESTS=500
```
