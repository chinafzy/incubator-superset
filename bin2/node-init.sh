#!/bin/bash

npm config set registry https://registry.npm.taobao.org && \
  npm install --global webpack webpack-cli && \
  cd /app/superset-frontend && \
  npm install
