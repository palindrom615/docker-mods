FROM  ghcr.io/linuxserver/baseimage-alpine:3.13

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

RUN \
    apk add --no-cache \
      --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
      cups\
      cups-pdf \
      cups-filters \
      hplip \
      gutenprint \
    && usermod -aG shadow abc


COPY root/ /

EXPOSE 631
VOLUME /config /var/run/dbus
