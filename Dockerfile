FROM php:5.6-apache

RUN apt-get update -qq && \
    apt-get install -y -qq \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        zip && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install \
        iconv \
        mcrypt \
        mbstring \
        gd \
        opcache \
        mysql \
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
        pecl install xdebug-2.5.5 && \
        docker-php-ext-enable xdebug && \
        pecl install APCu-4.0.10 && \
        docker-php-ext-enable apcu && \
        a2enmod rewrite

ADD 00-zend.ini /usr/local/etc/php/conf.d/00-zend.ini
ADD php-config.ini /usr/local/etc/php/conf.d/php-config.ini
ADD ext /usr/local/etc/php/ext

EXPOSE 9000
ENV PHP_IDE_CONFIG="serverName=localhost"