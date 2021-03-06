FROM node:8-alpine

MAINTAINER K.Kato

RUN apk update \
    && apk add --no-cache --update alpine-sdk build-base python yarn \
    && yarn cache clean \
    && yarn global add @angular/cli@1.4.9 \
    && ng set --global packageManager=yarn \
    && apk del alpine-sdk \
    && rm -rf /tmp/* *.tar.gz ~/.npm \
    && yarn cache clean

USER root
WORKDIR /root
