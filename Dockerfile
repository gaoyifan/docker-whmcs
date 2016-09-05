FROM smartentry/debian:jessie-0.3.2

MAINTAINER Yifan Gao <docker@yfgao.com>

ADD . $ASSETS_DIR

RUN smartentry.sh build

EXPOSE 80

VOLUME /var/log

CMD ["/usr/bin/supervisord"]
