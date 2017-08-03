#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM docker.io/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default /etc/nginx/sites-available/default
COPY ./index.html /var/www/html/index.html

RUN mkdir /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN mkdir -p /tmp/nginx/cache
RUN chmod -R 777 /tmp/nginx

RUN mkdir -p /var/cache/nginx/proxy_temp
RUN chmod -R 777 /var/cache

# Expose ports.
EXPOSE 80
