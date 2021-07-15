FROM openjdk:8-jdk-alpine

ARG MIRROR=false
ARG TIMEZONE=""

ENV MAVEN_HOST=http://repo1.maven.org/maven2 \
    ALPINE_HOST=dl-cdn.alpinelinux.org \
    MIRROR_MAVEN_HOST=http://maven.aliyun.com/repository/public \
    MIRROR_ALPINE_HOST=mirrors.aliyun.com \
    LANG=en_US.UTF-8

RUN if [ -n "$TIMEZONE" ]; then apk add --no-cache tzdata && \
    cp "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime && \
    echo "$TIMEZONE" >  /etc/timezone ; fi

COPY fonts/* /usr/share/fonts/ttf-dejavu/

# Tini is now available at /sbin/tini
ENTRYPOINT ["/sbin/tini", "--"]
