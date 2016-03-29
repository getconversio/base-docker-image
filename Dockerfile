FROM ubuntu:14.04

MAINTAINER Stefano Sala <stefano@receiptful.com>

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get -y install curl git libfontconfig1 libjpeg8 libicu52 python openjdk-7-jre-headless

ENV NVM_DIR /usr/local/nvm
ENV NVM_SYMLINK_CURRENT true
ENV NODE_VERSION 5.9.1

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV PATH      $NVM_DIR/current/bin:$PATH
ENV NODE_PATH $NVM_DIR/current/lib/node_modules
