FROM ubuntu:12.04

RUN apt-get update && \
    apt-get install -y \
        apache2 \
        php5 \
        libapache2-mod-php5 \
        php5-gd \
        php5-mysql \
        php5-json \
        php5-curl && \
    a2enmod rewrite

ADD 000-default /etc/apache2/sites-enabled/000-default
ADD 00-zend.ini /etc/php5/conf.d/00-zend.ini
ADD php-config.ini /etc/php5/conf.d/php-config.ini
ADD ext /etc/php5/ext

VOLUME ["/var/www/html"]
EXPOSE 80

CMD bash -c "source /etc/apache2/envvars && /usr/sbin/apache2 -DFOREGROUND"
