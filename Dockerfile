FROM afsmnghr/alpine-ruby:2.3.0
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

WORKDIR /root
ENV TERM=xterm-256color \
    TZ=Europe/Moscow \
    HOME=/root
RUN apk update && apk upgrade && apk add --no-cache --update \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        bash emacs-nox global git nodejs tzdata \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && rm -rf /tmp/* /var/cache/apk/*
CMD cd .emacs.d && (bundle check || (bundle install \
    && npm install -g eslint babel-eslint \
       eslint-plugin-angular eslint-config-angular)) \
    && emacs
