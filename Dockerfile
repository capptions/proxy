FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx_start.sh /usr/local/bin/nginx_start
RUN chmod a+x /usr/local/bin/nginx_start