FROM smartentry/debian:8-0.3.0

MAINTAINER Yifan Gao <docker@yfgao.com>

ADD . $ASSETS_DIR

RUN smartentry.sh build

EXPOSE 80

VOLUME /var/log

ENTRYPOINT ["/sbin/smartentry.sh"]

CMD ["/usr/bin/supervisord"]
