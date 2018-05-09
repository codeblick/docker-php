FROM php:7.1-apache

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
    docker-php-ext-enable apcu && \
    a2enmod rewrite && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=AT/ST=Vienna/L=Vienna/O=Security/OU=Development/CN=example.com" && \
    a2ensite default-ssl && \
    a2enmod ssl

ADD 00-zend.ini /usr/local/etc/php/conf.d/00-zend.ini
ADD php-config.ini /usr/local/etc/php/conf.d/php-config.ini
ADD ext /usr/local/etc/php/ext

EXPOSE 9000
ENV PHP_IDE_CONFIG="serverName=localhost"
