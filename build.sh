#!/usr/bin/env bash
set -e

build() {
    docker build . \
        -t codeblick/php:${1}-${4} \
        --build-arg COB_PHP_VERSION=${1} \
        --build-arg COB_REDIS_VERSION=${2} \
        --build-arg COB_MEMCACHED_VERSION=${3} \
        --build-arg COB_IMAGE=${4} \
        --build-arg COB_XDEBUG_VERSION=${5} \
        --build-arg COB_APCU_VERSION=${6} \
        -q
}

build 7.2 4.2.0 v3.0.4 apache
build 7.1 4.2.0 v3.0.4 apache
build 7.0 4.2.0 v3.0.4 apache
build 5.6 3.1.6 2.2.0 apache -2.5.5 -4.0.10

build 7.2 4.2.0 v3.0.4 fpm
build 7.1 4.2.0 v3.0.4 fpm
build 7.0 4.2.0 v3.0.4 fpm
build 5.6 3.1.6 2.2.0 fpm -2.5.5 -4.0.10

build 7.2 4.2.0 v3.0.4 cli
build 7.1 4.2.0 v3.0.4 cli
build 7.0 4.2.0 v3.0.4 cli
build 5.6 3.1.6 2.2.0 cli -2.5.5 -4.0.10
