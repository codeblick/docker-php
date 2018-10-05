FROM php:7.0-fpm

ENV PHP_IDE_CONFIG="serverName=localhost"
ENV PHP_XDEBUG=0
ENV PHP_MEMORY_LIMIT=512M
ENV PHP_MAX_EXECUTION_TIME=60
ENV UPLOAD_MAX_FILE_SIZE=50M
ENV POST_MAX_FILE_SIZE=50M
ENV OPCACHE_ENABLE=1

RUN apt-get update -qq && \
    apt-get install -y -qq \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        zip && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install \
        iconv \
        mbstring \
        gd \
        opcache \
        mysqli \
        pdo \
        pdo_mysql \
        curl \
        xml \
        json \
        bcmath \
        soap \
        tokenizer \
        zip && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    pecl install apcu && \
    docker-php-ext-enable apcu

ADD 00-zend.ini /usr/local/etc/php/conf.d/00-zend.ini
ADD php-config.ini /usr/local/etc/php/conf.d/php-config.ini
ADD ext /usr/local/etc/php/ext

EXPOSE 9009
