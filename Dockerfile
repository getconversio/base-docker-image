FROM heroku/heroku:16

WORKDIR /app/user

# The following setup is inspired by the Heroku Node-js dockerfile with some extras and a different node version.

# Which version of node?
ENV NODE_ENGINE 12.13.0

# Locate our binaries
ENV PATH /app/heroku/node/bin/:/app/user/node_modules/.bin:$PATH

# Create some needed directories
RUN mkdir -p /app/heroku/node /app/.profile.d

# Install node
RUN curl -s https://s3.amazonaws.com/heroku-nodebin/node/release/linux-x64/node-v$NODE_ENGINE-linux-x64.tar.gz | tar --strip-components=1 -xz -C /app/heroku/node \
  && echo "export PATH=\"/app/heroku/node/bin:/app/user/node_modules/.bin:\$PATH\"" > /app/.profile.d/nodejs.sh

# Install yarn
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update && apt install -y yarn && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
