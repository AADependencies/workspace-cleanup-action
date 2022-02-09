FROM alpine:latest

RUN apk update && \
  apk add --no-cache --upgrade bash && \
  rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
