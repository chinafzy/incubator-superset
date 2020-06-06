#!/bin/bash

cat  >/etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib 
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib 
deb http://mirrors.aliyun.com/debian-security buster/updates main 
deb-src http://mirrors.aliyun.com/debian-security buster/updates main 
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib 
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib 
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib 
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib 
EOF

apt update \
&& apt install -y --no-install-recommends \
  libsasl2-dev \
  libsasl2-2 \
  libsasl2-modules-gssapi-mit \
&& pip install \
  pyhive \
  thrift \
  thrift_sasl \
  impyla
