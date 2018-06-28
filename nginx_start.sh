#! /bin/sh
set -ex
cat /etc/nginx/nginx.conf
nginx -g 'daemon off;'