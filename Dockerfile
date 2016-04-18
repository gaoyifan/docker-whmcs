FROM debian:jessie
MAINTAINER Yifan Gao <git@gaoyifan.com>

ENV CACHE_DIR="/srv/docker"

ENV TEMPLATES_DIR="${CACHE_DIR}/templates" \
    ATTRIBUTE_FIX_LIST="${CACHE_DIR}/attribute_fix_list" \
    DEFAULT_ENV="${CACHE_DIR}/default_env" \
    MD5_CHECKLIST="${CACHE_DIR}/checklist" \
    BUILD_SCRIPT="${CACHE_DIR}/build.sh"

COPY assets $CACHE_DIR

COPY entrypoint/entrypoint.sh /sbin/entrypoint.sh

RUN /sbin/entrypoint.sh build

ENTRYPOINT ["/sbin/entrypoint.sh"]

EXPOSE 80

VOLUME /var/log

CMD ["/sbin/start.sh"]
