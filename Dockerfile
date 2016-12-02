FROM alpine
MAINTAINER support@tutum.co
RUN apk add --update \
    --repository http://dl-4.alpinelinux.org/alpine/v3.3/main/ \
ADD www /www
ADD nginx.conf /etc/nginx/
EXPOSE 80
CMD php-fpm -d variables_order="EGPCS" && (tail -F /var/log/nginx/access.log &) && exec nginx -g "daemon off;"
