FROM ubuntu:14.04

MAINTAINER Stefano Sala <stefano@receiptful.com>

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get -y install curl git libfontconfig1 libjpeg8 libicu52 python

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
