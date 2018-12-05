ARG COB_IMAGE
ARG COB_PHP_VERSION

FROM php:${COB_PHP_VERSION}-${COB_IMAGE}

ARG COB_IMAGE
ARG COB_PHP_VERSION
ARG COB_REDIS_VERSION
ARG COB_MEMCACHED_VERSION
ARG COB_XDEBUG_VERSION
ARG COB_APCU_VERSION

# PHP Config
ENV PHP_MAX_EXECUTION_TIME=60
ENV PHP_MEMORY_LIMIT=512M
ENV PHP_UPLOAD_MAX_FILESIZE=50M
ENV PHP_POST_MAX_SIZE=50M
ENV PHP_DATE_TIMEZONE=Europe/Berlin
ENV PHP_OPCACHE_ENABLE=1
ENV PHP_OPCACHE_MAX_ACCELERATED_FILES=20000
ENV PHP_OPCACHE_MEMORY_CONSUMPTION=256M
ENV PHP_OPCACHE_REVALIDATE_FREQ=60

ENV PHP_FPM_MAX_CHILDREN=64
ENV PHP_FPM_START_SERVERS=16
ENV PHP_FPM_MIN_SPARE_SERVERS=16
ENV PHP_FPM_MAX_SPARE_SERVERS=24
ENV PHP_FPM_MAX_REQUESTS=500

ENV PHP_XDEBUG_ENABLE=0
ENV PHP_XDEBUG_HOST=10.254.254.254
ENV PHP_XDEBUG_PORT=9000

COPY php-config.ini /usr/local/etc/php/conf.d/php-config.ini
COPY envvars /etc/apache2/envvars
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# ionCube Loader
COPY ioncube/ioncube_loader_lin_${COB_PHP_VERSION}.so /usr/local/etc/php/ext/ioncube_loader_lin_${COB_PHP_VERSION}.so

ARG COB_PHP_VERSION
RUN echo "zend_extension=/usr/local/etc/php/ext/ioncube_loader_lin_${COB_PHP_VERSION}.so" > /usr/local/etc/php/conf.d/00-zend.ini && \
    # miscellanious php extensions and dependencies
    apt-get update -qq && \
    apt-get install -y -qq \
        libmemcached-dev \
        curl \
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
    pecl install xdebug${COB_XDEBUG_VERSION} && \
    docker-php-ext-enable xdebug && \
    pecl install apcu${COB_APCU_VERSION} && \
    docker-php-ext-enable apcu && \
    # memcached php extension
    curl -L -o /tmp/memcached.tar.gz https://github.com/php-memcached-dev/php-memcached/archive/${COB_MEMCACHED_VERSION}.tar.gz && \
    mkdir -p /usr/src/php/ext/memcached && \
    tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 && \
    docker-php-ext-configure memcached && \
    docker-php-ext-install memcached && \
    rm /tmp/memcached.tar.gz && \
    # redis php extension
    curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${COB_REDIS_VERSION}.tar.gz && \
    tar xfz /tmp/redis.tar.gz && \
    rm -r /tmp/redis.tar.gz && \
    mkdir -p /usr/src/php/ext && \
    mv phpredis-* /usr/src/php/ext/redis && \
    docker-php-ext-install redis && \
    # mcrypt for php < 7.2
    if [ "${COB_PHP_VERSION}" != "7.2" ] ; then apt-get install -y -qq libmcrypt-dev && docker-php-ext-install mcrypt ; fi && \
    # some apache modules
    if [ "${COB_IMAGE}" = "apache" ] ; then a2enmod rewrite && a2enmod headers && a2enmod expires; fi
