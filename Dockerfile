FROM alpine:3.6
MAINTAINER David Antaramian <david@timber.io>

RUN set -ex; \
    apk update; \
    apk add --no-cache \
      bash \
      curl \
      docker \
      git \
      openssh \
      sed \
      tar \
      ; \
    mkdir -p /usr/local/src; \
    curl -Lo /usr/local/src/grease.tar.gz https://github.com/timberio/grease/releases/download/v1.0.1/grease-1.0.1-linux-amd64.tar.gz; \
    tar xzf /usr/local/src/grease.tar.gz -C /usr/local/src; \
    mv /usr/local/src/grease/bin/grease /usr/local/bin/grease; \
    rm -rf /usr/local/src; \
    mkdir -p /lib64; \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2;
