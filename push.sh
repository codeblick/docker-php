#!/usr/bin/env bash
set -e

push() {
    docker push codeblick/php:${1}
}

docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}

push 7.2-apache
#push 7.1-apache
#push 7.0-apache
#push 5.6-apache

#push 7.2-fpm
#push 7.1-fpm
#push 7.0-fpm
#push 5.6-fpm

#push 7.2-cli
#push 7.1-cli
#push 7.0-cli
#push 5.6-cli
