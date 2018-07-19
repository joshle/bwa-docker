FROM alpine:3.7

MAINTAINER Joshle "joshle@qq.com"

ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

RUN apk upgrade --update \
    && apk add --no-cache bash ca-certificates tzdata \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/*

ADD bwa /bwa
ENTRYPOINT ["/bwa"]

